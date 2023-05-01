//
//  AlarmViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit

class alarmViewController: UIViewController {
    
    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []

    let userProfileButton = commonView().roundingButton()
    let envelopeButton = commonView().envelopeButton()
    let titleTextButton = commonView().titleTextButton(titleText: "알람관리")
    let listButton = alarmView().listButton()
    let plusButton = alarmView().plusButton()
    
    let subTextLabel = commonView().commonTextLabel(labelText: "매일 꾸준한 습관", size: 14)
    let mainTextLabel = commonView().commonTextLabel(labelText: "섭취알람으로\n매일 섭취관리하세요.", size: 30)
    
    
    let commonUiView = commonView().commonUiView()
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
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.white
                
        userProfileButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(74)
            make.trailing.equalTo(view).offset(-31)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        
        envelopeButton.snp.makeConstraints { make in
            make.top.equalTo(userProfileButton.snp.top).offset(10)
            make.trailing.equalTo(userProfileButton.snp.leading).offset(-10)
            make.size.equalTo(CGSize(width: 36, height: 26))
        }
        
        titleTextButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(76)
            make.leading.equalTo(view).offset(31)
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
            make.top.equalTo(mainTextLabel.snp.bottom).offset(34)
            make.leading.equalTo(subTextLabel)
            make.size.equalTo(CGSize(width: 28, height: 18))
        }
        
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(34)
            make.trailing.equalTo(commonUiView).offset(-20)
            make.size.equalTo(CGSize(width: 23, height: 21.2))
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(listButton.snp.bottom).offset(10)
            make.bottom.equalTo(commonUiView).offset(-100)
            make.leading.equalTo(commonUiView).offset(20)
            make.trailing.equalTo(commonUiView).offset(-20)
        }
    }
    
    private func actionFuction() {
        plusButton.addTarget(self, action: #selector(plusButtonAction), for: .touchUpInside)
    }
    
    @objc func plusButtonAction(_: UIButton) {
        let alarmAddViewController = alarmAddViewController()
        self.present(alarmAddViewController, animated: true, completion: nil)
    }
    
    private func addOnCommonUiView() {
        commonViewList = [subTextLabel, mainTextLabel, listButton, plusButton, tableView]
        
        for uiView in commonViewList {
            commonUiView.addSubview(uiView)
        }
    }
    
    private func tableViewLayout() {
        tableView.register(alarmViewTableCell.self, forCellReuseIdentifier: "alarmViewTableCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
}

extension alarmViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmViewTableCell", for: indexPath) as! alarmViewTableCell
        
        cell.clipsToBounds = true
        cell.backgroundColor = UIColor.clear
        
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 2.5
        cell.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect.zero)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: CGRect.zero)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 93
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
