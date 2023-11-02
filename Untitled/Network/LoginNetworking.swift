//
//  LoginNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/14.
//

import UIKit
import Alamofire

func loginUserToServer(userid: String, userpassword: String, completion: @escaping (Bool) -> Void) {
    LoadingView.show(loadingText: "로그인 정보 가져오는 중")
    DispatchQueue.global().async {
        print("로그인한 아이디: \(userid)\n로그인한 비밀번호: \(userpassword)")
//        showLoadingScreen()
        
        let serverURLString = "\(serverURL)/login" // 서버 주소
        
        checkServerConnection() { isConnected in
            if isConnected {
                let header: HTTPHeaders = [
                    "Content-Type": "application/json"
                ]
                
                let bodyData: Parameters = [
                    "id": userid,
                    "pw": userpassword
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
                    if response.response?.statusCode == 200, let data = response.data {
                        do {
                            let jsonDecoder = JSONDecoder()
                            let userData = try jsonDecoder.decode(UserDataAtServer.self, from: data)
                            
                            userDataList.append(userData)
                            print(userDataList[0])
                            completion(true)
                        } catch {
                            print(error.localizedDescription)
                            completion(false)
                        }
                    } else {
                        completion(false)
                    }
                    
//                    hideLoadingScreen()
                    LoadingView.hide()
                }
            } else {
                print("로그인 연결 실패")
                networkErrorHandlingAlert()
//                hideLoadingScreen()
                LoadingView.hide()
                completion(false)
            }
        }
    }
}


