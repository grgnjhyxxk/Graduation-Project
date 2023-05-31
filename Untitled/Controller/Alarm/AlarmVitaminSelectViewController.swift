//
//  AlarmVitaminSelectViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/29.
//

import UIKit

class AlarmVitaminSelectViewController: UIViewController {
    
    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []
    
    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.clear, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("알람영양제설정화면이 로드되었습니다.")
        addSubview()
        viewLayout()
        addOnCommonUiView()
        tableViewLayout()
        navigationControllerLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(userVitaminDataList)
        commonUIViewLayout()
        tableView.reloadData()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appMainBackgroundColor
        
        let dividerView = UIView(frame: CGRect(x: 0, y: navigationController?.navigationBar.frame.maxY ?? 0, width: view.frame.width, height: 1))
        dividerView.backgroundColor = UIColor.systemGray6
        navigationController?.view.addSubview(dividerView)
        
        commonUiView.snp.makeConstraints { make in
            make.top.equalTo(85)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(314.82)
        }
    }
    
    private func addSubview() {
        uiViewList = [commonUiView]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func commonUIViewLayout() {
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(commonUiView)
            make.height.equalTo(tableView.contentSize.height)
        }
    }
    
    private func addOnCommonUiView() {
        commonViewList = [tableView]
        
        for uiView in commonViewList {
            commonUiView.addSubview(uiView)
        }
    }
    
    private func tableViewLayout() {
        tableView.register(AlarmVitaminSelectViewTableCell.self, forCellReuseIdentifier: "AlarmVitaminSelectViewTableCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.appSubBackgroundColor
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        tableView.isScrollEnabled = false
        tableView.rowHeight = 45
        tableView.layer.cornerRadius = 15
        
        tableView.tableHeaderView = UIView(frame: .zero)
        tableView.tableHeaderView?.backgroundColor = .clear
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.tableFooterView?.backgroundColor = .clear
    }
    
    private func navigationControllerLayout() {
        navigationItem.title = "영양제 선택"
        
        let cancelButton = UIBarButtonItem(title: "뒤로", style: .plain, target: self, action: #selector(cancelButtonAction))
        cancelButton.tintColor = .appTextColor
        navigationItem.leftBarButtonItem = cancelButton
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appTextColor!]
    }
    
    @objc func cancelButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}

extension AlarmVitaminSelectViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userVitaminDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmVitaminSelectViewTableCell", for: indexPath) as! AlarmVitaminSelectViewTableCell
        
        cell.clipsToBounds = true
        cell.backgroundColor = UIColor.clear
        
        cell.titleLabel.text = userVitaminDataList[indexPath.row].prod_name
        cell.checkStateImageView.isHidden = !alarmViewVitaminSelectDataList[indexPath.row].checkState

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? AlarmVitaminSelectViewTableCell else {
                return
            }
        
        alarmViewVitaminSelectDataList[indexPath.row].checkState = !alarmViewVitaminSelectDataList[indexPath.row].checkState
        
        for i in 0..<alarmViewVitaminSelectDataList.count {
            if i == indexPath.row {
                
            } else {
                alarmViewVitaminSelectDataList[i].checkState = false
            }
        }
        
        tableView.reloadData()
        
        print(alarmViewVitaminSelectDataList)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
