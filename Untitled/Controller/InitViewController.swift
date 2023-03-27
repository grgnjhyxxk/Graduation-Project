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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        viewLayout()
        setSameBackgroundColor()
        
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.white
        
        mainTextLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(110)
            make.leading.equalTo(view).offset(27)
        }
        
        subTextLabel.snp.makeConstraints { make in
            make.top.equalTo(mainTextLabel.snp.bottom).offset(22)
            make.leading.equalTo(mainTextLabel)
        }
        
        let center = CGPoint(x: view.bounds.midX-100, y: view.bounds.midY-80)
        initViewRingShapeLayer.position = center
    }
    
    private func addSubview() {
        uiViewList = [mainTextLabel, subTextLabel]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
        
        view.layer.addSublayer(initViewRingShapeLayer)
    }
}
