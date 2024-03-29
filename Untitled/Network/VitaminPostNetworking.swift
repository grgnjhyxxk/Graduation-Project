//
//  VitaminPostNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/24.
//

import Foundation
import Alamofire

func sendRequestWithJSONPayload(completion: @escaping (Bool) -> Void) {
//    showLoadingScreen()
    LoadingView.show(loadingText: "영양제 데이터 전송 중")
    
    DispatchQueue.global().async {
        guard let seq = userDataList.first?.seq else {
            print("사용자 데이터가 없습니다.")
            return
        }
        
        guard let basicData = vitaminBasicDataList.first else {
            print("영양제 기본 데이터가 없습니다.")
            return
        }
        
        let serverURLString = "\(serverURL)/vitamin/add" // 서버 URL을 입력해주세요
        
        checkServerConnection() { isConnected in
            if isConnected {
                let header : HTTPHeaders = [
                    "Content-Type" : "application/json"
                ]
                
                var bodyData: Parameters = [
                    "seq": seq,
                    "prod_name": basicData.name,
                    "intake_per_day": basicData.perday
                ]
                
                for ingredient in ingredientsCellDataList {
                    bodyData[ingredient.name] = ingredient.content
                }
                
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
                        print("영양제 데이터 전송 성공!")
                    } else {
                        completion(false)
                        print("영양제 데이터 전송 실패..")
                    }
                }
            } else {
                completion(false)
                print("영양제 데이터 전송 연결 실패")
                networkErrorHandlingAlert()
//                hideLoadingScreen()
                LoadingView.hide()
            }
        }
    }
}

func sendRequestWithJSONPayloadSearch(completion: @escaping (Bool) -> Void) {
//    showLoadingScreen()
    LoadingView.show(loadingText: "영양제 데이터 전송 중")

    DispatchQueue.global().async {
        guard let seq = userDataList.first?.seq else {
            print("사용자 데이터가 없습니다.")
            return
        }
        
        guard let basicData = userVitaminSearchDataList.last else {
            print("영양제 기본 데이터가 없습니다.")
            return
        }
        
        let serverURLString = "\(serverURL)/vitamin/add" // 서버 URL을 입력해주세요
        
        checkServerConnection() { isConnected in
            if isConnected {
                let header : HTTPHeaders = [
                    "Content-Type" : "application/json"
                ]
                
                var bodyData: Parameters = [
                    "seq": seq,
                    "prod_name": basicData.prod_name,
                    "intake_per_day": basicData.intake_per_day
                ]
                
                for ingredient in ingredientsCellDataList {
                    bodyData[ingredient.name] = ingredient.content
                }
                
                for i in 0..<vitaminSearchNames[0].count {
                    bodyData[vitaminSearchNames[0][i]] = vitaminSearchValues[0][i]
                }
                
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
                        print("영양제 데이터 전송 성공!")
                    } else {
                        completion(false)
                        print("영양제 데이터 전송 실패..")
                    }
                }
            } else {
                completion(false)
                print("영양제 데이터 전송 연결 실패")
                networkErrorHandlingAlert()
//                hideLoadingScreen()
                LoadingView.hide()
            }
        }
    }
}



