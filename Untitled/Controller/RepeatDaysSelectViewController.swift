//
//  RepeatDaysSelectViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/03.
//

import UIKit
import SnapKit

class repeatDaysSelectViewController: UIViewController {
    
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
        navigationControllerLayout()
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.baseViewBackgroundColor
        
        commonUiView.snp.makeConstraints { make in
            make.top.equalTo(76)
            make.leading.equalTo(15)
            make.trailing.equalTo(-15)
            make.height.equalTo(220)
        }
    }
    
    private func addSubview() {
        uiViewList = [commonUiView]
        
        for uiView in uiViewList {
            view.addSubview(uiView)
        }
    }
    
    private func commonUIViewLayout() {

    }
    
    private func addOnCommonUiView() {

    }
    
    private func navigationControllerLayout() {
        // Set navigation bar title
        navigationItem.title = "반복"
        
        // Set navigation bar button items
        let cancelButton = UIBarButtonItem(title: "뒤로", style: .plain, target: self, action: #selector(cancelButtonAction))
        cancelButton.tintColor = .white
        navigationItem.leftBarButtonItem = cancelButton
        
        // Set navigation bar color
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    @objc func cancelButtonAction() {
        navigationController?.popViewController(animated: true)
    }
}
