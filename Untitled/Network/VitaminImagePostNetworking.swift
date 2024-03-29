//
//  VitaminImagePostNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/24.
//

import UIKit
import Alamofire

func vitaminImageDataPost(completion: @escaping (Bool) -> Void) {
    LoadingView.show(loadingText: "영양제 이미지 데이터 전송 중")
    DispatchQueue.global().async {
//        showLoadingScreen()
        let serverURLString = "\(serverURL)/sendimage" // 서버 주소
        
        checkServerConnection { isConnected in
            if isConnected {
                let seq = userDataList[0].seq
                let vitaminImage = vitaminImageDataList[0].image
                let vitaminname = vitaminBasicDataList[0].name
                
                print("\(seq), \(vitaminname)")
                
                if let vitaminImageData = vitaminImage.pngData() {
                    AF.upload(multipartFormData: { multipartFormData in
                        multipartFormData.append(Data("\(vitaminname)".utf8), withName: "prodname")
                        multipartFormData.append(vitaminImageData, withName: "image", fileName: "\(seq).png", mimeType: "image/png")
                    }, to: serverURLString, method: .post)
                    .validate(statusCode: 200..<300)
                    .responseData { response in
                        if response.response?.statusCode == 200 {
                            print("비타민 이미지 데이터 전송 성공!")
                            vitaminImageDataListInit()
//                            hideLoadingScreen()
                            LoadingView.hide()
                            completion(true)
                        } else {
                            completion(false)
                            networkErrorHandlingAlert()
//                            hideLoadingScreen()
                            LoadingView.hide()
                            print("비타민 이미지 데이터 전송 실패..")
                        }
                    }
                } else {
                    completion(false)
                    print("이미지 데이터 변환 실패")
                    networkErrorHandlingAlert()
                    hideLoadingScreen()
                    LoadingView.hide()
                }
            } else {
                completion(false)
                print("연결 실패")
//                hideLoadingScreen()
                LoadingView.hide()
                networkErrorHandlingAlert()
            }
        }
    }
}

func vitaminSearchImageDataPost(completion: @escaping (Bool) -> Void) {
    DispatchQueue.main.async {
//        showLoadingScreen()
        let serverURLString = "\(serverURL)/sendimage" // 서버 주소
        
        checkServerConnection { isConnected in
            if isConnected {
                let seq = userDataList[0].seq
                let vitaminImage = vitaminImageDataList[0].image
                let vitaminname = userVitaminSearchDataList[0].prod_name
                
                print("\(seq), \(vitaminname)")
                
                if let vitaminImageData = vitaminImage.pngData() {
                    AF.upload(multipartFormData: { multipartFormData in
                        multipartFormData.append(Data("\(vitaminname)".utf8), withName: "prodname")
                        multipartFormData.append(vitaminImageData, withName: "image", fileName: "\(seq).png", mimeType: "image/png")
                    }, to: serverURLString, method: .post)
                    .validate(statusCode: 200..<300)
                    .responseData { response in
                        if response.response?.statusCode == 200 {
                            print("비타민 이미지 데이터 전송 성공!")
                            vitaminImageDataListInit()
                            hideLoadingScreen()
                            completion(true)
                        } else {
                            completion(false)
                            networkErrorHandlingAlert()
                            hideLoadingScreen()
                            print("비타민 이미지 데이터 전송 실패..")
                        }
                    }
                } else {
                    completion(false)
                    print("이미지 데이터 변환 실패")
                    networkErrorHandlingAlert()
                    hideLoadingScreen()
                }
            } else {
                completion(false)
                print("연결 실패")
                hideLoadingScreen()
                networkErrorHandlingAlert()
            }
        }
    }
}
