//
//  AlarmDataPostNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/30.
//

import UIKit
import Alamofire

func alarmDataPost(completion: @escaping (Bool) -> Void) {
    DispatchQueue.main.async {
        showLoadingScreen()
        let serverURLString = "\(serverURL)/alarm/add" // 서버 주소
        
        guard let seq = userDataList.first?.seq else {
            print("사용자 데이터가 없습니다.")
            return
        }
        
        guard let data = alarmViewCellDataList.last else {
            print("알람 데이터가 없습니다.")
            return
        }
        
        checkServerConnection() { isConnected in
            if isConnected {
                let header : HTTPHeaders = [
                    "Content-Type" : "application/json"
                ]
                
                let bodyData: Parameters = [
                    "seq": seq,
                    "time": data.date,
                    "days": data.repeatDays,
                    "alarmname": data.label,
                    "box": data.box,
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
                    hideLoadingScreen()
                    if response.response?.statusCode == 200 {
                        completion(true)
                        print("알람 등록 네트워킹 성공!")
                        alarmViewCellDataList.removeAll()
                    } else {
                        completion(false)
                        print("알람 등록 네트워킹 실패..")
                    }
                }
            } else {
                completion(false)
                print("알람 등록 네트워킹 연결 실패")
                networkErrorHandlingAlert()
                hideLoadingScreen()
            }
        }
    }
}
