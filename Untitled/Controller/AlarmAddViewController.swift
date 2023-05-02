//
//  AlarmAddViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/01.
//

import UIKit
import SnapKit

class alarmAddViewController: UIViewController {
    
    var uiViewList: [UIView] = []
    
    let titleLabel = alarmAddView().titleLabel()
    let datePicker = alarmAddView().datePicker()
    let commonUiView = commonView().commonUiView(backgroundColor: UIColor.black.withAlphaComponent(0.07), borderWidth: 1, borderColor: UIColor(white: 1.0, alpha: 0.14), cornerRadius: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSameBackgroundColor(firstAlpha: 0.57, secondAlpha: 0.57)
        addSubview()
        viewLayout()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.white
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.width.equalTo(view)
        }
        
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(35)
            make.leading.equalTo(0)
            make.trailing.equalTo(0)
            make.height.equalTo(200)
        }
        
        commonUiView.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom).offset(10)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.height.equalTo(200)
        }
    }
    
    private func addSubview() {
        uiViewList = [titleLabel, datePicker, commonUiView]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
}

