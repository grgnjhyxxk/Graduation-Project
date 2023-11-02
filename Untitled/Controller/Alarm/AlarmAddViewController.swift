//
//  AlarmAddViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/01.
//

import UIKit
import SnapKit

class AlarmAddViewController: UIViewController {
    
    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []
    
    let datePicker = AlarmAddView().datePicker()
    
    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.clear, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    let tableView = UITableView()
    
    let warningLabel = RegisterView().warningLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("알람등록화면이 로드되었습니다.")
        addSubview()
        viewLayout()
        addOnCommonUiView()
        commonUIViewLayout()
        tableViewLayout()
        navigationControllerLayout()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appMainBackgroundColor
        
        let dividerView = UIView(frame: CGRect(x: 0, y: navigationController?.navigationBar.frame.maxY ?? 0, width: view.frame.width, height: 1))
        dividerView.backgroundColor = UIColor.systemGray6
        navigationController?.view.addSubview(dividerView)

        datePicker.snp.makeConstraints { make in
            make.top.equalTo(66)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
            make.height.equalTo(200)
        }
        
        commonUiView.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom).offset(10)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(134.82)
        }
        
        warningLabel.snp.makeConstraints { make in
            make.top.equalTo(commonUiView.snp.bottom).offset(5)
            make.leading.equalTo(commonUiView)
        }
        
        warningLabel.isHidden = true
    }
    
    private func addSubview() {
        uiViewList = [datePicker, commonUiView, tableView, warningLabel]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func commonUIViewLayout() {
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalTo(commonUiView)
        }
    }
    
    private func addOnCommonUiView() {
        commonViewList = [tableView]
        
        for uiView in commonViewList {
            commonUiView.addSubview(uiView)
        }
    }
    
    private func tableViewLayout() {
        tableView.register(AlarmAddViewTableCell.self, forCellReuseIdentifier: "AlarmAddViewTableCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.appSubBackgroundColor
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        tableView.isScrollEnabled = false
        tableView.rowHeight = 45
        tableView.layer.cornerRadius = 15
    }
    
    private func navigationControllerLayout() {
        navigationItem.title = "알람 추가"
        
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonAction))
        cancelButton.tintColor = .appTextColor
        navigationItem.leftBarButtonItem = cancelButton
        
        let addButton = UIBarButtonItem(title: "추가", style: .done, target: self, action: #selector(addButtonAction))
        addButton.tintColor = .appPointColor
        navigationItem.rightBarButtonItem = addButton
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appTextColor!]
    }
    
    private func selectVitaminToString() {
        
    }
    
    @objc func cancelButtonAction() {
        alarmViewBoxinSelectDataList.removeAll()
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc func addButtonAction() {
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
            alarmViewCellDataList.append(AlarmViewCellDataModel(date: timeString, repeatDays: repeatDaysDataContractionText, label: alarmTextFieldText, box: box))

            scheduleVitaminAlarm(label: alarmTextFieldText)
            alarmDataPost() { success in
                if success {
                    let seq = userDataList[0].seq
                    userAlarmDataList.removeAll()
                    getAlarmData(seq: seq) { success in
                        if success {
                            alarmAddDataInit()
                            alarmViewCellDataListInit()
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "AlarmAddedNotification"), object: alarmViewCellDataList.count-1)
                            self.dismiss(animated: true, completion: nil)
                        } else {
                            print("알람 등록 실패")
                        }
                    }
                } else {
                    print("알람 등록 실패")
                }
            }
        } else {
            warningLabel.text = "보관함을 1개 이상 선택하셔야 합니다."
            warningLabel.isHidden = false
        }
        
        alarmViewBoxinSelectDataList.removeAll()
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
    
    func repeatDaysButtonAction() {
        print("사용자가 반복주기 Cell을 클릭하였습니다.")
        let rootViewController = RepeatDaysSelectViewController()
        show(rootViewController, sender: nil)
    }
    
//    func vitaminSelectButtonAction() {
//        print("사용자가 영양제선택 Cell을 클릭하였습니다.")
//        let rootViewController = AlarmVitaminSelectViewController()
//        show(rootViewController, sender: nil)
//    }
    
//    func boxSelectButtonAction() {
//        print("사용자가 보관함 설정 Cell을 클릭하였습니다.")
//        let rootViewController = AlarmBoxSelectViewController()
//        show(rootViewController, sender: nil)
//    }
}

extension AlarmAddViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AlarmAddViewCellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
            cell.textField.text = alarmTextFieldText
        case 2:
            cell.hiddenFucntion(titleLabelText: titlaLabelText, greaterthanBool: false, repeatDaysLabelBool: true, textFieldBool: true, boxLabelBool: false)
            if !alarmViewBoxinSelectDataList.isEmpty {
                cell.boxLabel.text = ingredientsNameConcatenated()
            } else {
                cell.boxLabel.text = "안함"
            }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? AlarmAddViewTableCell else {
            return
        }
        switch indexPath.row {
        case 0:
            repeatDaysButtonAction()
        case 1:
            cell.textField.becomeFirstResponder()
        case 2:
            print("사용자가 보관함 설정 Cell을 클릭하였습니다.")
            let rootViewController = AlarmBoxSelectViewController()
            rootViewController.state = "Add"
            show(rootViewController, sender: nil)
        default:
            break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)

    }
}
