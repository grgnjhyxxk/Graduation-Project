//
//  VitaminDeletePostNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/29.
//

import UIKit
import Alamofire

func vitaminDelete(index: Int, completion: @escaping (Bool) -> Void) {
    LoadingView.show(loadingText: "영양제 데이터 삭제 요청 중")
    DispatchQueue.global().async {
//        showLoadingScreen()
        let serverURLString = "\(serverURL)/vitamin/remove" // 서버 주소
        
        guard let seq = userDataList.first?.seq else {
            print("사용자 데이터가 없습니다.")
            return
        }

        let prod_name = userVitaminDataList[index].prod_name
        
        print("\(seq), \(prod_name)")
        
        checkServerConnection() { isConnected in
            if isConnected {
                let header : HTTPHeaders = [
                    "Content-Type" : "application/json"
                ]
                
                let bodyData: Parameters = [
                    "seq": seq,
                    "prod_name": prod_name,
                ]
                
                AF.request(
                    serverURLString,
                    method: .post,
                    parameters: bodyData,
                    encoding: JSONEncoding.default,
                    headers: header
                )
                .validate(statusCode: 200..<300)
                .responseData { response in
//                    hideLoadingScreen()
                    LoadingView.hide()
                    if response.response?.statusCode == 200 {
                        completion(true)
                        print("영양제 삭제 네트워킹 성공!")
                    } else {
                        completion(false)
                        print("영양제 삭제 네트워킹 실패..")
                    }
                }
            } else {
                completion(false)
                print("영양제 삭제 네트워킹 연결 실패")
                networkErrorHandlingAlert()
//                hideLoadingScreen()
                LoadingView.hide()
            }
        }
    }
}
