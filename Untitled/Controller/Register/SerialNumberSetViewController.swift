//
//  SerialNumberSetViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/13.
//

import UIKit
import SnapKit
import AnyFormatKit

class SerialNumberSetViewController: RegisterRootViewController {
    
    var subViewList: [UIView] = []
    
    let mainTextLabel = RegisterView().mainTextLabel(setText: "기기의 시리얼 넘버를\n입력해주세요.")
    let serialNumberSubTextLabel = RegisterView().subTextLabel(setText: "시리얼 넘버")
    let warningLabel = RegisterView().warningLabel()

    let serialNumberSetTextField = RegisterView().textField(setPlaceholder: "XXXX-XXXX-XXXX-XXXX")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("시리얼넘버등록화면이 로드되었습니다.")
        addSubview()
        viewLayout()
        navigationControllerLayout()
        delegateFunction()
    }
    
    private func viewLayout() {
        mainTextLabel.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.leading.equalTo(30)
        }
        
        serialNumberSubTextLabel.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(30)
            make.leading.equalTo(30)
        }
        
        serialNumberSetTextField.snp.makeConstraints { make in
            make.top.equalTo(serialNumberSubTextLabel.snp.bottom).offset(10)
            make.leading.equalTo(serialNumberSubTextLabel).offset(-0.5)
            make.trailing.equalTo(-30)
            make.height.equalTo(40)
        }
        
        warningLabel.snp.makeConstraints { make in
            make.top.equalTo(serialNumberSetTextField.snp.bottom).offset(15)
            make.leading.equalTo(serialNumberSubTextLabel)
        }
        
        serialNumberSetTextField.textAlignment = .center
        serialNumberSetTextField.keyboardType = .decimalPad
    }
    
    private func addSubview() {
        subViewList = [mainTextLabel, serialNumberSubTextLabel, serialNumberSetTextField, warningLabel]
        
        for uiView in subViewList {
            view.addSubview(uiView)
        }
    }
    
    private func navigationControllerLayout() {
        navigationItem.title = "계정 생성"
        
        let backButton = UIBarButtonItem(title: "이전", style: .plain, target: self, action: #selector(backButtonAction))
        backButton.tintColor = .appTextColor
        navigationItem.leftBarButtonItem = backButton
        
        let doneButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(doneButtonAction))
        doneButton.tintColor = .appPointColor
        navigationItem.rightBarButtonItem = doneButton
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appTextColor!]
    }
    
    private func checkTextFieldsAreFilled() -> Bool {
        for textField in [serialNumberSetTextField] {
            if textField.text?.isEmpty ?? true {
                return false
            }
        }
        return true
    }
    
    private func delegateFunction() {
        serialNumberSetTextField.delegate = self
    }
    
    private func checkList() {
        for userAccountData in userAccountDataList {
            print("UserID: \(userAccountData.userid)")
            print("UserPassword: \(userAccountData.userpassword)")
            print("SerialNumber: \(userAccountData.serialNumber)")

            for user in userAccountData.users {
                print("UserName: \(user.userName)")
                print("UserBirth: \(user.userBirth)")
                print("UserGender: \(user.userGender)")
                // UIImage는 출력이 불가능하므로 생략
            }
        }
    }
    
    @objc func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func doneButtonAction() {
        if !checkTextFieldsAreFilled() {
            warningLabel.text = "모든 값을 입력하셔야 합니다."
            warningLabel.isHidden = false
        } else if serialNumberSetTextField.text?.count != 19 {
            warningLabel.text = "시리얼 넘버의 길이는 16자리여야 합니다."
            warningLabel.isHidden = false
        } else {
            let serialNumber = serialNumberSetTextField.text!.replacingOccurrences(of: "-", with: "")
            userAccountDataList[userAccountDataList.count - 1].serialNumber = Int(serialNumber)!
            checkList()
            sendUserDataToServer(userData: userAccountDataList) { success in
                if success {
                    self.dismiss(animated: true)
                    userAccountDataListInit()
                } else {
                    
                }
            }
        }
    }
}

extension SerialNumberSetViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        guard let text = textField.text else {
            return false
        }
        let characterSet = CharacterSet(charactersIn: string)
        if CharacterSet.decimalDigits.isSuperset(of: characterSet) == false {
            return false
        }

        let formatter = DefaultTextInputFormatter(textPattern: "####-####-####-####")
        let result = formatter.formatInput(currentText: text, range: range, replacementString: string)
        textField.text = result.formattedText
        let position = textField.position(from: textField.beginningOfDocument, offset: result.caretBeginOffset)!
        textField.selectedTextRange = textField.textRange(from: position, to: position)
        return false
    }
}
