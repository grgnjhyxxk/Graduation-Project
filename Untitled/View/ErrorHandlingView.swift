//
//  ErrorHandlingView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/15.
//

import UIKit

func networkErrorHandlingAlert() {
    if let topWindow = UIApplication.shared.windows.last {
        let alert = UIAlertController(title: "네트워크 에러", message: "현재 서버와의 연결이 불안정합니다.\n잠시 후에 시도해 주시기 바랍니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        topWindow.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
