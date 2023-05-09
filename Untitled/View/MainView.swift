//
//  MainView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit

private let appIconForViewImageString = "AppIconForOnView"

class MainView: UIView {
    
    func appIconForViewImageView() -> UIImageView {
        let imageView = UIImageView()
        
        imageView.image = CommonView().roundingImage(string: appIconForViewImageString)
        
        return imageView
    }
}
