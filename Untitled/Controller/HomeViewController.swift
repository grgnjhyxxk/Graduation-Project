//
//  MainViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    var uiViewList: [UIView] = []

    let userProfileButton = CommonView().roundingButton()
    let appIconForViewImageView = MainView().appIconForViewImageView()
    let userInterfaceStyleToggleButton = CommonView().userInterfaceStyleToggleButton()
    
    let commonView = CommonView().commonUiView(backgroundColor: UIColor.appMainBackgroundColor!, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        viewLayout()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appSubBackgroundColor
        
        userProfileButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(73)
            make.trailing.equalTo(view).offset(-15)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        
        userInterfaceStyleToggleButton.snp.makeConstraints { make in
            make.top.equalTo(userProfileButton.snp.top).offset(5.5)
            make.trailing.equalTo(userProfileButton.snp.leading).offset(-10)
            make.size.equalTo(CGSize(width: 36, height: 36))
        }
        
        commonView.snp.makeConstraints { make in
            make.top.equalTo(200)
            make.leading.equalTo(30)
            make.trailing.equalTo(-30)
            make.height.equalTo(150)
        }
        
        commonView.shadowLayer()
    }
    
    private func addSubview() {
        uiViewList = [appIconForViewImageView, userProfileButton, userInterfaceStyleToggleButton, commonView]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
}
