//
//  VitaminSearchIngredientsViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/06/02.
//

import UIKit
import SnapKit

class VitaminSearchIngredientsViewController: UIViewController {
    
    var vitaminIndex = Int()

    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []

    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.appMainBackgroundColor!, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        viewLayout()
        addOnCommonUiView()
        commonUiViewLayout()
        tableViewLayout()
        navigationControllerLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appMainBackgroundColor
        
        commonUiView.snp.makeConstraints { make in
            make.top.equalTo(75)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view)
        }
    }
    
    private func addSubview() {
        uiViewList = [commonUiView]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func commonUiViewLayout() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(commonUiView)
            make.bottom.equalTo(commonUiView).offset(-83)
            make.leading.equalTo(commonUiView).offset(15)
            make.trailing.equalTo(commonUiView).offset(-15)
        }
    }
    
    private func addOnCommonUiView() {
        commonViewList = [tableView]
        
        for uiView in commonViewList {
            commonUiView.addSubview(uiView)
        }
    }
    
    private func tableViewLayout() {
        tableView.register(IngredientsViewTableCell.self, forCellReuseIdentifier: "IngredientsViewTableCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.clear
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        tableView.isScrollEnabled = false
        tableView.rowHeight = 45
        tableView.layer.cornerRadius = 10
        
        tableView.tableHeaderView = UIView(frame: .zero)
        tableView.tableHeaderView?.backgroundColor = .clear
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.tableFooterView?.backgroundColor = .clear
    }
    
    private func navigationControllerLayout() {
        navigationItem.title = "성분"
        
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

extension VitaminSearchIngredientsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vitaminSearchNames[vitaminIndex].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientsViewTableCell", for: indexPath) as! IngredientsViewTableCell
        
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 10
        
        cell.nameLabel.text = vitaminSearchNames[vitaminIndex][indexPath.row]
        cell.contentLabel.text = "\(vitaminSearchValues[vitaminIndex][indexPath.row])(mg)"

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
