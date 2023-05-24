//
//  MainViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit
import SnapKit

class VitaminViewController: UIViewController {
    
    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []

    let AppIconImageView = HomeView().AppIconImageView()
    
    let titleTextButton = CommonView().titleTextButton(titleText: "영양관리")
    let userProfileButton = CommonView().roundingButton()
    let userInterfaceStyleToggleButton = CommonView().userInterfaceStyleToggleButton()
    let plusButton = AlarmView().plusButton()
    
    let subTextLabel = CommonView().commonTextLabel(labelText: "한눈에 보는 나의 영양제", size: 14)
    let mainTextLabel = CommonView().commonTextLabel(labelText: "영양관리로\n쉽고 편하게 관리하세요.", size: 25)

    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.appMainBackgroundColor!, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 30)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("홈화면이 로드되었습니다.")
        addSubview()
        addOnCommonUiView()
        viewLayout()
        commonUiViewLayout()
        actionFunction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let image = userProfileImageList[0].image
        userProfileButton.setImage(image, for: .normal)
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appSubBackgroundColor
        
        userProfileButton.snp.makeConstraints { make in
//            make.top.equalTo(view).offset(63)
            make.top.equalTo(58.5)
            make.trailing.equalTo(view).offset(-15)
            make.size.equalTo(CGSize(width: 36, height: 36))
        }
        
        userInterfaceStyleToggleButton.snp.makeConstraints { make in
//            make.top.equalTo(userProfileButton.snp.top).offset(5.5)
            make.top.equalTo(userProfileButton)
            make.trailing.equalTo(userProfileButton.snp.leading).offset(-10)
            make.size.equalTo(CGSize(width: 36, height: 36))
        }
        
        titleTextButton.snp.makeConstraints { make in
            make.top.equalTo(userProfileButton).offset(-5)
            make.leading.equalTo(view).offset(15)
            make.size.equalTo(CGSize(width: 122, height: 44))
        }
        
        commonUiView.snp.makeConstraints { make in
            make.top.equalTo(userInterfaceStyleToggleButton.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view)
        }

        userProfileButton.backgroundColor = UIColor.appMainBackgroundColor
        userProfileButton.layer.cornerRadius = 18
        userProfileButton.clipsToBounds = true
        commonUiView.shadowLayer()
    }
    
    private func addSubview() {
        uiViewList = [titleTextButton, userProfileButton, userInterfaceStyleToggleButton, commonUiView]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func commonUiViewLayout() {
        subTextLabel.snp.makeConstraints { make in
            make.top.equalTo(commonUiView).offset(10)
            make.leading.equalTo(20)
        }
        
        mainTextLabel.snp.makeConstraints { make in
            make.top.equalTo(subTextLabel.snp.bottom).offset(0)
            make.leading.equalTo(19)
        }
        
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(-34)
            make.trailing.equalTo(commonUiView).offset(-20)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        
        mainTextLabel.attributedLabel(text: "영양관리")
        subTextLabel.textColor = UIColor.subTextColor
    }
    
    private func addOnCommonUiView() {
        commonViewList = [subTextLabel, mainTextLabel, plusButton]
        
        for uiView in commonViewList {
            commonUiView.addSubview(uiView)
        }
    }
    
    private func actionFunction() {
        userInterfaceStyleToggleButton.addTarget(self, action: #selector(toggleTheme), for: .touchUpInside)
        userProfileButton.addTarget(self, action: #selector(roundingButtonAction), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plusButtonAction), for: .touchUpInside)
    }
    
//    @objc func plusButtonAction(_: UIButton) {
//        let rootViewController = VitaminAddViewController()
//        let navigationController = UINavigationController(rootViewController: rootViewController)
//        vitaminBasicDataListInit()
//        ingredientsCellDataListInit()
//        present(navigationController, animated: true, completion: nil)
//    }
    
    @objc func plusButtonAction(_: UIButton) {
        let rootViewController = VitaminCaptureViewController()
        let nvigationController = UINavigationController(rootViewController: rootViewController)
        vitaminImageDataListInit()
        present(nvigationController, animated: true)
    }
    
    @objc func toggleTheme(_ sender: UIButton) {
        if #available(iOS 13.0, *) {
            if self.traitCollection.userInterfaceStyle == .dark {
                UIApplication.shared.windows.forEach { window in
                    window.overrideUserInterfaceStyle = .light
                    sender.setImage(UIImage(systemName: "sun.max.circle.fill"), for: .normal)
                }
            } else {
                UIApplication.shared.windows.forEach { window in
                    window.overrideUserInterfaceStyle = .dark
                    sender.setImage(UIImage(systemName: "moon.circle.fill"), for: .normal)
                }
            }
        }
    }
    
    @objc func roundingButtonAction(_ sender: UIButton) {
        let rootViewController = UserViewContoller()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        navigationController.modalPresentationStyle = .fullScreen
        
        present(navigationController, animated: true)
    }
}
