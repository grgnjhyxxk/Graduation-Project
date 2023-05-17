//
//  LoginNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/14.
//

import UIKit
import Alamofire

func loginUserToServer(userid: String, userpassword: String, completion: @escaping (Bool) -> Void) {
    
    DispatchQueue.main.async {
        showLoadingScreen()
        
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
                    
                    hideLoadingScreen()
                }
            } else {
                print("로그인 연결 실패")
                networkErrorHandlingAlert()
                hideLoadingScreen()
            }
        }
    }
}

