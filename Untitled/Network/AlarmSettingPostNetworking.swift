//
//  AlarmSettingPostNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/30.
//

import UIKit
import Alamofire

func alarmSettingPost(boxList: Array<Int>, vseqList: Array<Int>, intakePerDayList: Array<Int>, completion: @escaping (Bool) -> Void) {
    DispatchQueue.main.async {
        showLoadingScreen()
        let serverURLString = "\(serverURL)/device/send" // 서버 주소
        
        guard let seq = userDataList.first?.seq else {
            print("사용자 데이터가 없습니다.")
            return
        }
    
        var message = "\(seq) "
    
        for i in 0..<boxList.count {
            message += "\(boxList[i])\(vseqList[i])\(intakePerDayList[i])"
            if i != boxList.count-1 {
                message += " "
            }
        }
        
        print("\(message)")
    
        checkServerConnection() { isConnected in
            if isConnected {
                let header : HTTPHeaders = [
                    "Content-Type" : "application/json"
                ]
                
                let bodyData: Parameters = [
                    "seq": seq,
                    "box": boxList,
                    "intake": intakePerDayList,
                    "vseq": vseqList
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
                        completion(true)
                        print("알람 설정 정보 네트워킹 성공!")
                    } else {
                        completion(false)
                        print("알람 설정 정보 네트워킹 실패..")
                    }
                }
            } else {
                completion(false)
                print("알람 설정 정보 네트워킹 연결 실패")
                networkErrorHandlingAlert()
                hideLoadingScreen()
            }
        }
    }
}
