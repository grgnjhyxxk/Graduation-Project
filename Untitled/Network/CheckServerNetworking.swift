//
//  CheckServerNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/15.
//

import UIKit
import Alamofire

func checkServerConnection(completion: @escaping (Bool) -> Void) {
    let serverURLString = "\(serverURL)/connect" // 서버 주소
    
    AF.request(serverURLString, method: .get)
        .validate(statusCode: 200..<300)
        .response { response in
            if let error = response.error {
                // 서버에 연결할 수 없는 경우
                print("서버의 연결이 끊어졌거나 불안정합니다.")
                print(error.localizedDescription)
                completion(false)
            } else {
                // 서버에 연결 가능한 경우
                completion(true)
            }
        }
}
