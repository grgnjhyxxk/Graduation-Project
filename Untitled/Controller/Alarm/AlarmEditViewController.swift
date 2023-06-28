//
//  AlarmEditViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/13.
//

import UIKit

class AlarmEditViewController: AlarmAddViewController {
    
    var alarmIndex = Int()
    
    let deleteButton = CommonView().deleteButton(text: "알람 삭제")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("알람수정화면이 로드되었습니다.")
        layout()
        navigationControllerLayout()
        datePickerSetting()
        repeatDaysDataReverseContraction(index: alarmIndex)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func layout() {
        view.addSubview(deleteButton)

        deleteButton.snp.makeConstraints { make in
            make.top.equalTo(warningLabel.snp.bottom).offset(25)
            make.leading.equalTo(commonUiView)
            make.trailing.equalTo(commonUiView)
            make.height.equalTo(45)
        }
        
        deleteButton.addTarget(self, action: #selector(deleteButtonAction), for: .touchUpInside)
    }
    
    private func datePickerSetting() {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "HH:mm"

        // "10:30"와 같은 시간 문자열
        let timeString = userAlarmDataList[alarmIndex].date
        
        if let date = dateFormatter.date(from: timeString) {
            // `dateFormatter.date(from:)` 메소드를 사용하여 `timeString`을 `Date` 객체로 변환
            datePicker.date = date // date picker의 날짜와 시간을 설정
        }
    }
    
    private func navigationControllerLayout() {
        navigationItem.title = "알람 편집"
        
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonAction))
        cancelButton.tintColor = .appTextColor
        navigationItem.leftBarButtonItem = cancelButton
        
        let eidtButton = UIBarButtonItem(title: "편집", style: .done, target: self, action: #selector(eidtButtonAction))
        eidtButton.tintColor = .appPointColor
        navigationItem.rightBarButtonItem = eidtButton
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appTextColor!]
    }
    
    @objc func eidtButtonAction() {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "HH:mm"
        let timeString = dateFormatter.string(from: datePicker.date)

        if alarmTextFieldText == "" {
            alarmTextFieldText = "알람"
        }
        
        var box = String()
        
        for i in 0..<alarmViewBoxinSelectDataList.count {
            if alarmViewBoxinSelectDataList[i].checkState == true {
                if !box.isEmpty {
                    box += " "
                }
                box += "\(i+1)"
            }
        }
              
        if !box.isEmpty {
            alarmEditDataList.append(AlarmViewCellDataModel(date: timeString, repeatDays: repeatDaysDataContractionText, label: alarmTextFieldText, box: box))
            alarmEditNetworking(index: alarmIndex) { success in
                if success {
                    let seq = userDataList[0].seq
                    userAlarmDataList.removeAll()
                    getAlarmData(seq: seq) { success in
                        if success {
                            alarmAddDataInit()
                            alarmViewCellDataListInit()
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "AlarmEditedNotification"), object: self.alarmIndex)
                            
                            self.dismiss(animated: true, completion: nil)
                        } else {
                            print("알람 편집 실패")
                        }
                    }
                } else {
                    print("알람 편집 실패")
                }
            }
        } else {
            warningLabel.text = "보관함을 1개 이상 선택하셔야 합니다."
            warningLabel.isHidden = false
        }
    }
    
    private func ingredientsNameConcatenated() -> String {
        var names: [String] = []
        
        for i in 0..<alarmViewBoxinSelectDataList.count {
            if alarmViewBoxinSelectDataList[i].checkState == true {
                names.append("\(i+1)번")
            }
        }
        
        print(names)
        
        var concatenatedNames = ""

        if names.count <= 3 {
            concatenatedNames = names.joined(separator: ", ")
        } else {
            let firstThreeNames = names.prefix(3).joined(separator: ", ")
            concatenatedNames = "\(firstThreeNames) + \(names.count - 3)"
        }

        if concatenatedNames != "" {
            return concatenatedNames
        } else {
            return "선택안함"
        }
    }
    
    // AlarmEditedNotification
    @objc func deleteButtonAction(_ sender: UIButton) {
        alarmDelete(index: alarmIndex) { success in
            if success {
                userAlarmDataList.remove(at: self.alarmIndex)
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "AlarmDeletedNotification"), object: self.alarmIndex)

                self.dismiss(animated: true, completion: nil)
            } else  {
                print("알람 삭제 실패")
            }
        }
    }
    
    override func repeatDaysButtonAction() {
        let rootViewController = RepeatDaysSelectViewController()
        show(rootViewController, sender: nil)
    }
    
    override func boxSelectButtonAction() {
        print("사용자가 보관함 설정 Cell을 클릭하였습니다.")
        let rootViewController = AlarmBoxSelectViewController()
        show(rootViewController, sender: nil)
    }
}

extension AlarmEditViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AlarmAddViewCellData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmAddViewTableCell", for: indexPath) as! AlarmAddViewTableCell
        
        cell.clipsToBounds = true
        cell.backgroundColor = UIColor.clear

        let titlaLabelText = AlarmAddViewCellData[indexPath.row].title
        
        switch indexPath.row {
        case 0:
            cell.hiddenFucntion(titleLabelText: titlaLabelText, greaterthanBool: false, repeatDaysLabelBool: false, textFieldBool: true, boxLabelBool: true)
            let data = repeatDaysSelectList.filter { $0.checkState }.map { $0.title }.joined(separator: " ").isEmpty ? "안함" : repeatDaysSelectList.filter { $0.checkState }.map { $0.title }.joined(separator: " ")
            cell.repeatDaysLabel.text = repeatDaysDataContraction(data: data)
        case 1:
            cell.hiddenFucntion(titleLabelText: titlaLabelText, greaterthanBool: true, repeatDaysLabelBool: true, textFieldBool: false, boxLabelBool: true)
            cell.textField.text = userAlarmDataList[alarmIndex].label
        case 2:
            cell.hiddenFucntion(titleLabelText: titlaLabelText, greaterthanBool: false, repeatDaysLabelBool: true, textFieldBool: true, boxLabelBool: false)
//            cell.numOfBoxTextField.text = String(userAlarmDataList[alarmIndex].numOfBox)
            if !alarmViewBoxinSelectDataList.isEmpty {
                cell.boxLabel.text = ingredientsNameConcatenated()
            } else {
                cell.boxLabel.text = "안함"
            }        default:
            break
        }
        
        if indexPath.row == 1 {
            cell.selectionStyle = .none
        } else {
            cell.selectionStyle = .default
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? AlarmAddViewTableCell else {
            return
        }
        switch indexPath.row {
        case 0:
            repeatDaysButtonAction()
        case 1:
            cell.textField.becomeFirstResponder()
        case 2:
            boxSelectButtonAction()
        default:
            break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)

    }
}
