//
//  LoadingView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/15.
//

import UIKit

var loadingView: UIView?
//
//func showLoadingScreen() {
//    let screenSize = UIScreen.main.bounds.size
//    loadingView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
//    loadingView?.backgroundColor = UIColor(white: 0, alpha: 0.5)
//
//    let activityIndicator = UIActivityIndicatorView(style: .large)
//    activityIndicator.center = loadingView!.center
//    activityIndicator.startAnimating()
//
//    loadingView?.addSubview(activityIndicator)
//
//    if let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow }) {
//        keyWindow.addSubview(loadingView!)
//    } else if let mainWindow = UIApplication.shared.windows.first {
//        mainWindow.addSubview(loadingView!)
//    }
//}

func showLoadingScreen() {
    let screenSize = UIScreen.main.bounds.size
    loadingView = UIView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
    loadingView?.backgroundColor = UIColor(white: 0, alpha: 0.5)
    
    let activityIndicator = UIActivityIndicatorView(style: .large)
    activityIndicator.center = loadingView!.center
    activityIndicator.startAnimating()
    
    loadingView?.addSubview(activityIndicator)
    
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        if let keyWindow = windowScene.windows.first(where: { $0.isKeyWindow }) {
            keyWindow.addSubview(loadingView!)
        } else if let mainWindow = windowScene.windows.first {
            mainWindow.addSubview(loadingView!)
        }
    }
}



func hideLoadingScreen() {
    // 로딩 화면을 숨기는 코드 작성
    loadingView?.removeFromSuperview()
    loadingView = nil
}
