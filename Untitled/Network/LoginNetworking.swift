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
                completion(false)
            }
        } else {
            networkErrorHandlingAlert()
            completion(false)
        }
    }
}
