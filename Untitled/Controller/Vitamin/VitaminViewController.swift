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
    
    let AppIconImageView = HomeView().AppIconImageView()
    
    let userProfileButton = CommonView().roundingButton()
    let userInterfaceStyleToggleButton = CommonView().userInterfaceStyleToggleButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("홈화면이 로드되었습니다.")
        addSubview()
        viewLayout()
        actionFunction()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appMainBackgroundColor
        
        userProfileButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(63)
            make.trailing.equalTo(view).offset(-15)
            make.size.equalTo(CGSize(width: 45, height: 45))
        }
        
        userInterfaceStyleToggleButton.snp.makeConstraints { make in
            make.top.equalTo(userProfileButton.snp.top).offset(5.5)
            make.trailing.equalTo(userProfileButton.snp.leading).offset(-10)
            make.size.equalTo(CGSize(width: 36, height: 36))
        }
    }
    
    private func addSubview() {
        uiViewList = [userProfileButton, userInterfaceStyleToggleButton]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func actionFunction() {
        userProfileButton.addTarget(self, action: #selector(roundingButtonAction), for: .touchUpInside)
    }
    
    @objc func roundingButtonAction(_ sender: UIButton) {
        let rootViewController = UserViewContoller()
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        navigationController.modalPresentationStyle = .fullScreen
        
        present(navigationController, animated: true)
    }
}
