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
    var scrollViewList: [UIView] = []
    var contentViewList: [UIView] = []
    
    let AppIconImageView = HomeView().AppIconImageView()
    
    let userProfileButton = CommonView().roundingButton()
    let userInterfaceStyleToggleButton = CommonView().userInterfaceStyleToggleButton()
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let commonView = CommonView().commonUiView(backgroundColor: UIColor.appMainBackgroundColor!, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    
    let commonView2 = CommonView().commonUiView(backgroundColor: UIColor.appMainBackgroundColor!, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    
    let commonView3 = CommonView().commonUiView(backgroundColor: UIColor.appMainBackgroundColor!, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    
    let commonView4 = CommonView().commonUiView(backgroundColor: UIColor.appMainBackgroundColor!, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("홈화면이 로드되었습니다.")
        addSubview()
        viewLayout()
        addOnScrollView()
        scrollViewLayout()
        addOnContentView()
        contentViewLayout()
        actionFunction()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appSubBackgroundColor
        
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
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(userProfileButton.snp.bottom).offset(11)
            make.bottom.equalTo(-83)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    private func addSubview() {
        uiViewList = [scrollView, userProfileButton, userInterfaceStyleToggleButton]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func scrollViewLayout() {
        contentView.snp.makeConstraints { make in
            make.top.equalTo(scrollView)
            make.leading.trailing.bottom.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(800)
        }
    }
    
    private func addOnScrollView() {
        scrollViewList = [contentView]
        
        for uiView in scrollViewList {
            scrollView.addSubview(uiView)
        }
    }
    
    private func contentViewLayout() {
        commonView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(15)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(150)
        }
        
        commonView2.snp.makeConstraints { make in
            make.top.equalTo(commonView.snp.bottom).offset(15)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(100)
        }
        
        commonView3.snp.makeConstraints { make in
            make.top.equalTo(commonView2.snp.bottom).offset(15)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(250)
        }
        
        commonView4.snp.makeConstraints { make in
            make.top.equalTo(commonView3.snp.bottom).offset(15)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(200)
        }
        
        commonView.subShadowLayer()
        commonView2.subShadowLayer()
        commonView3.subShadowLayer()
        commonView4.subShadowLayer()
    }
    
    private func addOnContentView() {
        contentViewList = [commonView, commonView2, commonView3, commonView4]
        
        for uiView in contentViewList {
            contentView.addSubview(uiView)
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
