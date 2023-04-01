//
//  AlarmViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit

class alarmViewController: UIViewController {
    
    var uiViewList: [UIView] = []

    let userProfileButton = commonView().roundingButton()
    let envelopeButton = commonView().envelopeButton()
    let titleTextButton = commonView().titleTextButton(titleText: "알람관리")
    let subTextLabel = commonView().commonTextLabel(labelText: "매일 꾸준한 습관", size: 14)
    let mainTextLabel = commonView().commonTextLabel(labelText: "섭취알람으로\n매일 섭취관리하세요.", size: 30)

    override func viewDidLoad() {
        super.viewDidLoad()
        setSameBackgroundColor()
        addSubview()
        viewLayout()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.white
                
        userProfileButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(74)
            make.trailing.equalTo(view).offset(-31)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        
        envelopeButton.snp.makeConstraints { make in
            make.top.equalTo(userProfileButton.snp.top).offset(10)
            make.trailing.equalTo(userProfileButton.snp.leading).offset(-10)
            make.size.equalTo(CGSize(width: 36, height: 26))
        }
        
        titleTextButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(76)
            make.leading.equalTo(view).offset(31)
            make.size.equalTo(CGSize(width: 122, height: 44))
        }
        
        subTextLabel.snp.makeConstraints { make in
            make.top.equalTo(titleTextButton.snp.bottom).offset(45)
            make.leading.equalTo(titleTextButton)
        }
        
        mainTextLabel.snp.makeConstraints { make in
            make.top.equalTo(subTextLabel.snp.bottom).offset(15)
            make.leading.equalTo(subTextLabel).offset(-1.8)
        }
    }
    
    private func addSubview() {
        uiViewList = [userProfileButton, envelopeButton, titleTextButton, subTextLabel, mainTextLabel]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
}
