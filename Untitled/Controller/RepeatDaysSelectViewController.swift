//
//  RepeatDaysSelectViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/03.
//

import UIKit
import SnapKit

class repeatDaysSelectViewController: UIViewController {
    
    let titleLabel = repeatDaysSelectView().titleLabel()
    let backButton = repeatDaysSelectView().backButton()
    
    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []
    
    let commonUiView = commonView().commonUiView(backgroundColor: UIColor.black.withAlphaComponent(0.07), borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)

    override func viewDidLoad() {
        super.viewDidLoad()
        setSameBackgroundColor(firstAlpha: 0.57, secondAlpha: 0.57)
        addSubview()
        viewLayout()
        addOnCommonUiView()
        commonUIViewLayout()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.baseViewBackgroundColor
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(11.8)
            make.width.equalTo(view)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(-6.2)
            make.leading.equalTo(21)
        }
        
        commonUiView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(35)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(180)
        }
    }
    
    private func addSubview() {
        uiViewList = [commonUiView, titleLabel, backButton]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func commonUIViewLayout() {

    }
    
    private func addOnCommonUiView() {

    }
}
