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
    
    let titleLabel = alarmAddView().titleLabel()
    let datePicker = alarmAddView().datePicker()
    
    let closeButton = alarmAddView().closeButton()
    let saveButton = alarmAddView().saveButton()
    
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
        actionFuction()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.baseViewBackgroundColor
        
//        topBarView.snp.makeConstraints { make in
//            make.top.leading.trailing.equalTo(view)
//            make.height.equalTo(45)
//        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(11.8)
            make.width.equalTo(view)
        }
        
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(-6.2)
            make.leading.equalTo(21)
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(-6.7)
            make.trailing.equalTo(-21)
        }
        
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(35)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(200)
        }
        
        commonUiView.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom).offset(10)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(180)
        }
    }
    
    private func addSubview() {
        uiViewList = [topBarView, titleLabel, closeButton, saveButton, datePicker, commonUiView, tableView]
        
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
        tableView.allowsSelection = false
    }
    
    private func actionFuction() {
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
    }
    
    @objc func closeButtonAction(_: UIButton) {
        dismiss(animated: true)
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
}
