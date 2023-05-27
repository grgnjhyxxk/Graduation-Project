//
//  VitaminCaptureViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/24.
//

import UIKit
import AVFoundation
import SnapKit

class VitaminCaptureViewController: UIViewController {
    
    var uiViewList: [UIView] = []
    
    let vitaminImage = CommonView().userProfileImageView()
    
    let mainTextLabel = RegisterView().mainTextLabel(setText: "영양제 이미지를\n촬영 또은 선택해주세요.")
    let subTextLabel = CommonView().commonTextLabel(labelText: "촬영 시에는 정확한 정보제공을 위해 밝은 곳에서\n초점을 맞추어 촬영해주세요!", size: 12)
    let vitaminImageEditButton = InitView().serviceButton(text: "영양제 사진변경")
    let plusButton = AlarmView().plusButton()
    let serviceButton = InitView().serviceButton(text: "수동으로 추가하기")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        viewLayout()
        navigationControllerLayout()
        actionFunction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appMainBackgroundColor
        
        let dividerView = UIView(frame: CGRect(x: 0, y: navigationController?.navigationBar.frame.maxY ?? 0, width: view.frame.width, height: 1))
        dividerView.backgroundColor = UIColor.systemGray6
        navigationController?.view.addSubview(dividerView)
        
        mainTextLabel.snp.makeConstraints { make in
            make.top.equalTo(70)
            make.leading.equalTo(15)
        }
        
        subTextLabel.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(0)
            make.leading.equalTo(mainTextLabel)
        }
        
        vitaminImage.snp.makeConstraints { make in
            make.top.equalTo(subTextLabel.snp.bottom).offset(50)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 350, height: 350))
        }
        
//        vitaminImageEditButton.snp.makeConstraints { make in
//            make.top.equalTo(vitaminImage.snp.bottom).offset(20)
//            make.width.equalTo(view)
//        }
        
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(vitaminImage.snp.bottom).offset(-58)
            make.leading.equalTo(vitaminImage.snp.trailing).offset(-84)
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        
        serviceButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.bottom).offset(-57.8)
            make.centerX.equalTo(view)
        }
        
        let colorAnimation1 = CABasicAnimation(keyPath: "borderColor")
        colorAnimation1.fromValue = UIColor.appPointColor?.cgColor
        colorAnimation1.toValue = UIColor.appSubBackgroundColor?.cgColor
        colorAnimation1.duration = 2.0
        colorAnimation1.autoreverses = true
        colorAnimation1.repeatCount = .infinity

        let colorAnimation2 = CABasicAnimation(keyPath: "borderColor")
        colorAnimation2.fromValue = UIColor.appSubBackgroundColor?.cgColor
        colorAnimation2.toValue = UIColor.appMainBackgroundColor?.cgColor
        colorAnimation2.duration = 2.0
        colorAnimation2.autoreverses = true
        colorAnimation2.repeatCount = .infinity

        let colorAnimation3 = CABasicAnimation(keyPath: "borderColor")
        colorAnimation3.fromValue = UIColor.appMainBackgroundColor?.cgColor
        colorAnimation3.toValue = UIColor.appPointColor?.cgColor
        colorAnimation3.duration = 2.0
        colorAnimation3.autoreverses = true
        colorAnimation3.repeatCount = .infinity
        
        vitaminImage.image = UIImage()
        vitaminImage.layer.cornerRadius = 175
        vitaminImage.layer.borderWidth = 2
        vitaminImage.layer.borderColor = UIColor.red.cgColor
        vitaminImage.layer.add(colorAnimation1, forKey: "colorAnimation1")
        vitaminImage.layer.add(colorAnimation2, forKey: "colorAnimation2")
        vitaminImage.layer.add(colorAnimation3, forKey: "colorAnimation3")
        subTextLabel.textColor = UIColor.subTextColor
        subTextLabel.attributedLabel(text: "촬영 시")
        subTextLabel.font = UIFont(name: "NotoSansKR-Regular", size: 11)
        serviceButton.setTitleColor(UIColor.subTextColor, for: .normal)
        
//        vitaminImageEditButton.titleLabel?.font = UIFont(name: "NotoSansKR-Bold", size: 14)
    }
    
    private func addSubview() {
        uiViewList = [subTextLabel, mainTextLabel, vitaminImage, plusButton, vitaminImageEditButton, serviceButton]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
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
//        vitaminImageEditButton.addTarget(self, action: #selector(vitaminImageEditButtonTapped), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(vitaminImageEditButtonTapped), for: .touchUpInside)
        serviceButton.addTarget(self, action: #selector(serviceButtonAction), for: .touchUpInside)
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
    
    @objc func serviceButtonAction(_ sender: UIButton) {
        let rootViewController = VitaminAddViewController()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        present(navigationController, animated: true)
    }
    
    @objc func cancelButtonAction() {
        vitaminImageDataListInit()
        dismiss(animated: true, completion: nil)
    }
    
    @objc func addButtonAction() {
        let vitaminImage = vitaminImage.image
        vitaminImageDataList.append(VitaminImageDataModel(image: vitaminImage!))
        
        vitaminImageDataPost() { success in
            if success {
                vitaminImageDataListInit()
                self.dismiss(animated: true)
            } else {
                
            }
        }
    }
        
    func repeatDaysButtonAction() {
        dismiss(animated: true)
    }
}

extension VitaminCaptureViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
