//
//  RegisterNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/14.
//

import Foundation
import Alamofire

func sendUserDataToServer(userData: Array<UserAccountDataModel>, completion: @escaping (Bool) -> Void) {
//    showLoadingScreen()
    
    guard let lastUserData = userData.last else {
        print("No user data to send")
        return
    }

    let serverURLString = "\(serverURL)/register" // 서버 주소
    
    checkServerConnection() { isConnected in
        if isConnected {
            let header : HTTPHeaders = [
                "Content-Type" : "application/json"
            ]
            
            let bodyData: Parameters = [
                "id": lastUserData.userid,
                "pw": lastUserData.userpassword,
                "birth": lastUserData.users.first?.userBirth ?? 0,
                "gender": lastUserData.users.first?.userGender ?? false,
                "name": lastUserData.users.first?.userName ?? "",
                "serialid": lastUserData.serialNumber
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
                if response.response?.statusCode == 200 {
                    print("등록 성공!")
                    completion(true)
                } else {
                    print("등록 실패..")
                    completion(false)
                }
            }
        } else {
            print("회원등록 연결 실패")
            completion(false)
            networkErrorHandlingAlert()
            hideLoadingScreen()
        }
    }
}
