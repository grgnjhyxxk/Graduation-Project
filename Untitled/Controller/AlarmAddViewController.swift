//
//  AlarmAddViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/01.
//

import UIKit
import SnapKit

class alarmAddViewController: UIViewController {
    
    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []
    
    let datePicker = alarmAddView().datePicker()
    
    let topBarView = commonView().commonUiView(backgroundColor: UIColor.black.withAlphaComponent(0.07), borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 5)
    let commonUiView = commonView().commonUiView(backgroundColor: UIColor.black.withAlphaComponent(0.07), borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSameBackgroundColor(firstAlpha: 0.57, secondAlpha: 0.57)
        addSubview()
        viewLayout()
        addOnCommonUiView()
        commonUIViewLayout()
        tableViewLayout()
        navigationControllerLayout()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.baseViewBackgroundColor
        
//        topBarView.snp.makeConstraints { make in
//            make.top.leading.trailing.equalTo(view)
//            make.height.equalTo(45)
//        }
        
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(46)
            make.leading.equalTo(5)
            make.trailing.equalTo(-5)
            make.height.equalTo(200)
        }
        
        commonUiView.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom).offset(10)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(180)
        }
    }
    
    private func addSubview() {
        uiViewList = [topBarView, datePicker, commonUiView, tableView]
        
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
        tableView.register(alarmAddViewTableCell.self, forCellReuseIdentifier: "alarmAddViewTableCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        tableView.isScrollEnabled = false
        tableView.rowHeight = 45
//        tableView.allowsSelection = false
        tableView.layer.cornerRadius = 15
    }
    
    private func navigationControllerLayout() {
        // Set navigation bar title
        navigationItem.title = "알람 추가"
        
        // Set navigation bar button items
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonAction))
        cancelButton.tintColor = .white
        navigationItem.leftBarButtonItem = cancelButton
        
        let saveButton = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(saveButtonAction))
        saveButton.tintColor = .white
        navigationItem.rightBarButtonItem = saveButton
        
        // Set navigation bar color
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    @objc func cancelButtonAction() {
            dismiss(animated: true, completion: nil)
    }
    
    @objc func saveButtonAction() {
        // Implement save button action here
    }
    
    func repeatDaysButtonAction() {
        let rootViewController = repeatDaysSelectViewController()
        show(rootViewController, sender: nil)
    }
}

extension alarmAddViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AlarmAddViewCellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmAddViewTableCell", for: indexPath) as! alarmAddViewTableCell
        
        cell.clipsToBounds = true
        cell.backgroundColor = UIColor.clear
        
        let data = AlarmAddViewCellData[indexPath.row]
        cell.titleLabel.text = data.title
        
        switch indexPath.row {
        case 0:
            cell.repeatDaysButton.isHidden = false
            cell.repeatDaysLabel.isHidden = false
        case 1:
            cell.textField.isHidden = false
        case 2:
            cell.userPickingButton.isHidden = false
            cell.userPickingLabel.isHidden = false
        case 3:
            cell.repeatSwitch.isHidden = false
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        switch indexPath.row {
        case 0:
            repeatDaysButtonAction()
        default:
            break
        }
    }
}
