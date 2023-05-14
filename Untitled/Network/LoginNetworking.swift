//
//  LoginNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/14.
//

import Alamofire

func loginUserToServer(userid: String, userpassword: String, completion: @escaping (Bool) -> Void) {
    let serverURLString = "\(serverURL)/login" // 서버 주소

    let header : HTTPHeaders = [
        "Content-Type" : "application/json"
    ]

    let bodyData: Parameters = [
        "id": userid,
        "pw": userpassword
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
        if response.response?.statusCode == 200, let data = response.data {
            // 서버로부터 응답을 받았을 때
            do {
                let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                completion(true)
                
                // 응답 데이터 출력
                if let responseData = jsonData {
                    print(responseData)
                }
            } catch {
                print(error.localizedDescription)
                completion(false)
            }
        } else {
            print("로그인 실패..")
            completion(false)
        }
    }
}



