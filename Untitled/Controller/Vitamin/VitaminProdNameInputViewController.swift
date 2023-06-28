//
//  VitaminProdNameInputViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/06/02.
//

import UIKit
import SnapKit

class VitaminProdNameInputViewController: UIViewController {
    
    var uiViewList: [UIView] = []
    
    let textField = RegisterView().textField(setPlaceholder: "")
    
    let mainTextLabel = RegisterView().mainTextLabel(setText: "영양제 제품명을\n정확하게 입력해주세요.")
    let subTextLabel = CommonView().commonTextLabel(labelText: "입력시 원활한 정보제공을 위해\n제품명을 정확하게 입력해주시기 바랍니다.", size: 12)
    let titleLabel = CommonView().commonTextLabel(labelText: "", size: 12)
    let warningLabel = RegisterView().warningLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        viewLayout()
        navigationControllerLayout()
        hideKeyboardWhenTappedAround()
        delegateFunction()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appMainBackgroundColor
        
        let dividerView = UIView(frame: CGRect(x: 0, y: navigationController?.navigationBar.frame.maxY ?? 0, width: view.frame.width, height: 1))
        dividerView.backgroundColor = UIColor.systemGray6
        navigationController?.view.addSubview(dividerView)
        
        mainTextLabel.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.leading.equalTo(15)
        }
        
        subTextLabel.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(0)
            make.leading.equalTo(mainTextLabel)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(subTextLabel.snp.bottom).offset(30)
            make.leading.equalTo(15)
        }
        
        textField.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(40)
        }
       
        warningLabel.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(5)
            make.leading.equalTo(textField)
        }
        
        titleLabel.textColor = UIColor.systemGray
        titleLabel.text = "영양제 제품명을 입력해주세요"
        titleLabel.font = UIFont(name: "Roboto-Regular", size: 14)
        textField.placeholder = "Ex) 센트룸 맨"
        textField.font = UIFont(name: "Roboto-Regular", size: 17)
    }
    
    private func addSubview() {
        uiViewList = [textField, titleLabel, warningLabel, mainTextLabel, subTextLabel]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func navigationControllerLayout() {
        navigationItem.title = "사용자 이름"
        
        let cancelButton = UIBarButtonItem(title: "뒤로", style: .plain, target: self, action: #selector(cancelButtonAction))
        cancelButton.tintColor = UIColor.appTextColor
        navigationItem.leftBarButtonItem = cancelButton
        
        let saveButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(saveButtonAction))
        saveButton.tintColor = UIColor.appPointColor
        navigationItem.rightBarButtonItem = saveButton
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appTextColor!]
    }
    
    private func delegateFunction() {
        textField.delegate = self
    }
    
    @objc func cancelButtonAction(_ sender: UIBarButtonItem) {
        totalInit()
        dismiss(animated: true)
    }
    
    @objc func saveButtonAction(_ sender: UIBarButtonItem) {
        if textField.text != "" {
            let prodname = textField.text
            if prodname != "센트룸 맨" {
                sleep(2)
                print("DB에 없는 영양소.")
                let viewController = VitaminAddViewController()
                self.show(viewController, sender: nil)
            } else {
                getSearchVitamin(prodname: prodname!) { success in
                    if success {
                        self.show(VitaminSearchAddViewController(), sender: nil)
                    }
                }
            }
        } else {
            if textField.text == "" {
                warningLabel.text = "제품명을 입력하셔야 합니다."
                warningLabel.isHidden = false
            }
        }
    }
}

extension VitaminProdNameInputViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.textField {
            textField.resignFirstResponder()
        }
        
        return true
    }
}
