//
//  RegisterViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/09.
//

import UIKit
import SnapKit

class RegisterRootViewController: UIViewController {
    
    var uiViewList: [UIView] = []
    
    let commonUiView = CommonView().commonUiView(backgroundColor: UIColor.clear, borderWidth: 0, borderColor: UIColor.clear, cornerRadius: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubview()
        viewLayout()
        hideKeyboardWhenTappedAround()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appMainBackgroundColor
        
        commonUiView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func addSubview() {
        uiViewList = [commonUiView]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
}
