//
//  VitaminAddViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/23.
//

import UIKit
import SnapKit

class VitaminAddViewController: UIViewController {
    
    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []
    
    let vitaminImage = CommonView().userProfileImageView()
    
    let vitaminImageEditButton = InitView().serviceButton(text: "영양제 사진변경")
    
    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.clear, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    let tableView = UITableView()
    
    let warningLabel = RegisterView().warningLabel()

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
        
        vitaminImageEditButton.snp.makeConstraints { make in
            make.top.equalTo(vitaminImage.snp.bottom)
            make.width.equalTo(view)
        }
        
        commonUiView.snp.makeConstraints { make in
            make.top.equalTo(vitaminImageEditButton.snp.bottom).offset(20)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(134.82)
        }
        
        warningLabel.snp.makeConstraints { make in
            make.top.equalTo(commonUiView.snp.bottom).offset(5)
            make.leading.equalTo(commonUiView)
        }
        
        vitaminImage.image = UIImage()
        vitaminImage.layer.cornerRadius = 42
        
        vitaminImageEditButton.titleLabel?.font = UIFont(name: "NotoSansKR-Bold", size: 14)
        warningLabel.isHidden = true
    }
    
    private func addSubview() {
        uiViewList = [vitaminImage, vitaminImageEditButton, commonUiView, warningLabel]
        
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
        navigationItem.title = "영양제 추가"
        
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonAction))
        cancelButton.tintColor = .appTextColor
        navigationItem.leftBarButtonItem = cancelButton
        
        let addButton = UIBarButtonItem(title: "추가", style: .done, target: self, action: #selector(addButtonAction))
        addButton.tintColor = .appPointColor
        navigationItem.rightBarButtonItem = addButton
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appTextColor!]
    }
    
    private func ingredientsNameConcatenated() -> String {
        var names: [String] = []

        for item in ingredientsCellDataList {
            names.append(item.name)
        }

        var concatenatedNames = ""

        if names.count <= 3 {
            concatenatedNames = names.joined(separator: ", ")
        } else {
            let firstThreeNames = names.prefix(3).joined(separator: ", ")
            concatenatedNames = "\(firstThreeNames) + \(names.count - 3)"
        }

        return concatenatedNames
    }

    
    private func actionFunction() {
        vitaminImageEditButton.addTarget(self, action: #selector(vitaminImageEditButtonTapped), for: .touchUpInside)
    }
    
    @objc func vitaminImageEditButtonTapped() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "사진 선택", style: .default) { _ in
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        })
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            alertController.addAction(UIAlertAction(title: "카메라", style: .default) { _ in
                imagePickerController.sourceType = .camera
                self.present(imagePickerController, animated: true, completion: nil)
            })
        }
        
        alertController.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func cancelButtonAction() {
        vitaminBasicDataListInit()
        ingredientsCellDataListInit()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func addButtonAction() {
        if vitaminNameTextFieldText != "" && perdayTextFieldText != "" && !ingredientsCellDataList.isEmpty {
            vitaminBasicDataList.append(VitaminBasicDataModel(name: vitaminNameTextFieldText, perday: Int(perdayTextFieldText)!))
            print(vitaminBasicDataList)
            print(ingredientsCellDataList)
            sendRequestWithJSONPayload() { success in
                if success {
                    vitaminBasicDataListInit()
                    ingredientsCellDataListInit()
                    userVitaminDataList.removeAll()
                    vitaminNames.removeAll()
                    vitaminValues.removeAll()
                    let seq = userDataList[0].seq
                    getVitaminInformation(seq: seq) { success in
                        if success {
                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "VitaminAddedNotification"), object: nil)
                            self.dismiss(animated: true, completion: nil)
                        } else {
                            print("실패...")
                        }
                    }
                } else {
                    print("실패...")
                }
            }
        } else {
            if vitaminNameTextFieldText == "" {
                warningLabel.text = "영양제 이름을 입력하셔야 합니다."
            } else if perdayTextFieldText == "" {
                warningLabel.text = "섭취량을 입력하셔야 합니다."
            } else if vitaminImage.image == nil {
                warningLabel.text = "영양제 이미지을 선택하셔야 합니다."
            } else if ingredientsCellDataList.count == 0 {
                warningLabel.text = "영양제 성분을 추가하셔야 합니다."
            }
            warningLabel.isHidden = false
        }
    }
        
    func repeatDaysButtonAction() {
        print("사용자가 영양제 성분 Cell을 클릭하였습니다.")
        let rootViewController = VitaminIngredientsViewController()
        show(rootViewController, sender: nil)
    }
}

extension VitaminAddViewController: UITableViewDataSource, UITableViewDelegate {
    
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
            cell.nameTextField.text = vitaminNameTextFieldText
        case 1:
            cell.hiddenFucntion(titleLabelText: titlaLabelText, nameTextFieldBool: true, ingredientsTextLabelBool: false, dosageTextFieldBool: true, greaterthanBool: false, unitLabelBool: true, pillLabelBool: true)
            if !ingredientsCellDataList.isEmpty {
                cell.ingredientsTextLabel.text = ingredientsNameConcatenated()
            }
        case 2:
            cell.hiddenFucntion(titleLabelText: titlaLabelText, nameTextFieldBool: true, ingredientsTextLabelBool: true, dosageTextFieldBool: false, greaterthanBool: true, unitLabelBool: false, pillLabelBool: false)
            cell.dosageTextField.text = perdayTextFieldText
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
        if indexPath.row == 1 {
            repeatDaysButtonAction()
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
    
extension VitaminAddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let pickedImage = info[.originalImage] as? UIImage {
            vitaminImage.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
