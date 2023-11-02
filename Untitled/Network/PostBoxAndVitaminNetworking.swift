//
//  PostBoxAndVitaminNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/06/01.
//

import UIKit
import Alamofire

func postBoxAndVitamin(completion: @escaping (Bool) -> Void) {
    LoadingView.show(loadingText: "박스&영양제 데이터 가져오는 중")

    DispatchQueue.global().async {
//        showLoadingScreen()
        let serverURLString = "\(serverURL)/box/postbox" // 서버 주소
        
        guard let seq = userDataList.first?.seq else {
            print("사용자 데이터가 없습니다.")
            return
        }
        
        var boxnum = [Int]()
        var vseq = [Int]()
        
        for i in testBoxAndVitaminDataList {
            boxnum.append(i.box)
            vseq.append(i.vseq)
        }
        
        print("전송:\n\(boxnum)\n\(vseq)")
        
        checkServerConnection() { isConnected in
            if isConnected {
                let header : HTTPHeaders = [
                    "Content-Type" : "application/json"
                ]
                
                let bodyData: Parameters = [
                    "boxnum": boxnum,
                    "vseq": vseq,
                    "seq": seq
                ]
                
                print(bodyData)
                
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
                        boxAndVitaminDataList.removeAll()
                        testBoxAndVitaminDataList.removeAll()
                        print("박스&영양제 등록 네트워킹 성공!")
                    } else {
                        completion(false)
                        print("박스&영양제 네트워킹 실패..")
                    }
                }
            } else {
                completion(false)
                print("박스&영양제 네트워킹 연결 실패")
                networkErrorHandlingAlert()
//                hideLoadingScreen()
                LoadingView.hide()
            }
        }
    }
}
