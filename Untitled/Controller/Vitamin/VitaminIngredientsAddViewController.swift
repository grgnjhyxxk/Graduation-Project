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
    let warningLabel = RegisterView().warningLabel()
    
    let ingredientsNameTextField = RegisterView().textField(setPlaceholder: "비타민C")
    let ingredientsContentTextField = RegisterView().textField(setPlaceholder: "500")
    
    var pickerView = UIPickerView()
    
    let vitaminNames = [
        "vitaminA", "vitaminD", "vitaminE", "vitaminK",
        "vitaminB1", "vitaminB2", "vitaminB6", "vitaminB12",
        "vitaminC", "nicotinic_acid", "pantothenic", "folic_acid",
        "biotin", "calcium", "magnesium", "iron",
        "copper", "selenium", "iodine", "manganese",
        "molybdenum", "chrome"
    ]
    
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
        
        warningLabel.snp.makeConstraints { make in
            make.top.equalTo(ingredientsContentTextField.snp.bottom).offset(5)
            make.leading.equalTo(ingredientsContentSubTextLabel)
        }
        
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.sizeToFit()
        toolbar.barTintColor = UIColor.appMainBackgroundColor
        
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(tooBarCancelButtonAction))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(tooBarDoneButtonAction))
        
        toolbar.barTintColor = .black
        toolbar.isTranslucent = true
//        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appTextColor!]
        
        toolbar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.backgroundColor = UIColor.appMainBackgroundColor
        ingredientsNameTextField.inputView = pickerView
        ingredientsNameTextField.inputAccessoryView = toolbar
        
        warningLabel.isHidden = true
        ingredientsContentTextField.keyboardType = .numberPad
    }
    
    private func addSubview() {
        uiViewList = [ingredientsNameSubTextLabel, ingredientsNameTextField, ingredientsContentSubTextLabel, ingredientsContentTextField, warningLabel]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    @objc func tooBarCancelButtonAction() {
        ingredientsNameTextField.resignFirstResponder()
    }
    
    @objc func tooBarDoneButtonAction() {
        let selectedRow = pickerView.selectedRow(inComponent: 0)
        ingredientsNameTextField.text = vitaminNames[selectedRow]
        ingredientsNameTextField.resignFirstResponder()
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
        } else {
            if ingredientsNameTextField.text == "" {
                warningLabel.text = "성분이름을 입력하셔야 합니다."
            } else if ingredientsContentTextField.text == "" {
                warningLabel.text = "성분함량을 입력하셔야 합니다."
            }
            warningLabel.isHidden = false
        }
    }
}

extension VitaminIngredientsAddViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return vitaminNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return vitaminNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        ingredientsNameTextField.text = vitaminNames[row]
    }
}
