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
    let nextButton = alarmAddView().nextButton()
    
    let commonUiView = commonView().commonUiView(backgroundColor: UIColor.black.withAlphaComponent(0.07), borderWidth: 1, borderColor: UIColor(white: 1.0, alpha: 0.14), cornerRadius: 15)
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
        view.backgroundColor = UIColor.white
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.width.equalTo(view)
        }
        
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(4)
            make.leading.equalTo(20)
            make.size.equalTo(CGSize(width: 22.5, height: 20.5))
        }
        
        nextButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(1.5)
            make.trailing.equalTo(-20)
            make.size.equalTo(CGSize(width: 18.5, height: 21.5))
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
            make.height.equalTo(160)
        }
    }
    
    private func addSubview() {
        uiViewList = [titleLabel, closeButton, nextButton, datePicker, commonUiView, tableView]
        
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
        
        if indexPath.row != 1 {
            cell.textField.isHidden = true
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
