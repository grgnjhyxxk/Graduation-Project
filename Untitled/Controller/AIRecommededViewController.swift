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

    override func viewDidLoad() {
        super.viewDidLoad()
        addOnView()
        viewLayout()
        addOnCommonUiView()
        commonUiViewLayout()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appSubBackgroundColor
                
        userProfileButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(63)
            make.trailing.equalTo(view).offset(-15)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        
        userInterfaceStyleToggleButton.snp.makeConstraints { make in
            make.top.equalTo(userProfileButton).offset(1)
            make.trailing.equalTo(userProfileButton.snp.leading).offset(-10)
            make.size.equalTo(CGSize(width: 36, height: 36))
        }
        
        titleTextButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(76)
            make.leading.equalTo(view).offset(15)
            make.size.equalTo(CGSize(width: 122, height: 44))
        }
        
        commonUiView.snp.makeConstraints { make in
            make.top.equalTo(userInterfaceStyleToggleButton.snp.bottom).offset(30)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view)
        }
    }
    
    private func addOnView() {
        uiViewList = [commonUiView, userProfileButton, userInterfaceStyleToggleButton, titleTextButton]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func commonUiViewLayout() {
        
        subTextLabel.snp.makeConstraints { make in
            make.top.equalTo(titleTextButton.snp.bottom).offset(45.5)
            make.leading.equalTo(20)
        }
        
        mainTextLabel.snp.makeConstraints { make in
            make.top.equalTo(subTextLabel.snp.bottom).offset(11)
            make.leading.equalTo(19)
        }
        
        mainTextLabel.attributedLabel(text: "AI 분석")
    }
    
    private func addOnCommonUiView() {
        commonViewList = [subTextLabel, mainTextLabel]
        
        for uiView in commonViewList {
            commonUiView.addSubview(uiView)
        }
    }
}
