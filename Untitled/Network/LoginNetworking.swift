//
//  LoginNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/14.
//

import UIKit
import Alamofire

func loginUserToServer(userid: String, userpassword: String, completion: @escaping (Bool) -> Void) {
    
    showLoadingScreen()

    let serverURLString = "\(serverURL)/login" // 서버 주소
    
    checkServerConnection() { isConnected in
        if isConnected {

            let header : HTTPHeaders = [
                "Content-Type" : "application/json"
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
                hideLoadingScreen()
                
                if response.response?.statusCode == 200, let data = response.data {
                    do {
                        let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                        completion(true)
                        
                        if let responseData = jsonData {
                            print(responseData)
                        }
                    } catch {
                        print(error.localizedDescription)
                        networkErrorHandlingAlert()
                        completion(false)
                    }
                } else {
                    completion(false)
                }
            }
        } else {
            print("로그인 연결 실패")
            hideLoadingScreen()
            networkErrorHandlingAlert()
        }
    }
}
