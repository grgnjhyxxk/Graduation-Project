//
//  InitViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit
import SnapKit

class initViewController: UIViewController {
    
    var uiViewList: [UIView] = [] 
    
    let mainTextLabel = initView().mainTextLabel()
    let subTextLabel = initView().subTextLabel()
    let initViewRingShapeLayer = initView().initViewRingShapeLayer()
    let subTextLabelInInitViewRingShapeLayer = initView().subTextLabelInInitViewRingShapeLayer()
    let loginButton = initView().loginButton()
    let findIdPasswordTextLabel = initView().findIdPasswordTextLabel()
    let signUpTextLabel = initView().signUpTextLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        viewLayout()
        setSameBackgroundColor()
        
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.white
        
        mainTextLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(90)
            make.leading.equalTo(view).offset(27)
        }
        
        subTextLabel.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(22)
            make.leading.equalTo(mainTextLabel)
        }
        
        let center = CGPoint(x: view.bounds.midX-100, y: view.bounds.midY-100)
        initViewRingShapeLayer.position = center
        
        subTextLabelInInitViewRingShapeLayer.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(654)
            make.leading.equalTo(view).offset(91)
            make.trailing.equalTo(view).offset(-91)
            make.size.height.equalTo(33)
        }
        
        findIdPasswordTextLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(10)
            make.leading.equalTo(loginButton.snp.leading).offset(0.5)
        }
        
        signUpTextLabel.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(10)
            make.trailing.equalTo(loginButton.snp.trailing).offset(-0.5)
        }
    }
    
    private func addSubview() {
        uiViewList = [mainTextLabel, subTextLabel, subTextLabelInInitViewRingShapeLayer, loginButton, findIdPasswordTextLabel, signUpTextLabel]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
        
        view.layer.addSublayer(initViewRingShapeLayer)
    }
}
