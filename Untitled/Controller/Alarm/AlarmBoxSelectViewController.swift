//
//  AlarmBoxSelectViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/31.
//

import UIKit
import SnapKit

class AlarmBoxSelectViewController: UIViewController {
    
    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []
    
    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.clear, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    let tableView = UITableView()

    var state: String?
    var index: Int?
    var checkList: [Bool] = [false, false, false, false, false, false]
    var lockList: [Bool] = [false, false, false, false, false, false]

    override func viewDidLoad() {
        super.viewDidLoad()
        print("박스설정화면이 로드되었습니다.")
        addSubview()
        viewLayout()
        addOnCommonUiView()
        tableViewLayout()
        navigationControllerLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
        tableView.register(AlarmBoxViewTableCell.self, forCellReuseIdentifier: "AlarmBoxViewTableCell")
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
        navigationItem.title = "보관함"
        
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

extension AlarmBoxSelectViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AlarmBoxSelectViewCellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlarmBoxViewTableCell", for: indexPath) as! AlarmBoxViewTableCell
        
        cell.clipsToBounds = true
        cell.backgroundColor = UIColor.clear
        
        cell.titleLabel.text = AlarmBoxSelectViewCellData[indexPath.row].title
        cell.checkStateImageView.isHidden = !alarmViewBoxinSelectDataList[indexPath.row].checkState
        
        for i in 0..<userAlarmDataList.count {
            if let state = state, state == "Edit" {
                if let index = index {
                    if i != index {
                        if userAlarmDataList[i].box.contains("\(indexPath.row + 1)") {
                            checkList[indexPath.row] = true
                        } else {
                            if checkList[indexPath.row] == true {
                                
                            } else {
                                checkList[indexPath.row] = false
                            }
                        }
                    }
                }
            } else if let state = state, state == "Add" {
                if userAlarmDataList[i].box.contains("\(indexPath.row + 1)") {
                    checkList[indexPath.row] = true
                } else {
                    if checkList[indexPath.row] == true {
                        
                    } else {
                        checkList[indexPath.row] = false
                    }
                }
            }
        }
        
        if boxAndVitaminDataList[indexPath.row].vseq == 0 {
            cell.lock.isHidden = false
            lockList[indexPath.row] = true
        } else {
            cell.lock.isHidden = true
            lockList[indexPath.row] = false
        }

        // 색깔을 설정하는 부분은 checkList를 기반으로 설정합니다.
        if checkList[indexPath.row] || lockList[indexPath.row] {
            cell.titleLabel.textColor = UIColor.placeholderText
        } else {
            cell.titleLabel.textColor = UIColor.appTextColor
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? AlarmBoxViewTableCell else {
            return
        }
        
        if checkList[indexPath.row] == true {
            let alertController = UIAlertController(title: "알림", message: "이미 다른 알람에서 사용하고 있는 보관함입니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            tableView.deselectRow(at: indexPath, animated: true)
        } else if lockList[indexPath.row] == true {
            let alertController = UIAlertController(title: "알림", message: "영양제가 설정되어있지 않은 보관함입니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            alarmViewBoxinSelectDataList[indexPath.row].checkState = !alarmViewBoxinSelectDataList[indexPath.row].checkState
            tableView.reloadData()
            print(alarmViewBoxinSelectDataList)
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
