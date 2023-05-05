//
//  MainView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit

private let appIconForViewImageString = "AppIconForOnView"

class mainView: UIView {
    
    func appIconForViewImageView() -> UIImageView {
        let imageView = UIImageView()
        
        imageView.image = commonView().roundingImage(string: appIconForViewImageString)
        
        return imageView
    }
}
