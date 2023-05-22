//
//  AIRecommededViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit

class AiRecommendedViewController: UIViewController {
    
    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []
    
    let userProfileButton = CommonView().roundingButton()
    let userInterfaceStyleToggleButton = CommonView().userInterfaceStyleToggleButton()
    let titleTextButton = CommonView().titleTextButton(titleText: "맞춤추천")
    
    let subTextLabel = CommonView().commonTextLabel(labelText: "늘 효과적인 해답", size: 14)
    let mainTextLabel = CommonView().commonTextLabel(labelText: "AI 분석을 통한\n최적의 솔루션", size: 25)

    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.appMainBackgroundColor!, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 30)
    let commonUiView_2 = CommonView().commonUiView(backgroundColor: UIColor.appSubBackgroundColor!, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    let aiRecommentTitleLabel = CommonView().commonTextLabel(labelText: "AI 분석", size: 15)

    override func viewDidLoad() {
        super.viewDidLoad()
        print("AI추천화면이 로드되었습니다.")
        addOnView()
        viewLayout()
        addOnCommonUiView()
        commonUiViewLayout()
        actionFunction()
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
        
        commonUiView.shadowLayer()
    }
    
    private func addOnView() {
        uiViewList = [commonUiView, userProfileButton, userInterfaceStyleToggleButton, titleTextButton]
        
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
        
        commonUiView_2.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(15)
            make.leading.equalTo(20)
            make.width.equalTo(130)
            make.height.equalTo(100)
        }
        
        aiRecommentTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(commonUiView_2).offset(8)
            make.leading.equalTo(commonUiView_2).offset(10)
        }
        
        commonUiView_2.subShadowLayer()
        aiRecommentTitleLabel.font = UIFont(name: "Roboto-Bold", size: 15)
        mainTextLabel.attributedLabel(text: "AI 분석")
        subTextLabel.textColor = UIColor.subTextColor
    }
    
    private func addOnCommonUiView() {
        commonViewList = [subTextLabel, mainTextLabel, commonUiView_2, aiRecommentTitleLabel]
        
        for uiView in commonViewList {
            commonUiView.addSubview(uiView)
        }
    }
    
    private func actionFunction() {
        userProfileButton.addTarget(self, action: #selector(roundingButtonAction), for: .touchUpInside)
        userInterfaceStyleToggleButton.addTarget(self, action: #selector(toggleTheme), for: .touchUpInside)
    }
    
    @objc func roundingButtonAction(_ sender: UIButton) {
        let rootViewController = UserViewContoller()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        navigationController.modalPresentationStyle = .fullScreen

        present(navigationController, animated: true)
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
}
