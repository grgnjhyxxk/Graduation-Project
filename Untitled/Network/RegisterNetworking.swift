//
//  RegisterNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/14.
//

import Foundation
import Alamofire

func sendUserDataToServer(userData: Array<UserAccountDataModel>) {
    guard let lastUserData = userData.last else {
        print("No user data to send")
        return
    }

    let serverURLString = "\(serverURL)/register" // 서버 주소
    
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
        serverURLString, // [주소]
        method: .post, // [전송 타입]
        parameters: bodyData, // [전송 데이터]
        encoding: JSONEncoding.default, // [인코딩 스타일]
        headers: header // [헤더 지정]
    )
    .validate(statusCode: 200..<300)
    .responseData { response in
        if response.response?.statusCode == 200 {
            print("등록 성공!")
        } else {
            print("등록 실패..")
        }
    }
}
