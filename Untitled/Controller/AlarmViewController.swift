//
//  AlarmViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit

class AlarmViewController: UIViewController {
    
    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []

    let userProfileButton = commonView().roundingButton()
    let envelopeButton = commonView().envelopeButton()
    let titleTextButton = commonView().titleTextButton(titleText: "알람관리")
    let listButton = alarmView().listButton()
    let plusButton = alarmView().plusButton()
    
    let subTextLabel = commonView().commonTextLabel(labelText: "매일 꾸준한 습관", size: 14)
    let mainTextLabel = commonView().commonTextLabel(labelText: "섭취알람으로\n매일 섭취관리하세요.", size: 30)
    
    let commonUiView = commonView().commonUiView(backgroundColor: UIColor.layerViewBackgroundColor ?? UIColor.black.withAlphaComponent(0.07), borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 30)
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setSameBackgroundColor(firstAlpha: 0.57, secondAlpha: 0.57)
        addOnView()
        addOnCommonUiView()
        viewLayout()
        commonUiViewLayout()
        tableViewLayout()
        actionFuction()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleAlarmAddedNotification), name: NSNotification.Name(rawValue: "AlarmAddedNotification"), object: nil)

    }
    
    @objc func handleAlarmAddedNotification(_ noti: Notification) {
        OperationQueue.main.addOperation {
            self.tableView.reloadData()
        }

    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.baseViewBackgroundColor
                
        userProfileButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(74)
            make.trailing.equalTo(view).offset(-15)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        
        envelopeButton.snp.makeConstraints { make in
            make.top.equalTo(userProfileButton.snp.top).offset(10)
            make.trailing.equalTo(userProfileButton.snp.leading).offset(-10)
            make.size.equalTo(CGSize(width: 36, height: 26))
        }
        
        titleTextButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(76)
            make.leading.equalTo(view).offset(15)
            make.size.equalTo(CGSize(width: 122, height: 44))
        }
        
        commonUiView.snp.makeConstraints { make in
            make.top.equalTo(envelopeButton.snp.bottom).offset(40)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view)
        }
    }
    
    private func addOnView() {
        uiViewList = [commonUiView, userProfileButton, envelopeButton, titleTextButton]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func commonUiViewLayout() {
        
        subTextLabel.snp.makeConstraints { make in
            make.top.equalTo(titleTextButton.snp.bottom).offset(45.5)
            make.leading.equalTo(20)
        }
        
        mainTextLabel.snp.makeConstraints { make in
            make.top.equalTo(subTextLabel.snp.bottom).offset(11)
            make.leading.equalTo(19)
        }
        
        listButton.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(30)
            make.leading.equalTo(subTextLabel)
            make.size.equalTo(CGSize(width: 30, height: 23))
        }
        
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(25)
            make.trailing.equalTo(commonUiView).offset(-20)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(listButton.snp.bottom).offset(10)
            make.bottom.equalTo(commonUiView).offset(-100)
            make.leading.equalTo(commonUiView)
            make.trailing.equalTo(commonUiView)
        }
    }
    
    private func addOnCommonUiView() {
        commonViewList = [subTextLabel, mainTextLabel, listButton, plusButton, tableView]
        
        for uiView in commonViewList {
            commonUiView.addSubview(uiView)
        }
    }
    
    private func tableViewLayout() {
        tableView.register(AlarmViewTableCell.self, forCellReuseIdentifier: "AlarmViewTableCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.clear
        tableView.rowHeight = 93
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    private func actionFuction() {
        plusButton.addTarget(self, action: #selector(plusButtonAction), for: .touchUpInside)
    }
    
    @objc func plusButtonAction(_: UIButton) {
        let rootViewController = AlarmAddViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        repeatDaysSelectListInitFunction()
        print("List init!!")
        
        present(navigationController, animated: true, completion: nil)
    }
}

extension AlarmViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmViewCellDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmViewTableCell", for: indexPath) as! AlarmViewTableCell
        
        cell.clipsToBounds = true
        cell.backgroundColor = UIColor.clear
        
        cell.userImage.image = alarmViewCellDataList[indexPath.row].userImage
        cell.titleLabel.text = alarmViewCellDataList[indexPath.row].label
        cell.userNameLabel.text = String(alarmViewCellDataList[indexPath.row].user)
        cell.timeLabel.text = alarmViewCellDataList[indexPath.row].date
        cell.dateLabel.text = alarmViewCellDataList[indexPath.row].repeatDays
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
