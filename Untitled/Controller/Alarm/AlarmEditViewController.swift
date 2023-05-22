//
//  AlarmEditViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/13.
//

import UIKit

class AlarmEditViewController: AlarmAddViewController {
    
    var alarmIndex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("알람수정화면이 로드되었습니다.")
        navigationControllerLayout()
        datePickerSetting()
        repeatDaysDataReverseContraction(index: alarmIndex)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func datePickerSetting() {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "HH:mm"

        // "10:30"와 같은 시간 문자열
        let timeString = alarmViewCellDataList[alarmIndex].date
        
        if let date = dateFormatter.date(from: timeString) {
            // `dateFormatter.date(from:)` 메소드를 사용하여 `timeString`을 `Date` 객체로 변환
            datePicker.date = date // date picker의 날짜와 시간을 설정
        }
    }
    
    private func navigationControllerLayout() {
        navigationItem.title = "알람 추가"
        
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonAction))
        cancelButton.tintColor = .appTextColor
        navigationItem.leftBarButtonItem = cancelButton
        
        let saveButton = UIBarButtonItem(title: "편집", style: .done, target: self, action: #selector(saveButtonAction))
        saveButton.tintColor = .appPointColor
        navigationItem.rightBarButtonItem = saveButton
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appTextColor!]
    }
    
    @objc override func saveButtonAction() {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "HH:mm"
        let timeString = dateFormatter.string(from: datePicker.date)

        if alarmTextFieldText == "" {
            alarmTextFieldText = "알람"
        }
        
        alarmViewCellDataList[alarmIndex] = (AlarmViewCellDataModel(date: timeString, repeatDays: repeatDaysDataContractionText, label: alarmTextFieldText, user: "admin", repeatSwitchState: true))
        
        alarmTextFieldTextInit()
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "AlarmEditedNotification"), object: alarmIndex)
        
        dismiss(animated: true, completion: nil)
    }
    
    override func repeatDaysButtonAction() {
        let rootViewController = RepeatDaysSelectViewController()
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
            cell.hiddenFucntion(titleLabelText: titlaLabelText, greaterthanBool: false, repeatDaysLabelBool: false, textFieldBool: true, userSelectLabelBool: true, selectVitaminLabelBool: true)
            let data = repeatDaysSelectList.filter { $0.checkState }.map { $0.title }.joined(separator: " ").isEmpty ? "안함" : repeatDaysSelectList.filter { $0.checkState }.map { $0.title }.joined(separator: " ")
            cell.repeatDaysLabel.text = repeatDaysDataContraction(data: data)
        case 1:
            cell.hiddenFucntion(titleLabelText: titlaLabelText, greaterthanBool: true, repeatDaysLabelBool: true, textFieldBool: false, userSelectLabelBool: true, selectVitaminLabelBool: true)
            cell.textField.text = alarmViewCellDataList[alarmIndex].label
        case 2:
            cell.hiddenFucntion(titleLabelText: titlaLabelText, greaterthanBool: false, repeatDaysLabelBool: true, textFieldBool: true, userSelectLabelBool: false, selectVitaminLabelBool: true)
        case 3:
            cell.hiddenFucntion(titleLabelText: titlaLabelText, greaterthanBool: false, repeatDaysLabelBool: true, textFieldBool: true, userSelectLabelBool: true, selectVitaminLabelBool: false)
        default:
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
        default:
            break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)

    }
}
