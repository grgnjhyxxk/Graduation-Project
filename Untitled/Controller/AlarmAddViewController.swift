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
    
    let datePicker = alarmAddView().datePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSameBackgroundColor(firstAlpha: 0.57, secondAlpha: 0.57)
        addSubview()
        viewLayout()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.white
        
        datePicker.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.leading.equalTo(0)
            make.bottom.equalTo(-400)
            make.trailing.equalTo(0)
        }
    }
    
    private func addSubview() {
        uiViewList = [datePicker]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
}

