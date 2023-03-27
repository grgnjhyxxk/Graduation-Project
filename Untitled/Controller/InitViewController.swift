//
//  InitViewController.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit
import SnapKit

class initViewController: UIViewController {
    
    let mainTextLabel = initView().mainTextLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewLayout()
        setSameBackgroundColor()
        
    }
    
    private func viewLayout() {
        view.backgroundColor = UIColor.white
        
        view.addSubview(mainTextLabel)

        mainTextLabel.snp.makeConstraints { make in
            make.top.equalTo(view).offset(110)
            make.leading.equalTo(view).offset(27)
        }
    }
}
