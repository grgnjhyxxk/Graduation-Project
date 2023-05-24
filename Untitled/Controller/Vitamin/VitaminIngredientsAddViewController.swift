//
//  VitaminIngredientsAddViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/23.
//

import UIKit
import SnapKit

class VitaminIngredientsAddViewController: UIViewController {
    var uiViewList: [UIView] = []
    
    let ingredientsNameSubTextLabel = RegisterView().subTextLabel(setText: "성분명")
    let ingredientsContentSubTextLabel = RegisterView().subTextLabel(setText: "함량")
    
    let ingredientsNameTextField = RegisterView().textField(setPlaceholder: "비타민C")
    let ingredientsContentTextField = RegisterView().textField(setPlaceholder: "500")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        viewLayout()
        navigationControllerLayout()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appMainBackgroundColor
    
        ingredientsNameSubTextLabel.snp.makeConstraints { make in
            make.top.equalTo(85)
            make.leading.equalTo(15)
        }
        
        ingredientsNameTextField.snp.makeConstraints { make in
            make.top.equalTo(ingredientsNameSubTextLabel.snp.bottom).offset(10)
            make.leading.equalTo(ingredientsNameSubTextLabel).offset(-0.5)
            make.trailing.equalTo(-15)
            make.height.equalTo(40)
        }
        
        ingredientsContentSubTextLabel.snp.makeConstraints { make in
            make.top.equalTo(ingredientsNameTextField.snp.bottom).offset(20)
            make.leading.equalTo(15)
        }
        
        ingredientsContentTextField.snp.makeConstraints { make in
            make.top.equalTo(ingredientsContentSubTextLabel.snp.bottom).offset(10)
            make.leading.equalTo(ingredientsContentSubTextLabel).offset(-0.5)
            make.trailing.equalTo(-15)
            make.height.equalTo(40)
        }
    }
    
    private func addSubview() {
        uiViewList = [ingredientsNameSubTextLabel, ingredientsNameTextField, ingredientsContentSubTextLabel, ingredientsContentTextField]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func navigationControllerLayout() {
        navigationItem.title = "성분 추가"
        
        let cancelButton = UIBarButtonItem(title: "뒤로", style: .plain, target: self, action: #selector(cancelButtonAction))
        cancelButton.tintColor = .appTextColor
        navigationItem.leftBarButtonItem = cancelButton
        
        let addButton = UIBarButtonItem(title: "추가", style: .done, target: self, action: #selector(addButtonAction))
        addButton.tintColor = .appPointColor
        navigationItem.rightBarButtonItem = addButton
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appTextColor!]
    }
    
    @objc func cancelButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func addButtonAction() {
        if ingredientsNameTextField.text != "" && ingredientsContentTextField.text != "" {
            if let name = ingredientsNameTextField.text {
                if let content = ingredientsContentTextField.text {
                    ingredientsCellDataList.append(IngredientsCellDataModel(name: name, content: Int(content)!))
                    print(ingredientsCellDataList)
                    navigationController?.popViewController(animated: true)
                }
            }
        }
    }
}
