//
//  VitaminEditViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/29.
//

import UIKit
import SnapKit

class VitaminEditViewController: UIViewController {
    
    var vitaminIndex = Int()

    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []
    
    let vitaminImage = CommonView().userProfileImageView()
    
    let deleteButton = CommonView().deleteButton(text: "알람 삭제")

    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.clear, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        viewLayout()
        addOnCommonUiView()
        commonUIViewLayout()
        tableViewLayout()
        navigationControllerLayout()
        actionFunction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appMainBackgroundColor
        
        let dividerView = UIView(frame: CGRect(x: 0, y: navigationController?.navigationBar.frame.maxY ?? 0, width: view.frame.width, height: 1))
        dividerView.backgroundColor = UIColor.systemGray6
        navigationController?.view.addSubview(dividerView)
        
        vitaminImage.snp.makeConstraints { make in
            make.top.equalTo(90)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 84, height: 84))
        }
        
        commonUiView.snp.makeConstraints { make in
            make.top.equalTo(vitaminImage.snp.bottom).offset(35)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(134.82)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.top.equalTo(commonUiView.snp.bottom).offset(30)
            make.leading.equalTo(commonUiView)
            make.trailing.equalTo(commonUiView)
            make.height.equalTo(45)
        }
        
        vitaminImage.image = UIImage()
        vitaminImage.layer.cornerRadius = 42
    }
    
    private func addSubview() {
        uiViewList = [vitaminImage, commonUiView, deleteButton]
        
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
        tableView.register(VitaminAddViewTableCell.self, forCellReuseIdentifier: "VitaminAddViewTableCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.appSubBackgroundColor
        tableView.separatorStyle = .singleLine
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        tableView.isScrollEnabled = false
        tableView.rowHeight = 45
        tableView.layer.cornerRadius = 15
    }
    
    private func navigationControllerLayout() {
        navigationItem.title = "영양제 정보"
        
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonAction))
        cancelButton.tintColor = .appTextColor
        navigationItem.leftBarButtonItem = cancelButton
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appTextColor!]
    }
    
    private func actionFunction() {
        deleteButton.addTarget(self, action: #selector(deleteButtonAction), for: .touchUpInside)
    }
    
    @objc func deleteButtonAction(_ sender: UIButton) {
        vitaminDelete(index: vitaminIndex) { success in
            if success {
                vitaminNames.remove(at: self.vitaminIndex)
                vitaminValues.remove(at: self.vitaminIndex)
                userVitaminDataList.remove(at: self.vitaminIndex)
                
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "VitaminDeletedNotification"), object: self.vitaminIndex)
                
                self.dismiss(animated: true, completion: nil)
            } else {
                print("영양제 삭제 실패")
            }
        }
    }

    private func ingredientsNameConcatenated() -> String {
        var names: [String] = []

        for item in vitaminNames[vitaminIndex] {
            names.append(item)
        }
        
        print(names)
        
        var concatenatedNames = ""

        if names.count <= 3 {
            concatenatedNames = names.joined(separator: ", ")
        } else {
            let firstThreeNames = names.prefix(3).joined(separator: ", ")
            concatenatedNames = "\(firstThreeNames) + \(names.count - 3)"
        }

        return concatenatedNames
    }
    
    @objc func cancelButtonAction() {
        dismiss(animated: true, completion: nil)
    }
}

extension VitaminEditViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vitaminAddViewCellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VitaminAddViewTableCell", for: indexPath) as! VitaminAddViewTableCell
        
        cell.clipsToBounds = true
        cell.backgroundColor = UIColor.clear
        
        let titlaLabelText = vitaminAddViewCellData[indexPath.row].title
        
        switch indexPath.row {
        case 0:
            cell.hiddenFucntion(titleLabelText: titlaLabelText, nameTextFieldBool: false, ingredientsTextLabelBool: true, dosageTextFieldBool: true, greaterthanBool: true, unitLabelBool: true, pillLabelBool: true)
            cell.nameTextField.text = userVitaminDataList[vitaminIndex].prod_name
            cell.nameTextField.isEnabled = false
        case 1:
            cell.hiddenFucntion(titleLabelText: titlaLabelText, nameTextFieldBool: true, ingredientsTextLabelBool: false, dosageTextFieldBool: true, greaterthanBool: false, unitLabelBool: true, pillLabelBool: true)
            
            cell.ingredientsTextLabel.text = ingredientsNameConcatenated()
        case 2:
            cell.hiddenFucntion(titleLabelText: titlaLabelText, nameTextFieldBool: true, ingredientsTextLabelBool: true, dosageTextFieldBool: false, greaterthanBool: true, unitLabelBool: false, pillLabelBool: false)
            cell.dosageTextField.text = "\(userVitaminDataList[vitaminIndex].intake_per_day)"
            cell.dosageTextField.isEnabled = false
        default:
            break
        }
        
        if indexPath.row == 1 {
            cell.selectionStyle = .default
        } else {
            cell.selectionStyle = .none
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 1 {
            let editAlarmViewController = VitaminEditIngredientsViewController()
            
            editAlarmViewController.vitaminIndex = self.vitaminIndex
                
            show(editAlarmViewController, sender: nil)
        }
    }
}
