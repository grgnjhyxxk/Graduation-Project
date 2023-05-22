//
//  ProfileEditDataPostNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/23.
//

import Foundation
import Alamofire

func ProfileEditDataPost() {
    let serverURLString = "\(serverURL)/register/changeinfo" // 서버 주소
    
    let image = UIImage(named: "TemporaryUserProfilePicture")
    
    checkServerConnection { isConnected in
        if isConnected {
            let parameters: Parameters = [
                "seq" : 1,
                "name" : "test재혁",
                "birth" : "19991234",
                "gender" : 0,
                "profileImg" : image!.jpegData(compressionQuality: 0.8)!,
                "profileImg_name" : "1_img"
            ]

            AF.request(serverURLString, method: .post, parameters: parameters)
                .validate(statusCode: 200..<300)
                .responseData { response in
                    hideLoadingScreen()
                    if response.response?.statusCode == 200 {
                        print("전송 성공!")
                    } else {
                        print("전송 실패..")
                    }
                }
        } else {
            print("연결 실패")
            networkErrorHandlingAlert()
            hideLoadingScreen()
        }
    }
}

func sendProfileImageToServer() {
    DispatchQueue.main.async {
        showLoadingScreen()
        let serverURLString = "\(serverURL)/register/changeprofileimg" // 서버 주소
        
        checkServerConnection { isConnected in
            if isConnected {
                guard let image = UIImage(named: "TemporaryUserProfilePicture"),
                      let imageData = image.jpegData(compressionQuality: 0.8) else {
                    print("프로필 이미지를 가져올 수 없습니다.")
                    return
                }
                
                AF.upload(multipartFormData: { multipartFormData in
                    multipartFormData.append(imageData, withName: "profileImg", fileName: "profile_image.jpg", mimeType: "image/jpeg")
                }, to: serverURLString, method: .post)
                .validate(statusCode: 200..<300)
                .responseData { response in
                    hideLoadingScreen()
                    if response.response?.statusCode == 200 {
                        print("이미지 전송 성공!")
                    } else {
                        print("이미지 전송 실패..")
                    }
                }
            } else {
                print("연결 실패")
                hideLoadingScreen()
                networkErrorHandlingAlert()
            }
        }
    }
}


