//
//  AIRecommededViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit

class aiRecommendedViewController: UIViewController {
    
    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []
    
    let userProfileButton = commonView().roundingButton()
    let envelopeButton = commonView().envelopeButton()
    let titleTextButton = commonView().titleTextButton(titleText: "맞춤추천")
    
    let subTextLabel = commonView().commonTextLabel(labelText: "늘 효과적인 해답", size: 14)
    let mainTextLabel = commonView().commonTextLabel(labelText: "AI 분석을 통한\n임재혁님의 솔루션", size: 30)

    let commonUiView = commonView().commonUiView(backgroundColor: UIColor.layerViewBackgroundColor ?? UIColor.black.withAlphaComponent(0.07), borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 30)

    override func viewDidLoad() {
        super.viewDidLoad()
        setSameBackgroundColor(firstAlpha: 0.57, secondAlpha: 0.57)
        addOnView()
        viewLayout()
        addOnCommonUiView()
        commonUiViewLayout()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.baseViewBackgroundColor
                
        userProfileButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(74)
            make.trailing.equalTo(view).offset(-15)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        
        envelopeButton.snp.makeConstraints { make in
            make.top.equalTo(userProfileButton.snp.top).offset(10)
            make.trailing.equalTo(userProfileButton.snp.leading).offset(-10)
            make.size.equalTo(CGSize(width: 36, height: 26))
        }
        
        titleTextButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(76)
            make.leading.equalTo(view).offset(15)
            make.size.equalTo(CGSize(width: 122, height: 44))
        }
        
        commonUiView.snp.makeConstraints { make in
            make.top.equalTo(envelopeButton.snp.bottom).offset(40)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view)
        }
    }
    
    private func addOnView() {
        uiViewList = [commonUiView, userProfileButton, envelopeButton, titleTextButton]
        
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
    }
    
    private func addOnCommonUiView() {
        commonViewList = [subTextLabel, mainTextLabel]
        
        for uiView in commonViewList {
            commonUiView.addSubview(uiView)
        }
    }
}
