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

    let userProfileButton = CommonView().roundingButton()
    let userInterfaceStyleToggleButton = CommonView().userInterfaceStyleToggleButton()
    let titleTextButton = CommonView().titleTextButton(titleText: "알람관리")
    let plusButton = AlarmView().plusButton()
    
    let subTextLabel = CommonView().commonTextLabel(labelText: "매일 꾸준한 습관", size: 14)
    let mainTextLabel = CommonView().commonTextLabel(labelText: "섭취알람으로\n매일 섭취관리하세요.", size: 25)
    let emptyTextLabel = CommonView().commonTextLabel(labelText: "아직 알람을 추가하지 않으셨군요!\n지금 바로 알람을 설정해보세요 :)", size: 13)
    let emptyAlarmImageView = AlarmView().emptyAlarmImageView()
    
    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.appMainBackgroundColor!, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 30)
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("알람화면이 로드되었습니다.")
        addOnView()
        addOnCommonUiView()
        viewLayout()
        commonUiViewLayout()
        tableViewLayout()
        actionFuction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        alarmListisEmptyOrNot()
        NotificationCenter.default.addObserver(self, selector: #selector(handleAlarmAddedNotification), name: NSNotification.Name(rawValue: "AlarmAddedNotification"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleAlarmEditedNotification), name: NSNotification.Name(rawValue: "AlarmEditedNotification"), object: nil)
    }
    
    @objc func handleAlarmAddedNotification(_ noti: Notification) {
        OperationQueue.main.addOperation {
            guard let index = noti.object as? Int else { return }
            
            print("알람이 정상적으로 등록되었습니다.")
            
            self.alarmListisEmptyOrNot()
            
            self.printAlarmData(index: index)
            
            self.tableView.reloadData()
        }
    }
    
    @objc func handleAlarmEditedNotification(_ noti: Notification) {
        OperationQueue.main.addOperation {
            guard let index = noti.object as? Int else { return }
            
            print("알람이 정상적으로 수정되었습니다.")
            
            self.printAlarmData(index: index)
            
            self.tableView.reloadData()
        }
    }
    
    private func printAlarmData(index: Int) {
        let alarm = alarmViewCellDataList[index]
            
        // 정보를 출력합니다.
        print("Added Alarm Information: \(alarm.date), \(alarm.repeatDays), \(alarm.label), \(alarm.user), \(alarm.repeatSwitchState)")
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appSubBackgroundColor
                
        userProfileButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(63)
            make.trailing.equalTo(view).offset(-15)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        
        userInterfaceStyleToggleButton.snp.makeConstraints { make in
            make.top.equalTo(userProfileButton.snp.top).offset(5.5)
            make.trailing.equalTo(userProfileButton.snp.leading).offset(-10)
            make.size.equalTo(CGSize(width: 36, height: 36))
        }
        
        titleTextButton.snp.makeConstraints { make in
            make.top.equalTo(userProfileButton).offset(1)
            make.leading.equalTo(view).offset(15)
            make.size.equalTo(CGSize(width: 122, height: 44))
        }
        
        commonUiView.snp.makeConstraints { make in
            make.top.equalTo(userInterfaceStyleToggleButton.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view)
        }
    
        commonUiView.shadowLayer()
    }
    
    private func addOnView() {
        uiViewList = [commonUiView, userProfileButton, userInterfaceStyleToggleButton, titleTextButton]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func commonUiViewLayout() {
        subTextLabel.snp.makeConstraints { make in
            make.top.equalTo(commonUiView).offset(10)
            make.leading.equalTo(20)
        }
        
        mainTextLabel.snp.makeConstraints { make in
            make.top.equalTo(subTextLabel.snp.bottom).offset(0)
            make.leading.equalTo(19)
        }
        
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(-34)
            make.trailing.equalTo(commonUiView).offset(-20)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        emptyAlarmImageView.snp.makeConstraints { make in
            make.centerX.equalTo(commonUiView)
            make.top.equalTo(commonUiView.snp.top).offset(180)
            make.size.equalTo(CGSize(width: 300, height: 200))
        }
        
        emptyTextLabel.snp.makeConstraints { make in
            make.top.equalTo(emptyAlarmImageView.snp.bottom).offset(-30)
            make.width.equalTo(commonUiView)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(20)
            make.bottom.equalTo(commonUiView).offset(-83)
            make.leading.equalTo(commonUiView).offset(10)
            make.trailing.equalTo(commonUiView).offset(-10)
        }
        
        mainTextLabel.attributedLabel(text: "섭취알람")
        subTextLabel.textColor = UIColor.subTextColor
        emptyTextLabel.textAlignment = .center
        emptyTextLabel.textColor = UIColor.systemGray
    }
    
    private func addOnCommonUiView() {
        commonViewList = [subTextLabel, mainTextLabel, plusButton, tableView, emptyAlarmImageView, emptyTextLabel]
        
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
        tableView.layer.cornerRadius = 15
    }
    
    private func actionFuction() {
        plusButton.addTarget(self, action: #selector(plusButtonAction), for: .touchUpInside)
        userInterfaceStyleToggleButton.addTarget(self, action: #selector(toggleTheme), for: .touchUpInside)
    }
    
    private func alarmListisEmptyOrNot() {
        if alarmViewCellDataList.isEmpty {
            self.emptyTextLabel.isHidden = false
            self.emptyAlarmImageView.isHidden = false
        } else {
            self.emptyTextLabel.isHidden = true
            self.emptyAlarmImageView.isHidden = true
        }
    }
    
    @objc func plusButtonAction(_: UIButton) {
        let rootViewController = AlarmAddViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        repeatDaysSelectListInitFunction()
        
        present(navigationController, animated: true, completion: nil)
    }
    
    @objc func toggleTheme(_ sender: UIButton) {
        if #available(iOS 13.0, *) {
            if self.traitCollection.userInterfaceStyle == .dark {
                UIApplication.shared.windows.forEach { window in
                    window.overrideUserInterfaceStyle = .light
                    sender.setImage(UIImage(systemName: "sun.max.circle.fill"), for: .normal)
                }
            } else {
                UIApplication.shared.windows.forEach { window in
                    window.overrideUserInterfaceStyle = .dark
                    sender.setImage(UIImage(systemName: "moon.circle.fill"), for: .normal)
                }
            }
        }
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
        cell.layer.cornerRadius = 15
        
        cell.userImage.image = alarmViewCellDataList[indexPath.row].userImage
        cell.titleLabel.text = alarmViewCellDataList[indexPath.row].label
        cell.userNameLabel.text = String(alarmViewCellDataList[indexPath.row].user)
        cell.timeLabel.text = alarmViewCellDataList[indexPath.row].date
        cell.dateLabel.text = alarmViewCellDataList[indexPath.row].repeatDays
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let editAlarmViewController = AlarmEditViewController()
        let navigationController = UINavigationController(rootViewController: editAlarmViewController)
        
        editAlarmViewController.alarmIndex = indexPath.row
        
        present(navigationController, animated: true, completion: nil)
    }
}
