//
//  RepeatDaysSelectViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/03.
//

import UIKit
import SnapKit

class RepeatDaysSelectViewController: UIViewController {
    
    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []
    
    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.clear, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("반복주기설정화면이 로드되었습니다.")
        print("반복주기설정과정이 시작되었습니다.")
        addSubview()
        viewLayout()
        addOnCommonUiView()
        commonUIViewLayout()
        tableViewLayout()
        navigationControllerLayout()
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
        tableView.register(RepeatDaysSelectViewTableCell.self, forCellReuseIdentifier: "RepeatDaysSelectViewTableCell")
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
        navigationItem.title = "반복"
        
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

extension RepeatDaysSelectViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repeatDaysSelectList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepeatDaysSelectViewTableCell", for: indexPath) as! RepeatDaysSelectViewTableCell
        
        cell.clipsToBounds = true
        cell.backgroundColor = UIColor.clear
        
        let data = repeatDaysSelectList[indexPath.row]
        cell.titleLabel.text = data.title + "요일마다"
        
        cell.checkStateImageView.isHidden = !repeatDaysSelectList[indexPath.row].checkState

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? RepeatDaysSelectViewTableCell else {
                return
            }

        repeatDaysSelectList[indexPath.row].checkState = !repeatDaysSelectList[indexPath.row].checkState
        cell.checkStateImageView.isHidden = !repeatDaysSelectList[indexPath.row].checkState

        tableView.deselectRow(at: indexPath, animated: true)
    }
}
