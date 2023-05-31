//
//  AlarmEditNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/30.
//

import UIKit
import Alamofire

func alarmEditNetworking(index: Int, completion: @escaping (Bool) -> Void) {
    DispatchQueue.main.async {
        showLoadingScreen()
        let serverURLString = "\(serverURL)/alarm/edit" // 서버 주소
        
        checkServerConnection { isConnected in
            if isConnected {
                let header : HTTPHeaders = [
                    "Content-Type" : "application/json"
                ]
                
                let seq = userDataList[0].seq
                let time = alarmEditDataList.last?.date
                let days = alarmEditDataList.last?.repeatDays
                let newalarmname = alarmEditDataList.last?.label
                let box = alarmEditDataList.last?.numOfBox
                let vitamin = alarmEditDataList.last?.vitamins
                let alarmname = userAlarmDataList[index].label
                
                let bodyData: Parameters = [
                    "seq": seq,
                    "time": time!,
                    "days": days!,
                    "newalarmname": newalarmname!,
                    "box": box!,
                    "vitamin": vitamin!,
                    "alarmname": alarmname
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
                        print("알람 편집 네트워킹 성공!")
                        alarmEditDataList.removeAll()
                    } else {
                        completion(false)
                        print("알람 편집 네트워킹 실패..")
                    }
                }
            } else {
                completion(false)
                print("알람 편집 네트워킹 연결 실패")
                networkErrorHandlingAlert()
                hideLoadingScreen()
            }
        }
    }
}
                
