//
//  UserProfileViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/15.
//

import UIKit
import SnapKit

class UserProfileViewController: UIViewController {
    
    var uiViewList: [UIView] = []
    var commonViewList: [UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.appMainBackgroundColor
        
    }
    
    private func addSubview() {
        uiViewList = []
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func commonUIViewLayout() {
        
    }
    
    private func addOnCommonUiView() {
        commonViewList = []
        
        for uiView in commonViewList {
            
        }
    }
    
    private func navigationControllerLayout() {
        navigationItem.title = "프로필"
        
        let cancelButton = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonAction))
        cancelButton.tintColor = UIColor.appTextColor
        navigationItem.leftBarButtonItem = cancelButton
        
        let saveButton = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(saveButtonAction))
        saveButton.tintColor = UIColor.appPointColor
        navigationItem.rightBarButtonItem = saveButton
        
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appTextColor!]
    }
    
    @objc func cancelButtonAction(_ sender: UIBarButtonItem) {
        
    }
    
    @objc func saveButtonAction(_ sender: UIBarButtonItem) {
        
    }
}
