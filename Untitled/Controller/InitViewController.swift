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
        action()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.white
        
        let center = CGPoint(x: view.bounds.midX-100, y: view.bounds.midY-100)
        initViewRingShapeLayer.position = center
        
        mainTextLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(90)
            make.leading.equalTo(view).offset(27)
        }
        
        subTextLabel.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(22)
            make.leading.equalTo(mainTextLabel)
        }
        
        subTextLabelInInitViewRingShapeLayer.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(view).offset(630)
            make.leading.equalTo(view).offset(70)
            make.trailing.equalTo(view).offset(-70)
            make.size.height.equalTo(50)
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
    
    private func action() {
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(buttonTouchDown), for: .touchDown)
        loginButton.addTarget(self, action: #selector(buttonTouchUp), for: [.touchUpInside, .touchUpOutside])
    }

    @objc func loginButtonTapped(_ sender : UIButton) {
        let destinationVC = homeViewController()
        destinationVC.modalPresentationStyle = .fullScreen
        sender.backgroundColor = UIColor.applicationPointColor
        present(destinationVC, animated: true)
    }

    @objc func buttonTouchDown(_ sender: UIButton) {
        sender.backgroundColor = UIColor.applicationPointColorHighlightColor
    }

    @objc func buttonTouchUp(_ sender: UIButton) {
        sender.backgroundColor = UIColor.applicationPointColor
    }
}
