//
//  AlarmDeleteNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/30.
//

import UIKit
import Alamofire

func alarmDelete(index: Int, completion: @escaping (Bool) -> Void) {
    LoadingView.show(loadingText: "알람 데이터 삭제 요청 중")

    DispatchQueue.global().async {
//        showLoadingScreen()
        let serverURLString = "\(serverURL)/alarm/remove" // 서버 주소
        
        guard let seq = userDataList.first?.seq else {
            print("사용자 데이터가 없습니다.")
            return
        }

        let alarm_name = userAlarmDataList[index].label
        
        print("\(seq), \(alarm_name)")
        
        checkServerConnection() { isConnected in
            if isConnected {
                let header : HTTPHeaders = [
                    "Content-Type" : "application/json"
                ]
                
                let bodyData: Parameters = [
                    "seq": seq,
                    "alarmname": alarm_name,
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
//                    hideLoadingScreen()
                    LoadingView.hide()
                    if response.response?.statusCode == 200 {
                        completion(true)
                        print("알람 삭제 네트워킹 성공!")
                    } else {
                        completion(false)
                        print("알람 삭제 네트워킹 실패..")
                    }
                }
            } else {
                completion(false)
                print("알람 삭제 네트워킹 연결 실패")
                networkErrorHandlingAlert()
//                hideLoadingScreen()
                LoadingView.hide()
            }
        }
    }
}
