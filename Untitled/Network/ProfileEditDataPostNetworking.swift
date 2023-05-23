//
//  ProfileEditDataPostNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/23.
//

import Foundation
import Alamofire

//func profileEditDataPost() {
//    DispatchQueue.main.async {
//        showLoadingScreen()
//        let serverURLString = "\(serverURL)/register/changeinfo" // 서버 주소
//
//        checkServerConnection { isConnected in
//            if isConnected {
//                guard let image = UIImage(named: "TemporaryUserProfilePicture"),
//                      let imageData = image.pngData() else {
//                    print("프로필 이미지를 가져올 수 없습니다.")
//                    return
//                }
//
//                let seq = userDataList[0].seq
//                let name = userEditProfileDList[0].name
//                let birth = userEditProfileDList[0].birth
//                let gender = userEditProfileDList[0].gender
//
//                AF.upload(multipartFormData: { multipartFormData in
//                    multipartFormData.append(Data("\(seq)".utf8), withName: "seq")
//                    multipartFormData.append(Data("\(name)".utf8), withName: "name")
//                    multipartFormData.append(Data("\(birth)".utf8), withName: "birth")
//                    multipartFormData.append(Data("\(gender)".utf8), withName: "gender")
//                    multipartFormData.append(imageData, withName: "image", fileName: "1.png", mimeType: "image/png")
//                }, to: serverURLString, method: .post)
//                .validate(statusCode: 200..<300)
//                .responseData { response in
//                    hideLoadingScreen()
//                    if response.response?.statusCode == 200 {
//                        print("프로필 편집 데이터 전송 성공!")
//                        print("\(userDataList[0].name) -> \(name)\n\(userDataList[0].birth) -> \(birth)\n\(userDataList[0].name) -> \(gender)")
//                        userDataList[0].name = name
//                        userDataList[0].birth = birth
//                        userDataList[0].gender = gender
//                        userEditProfileDList.removeAll()
//                    } else {
//                        print("프로필 편집 데이터 전송 실패..")
//                    }
//                }
//            } else {
//                print("연결 실패")
//                hideLoadingScreen()
//                networkErrorHandlingAlert()
//            }
//        }
//    }
//}

func profileEditDataPost(completion: @escaping (Bool) -> Void) {
    DispatchQueue.main.async {
        showLoadingScreen()
        let serverURLString = "\(serverURL)/register/changeinfo" // 서버 주소
        
        checkServerConnection { isConnected in
            if isConnected {
                
                let seq = userDataList[0].seq
                let name = userEditProfileDList[0].name
                let birth = userEditProfileDList[0].birth
                let gender = userEditProfileDList[0].gender
                let editedImage = userEditProfileDList[0].image
                if let editedImageData = editedImage.pngData() {
                    AF.upload(multipartFormData: { multipartFormData in
                        multipartFormData.append(Data("\(seq)".utf8), withName: "seq")
                        multipartFormData.append(Data("\(name)".utf8), withName: "name")
                        multipartFormData.append(Data("\(birth)".utf8), withName: "birth")
                        multipartFormData.append(Data("\(gender)".utf8), withName: "gender")
                        multipartFormData.append(editedImageData, withName: "image", fileName: "\(seq).png", mimeType: "image/png")
                    }, to: serverURLString, method: .post)
                    .validate(statusCode: 200..<300)
                    .responseData { response in
                        if response.response?.statusCode == 200 {
                            print("프로필 편집 데이터 전송 성공!")
                            print("\(userDataList[0].name) -> \(name)\n\(userDataList[0].birth) -> \(birth)\n\(userDataList[0].name) -> \(gender)")
                            userDataList[0].name = name
                            userDataList[0].birth = birth
                            userDataList[0].gender = gender
                            userProfileImageList[0].image = userEditProfileDList[0].image
                            userEditProfileDList.removeAll()
                            hideLoadingScreen()
                            completion(true)
                        } else {
                            completion(false)
                            networkErrorHandlingAlert()
                            hideLoadingScreen()
                            print("프로필 편집 데이터 전송 실패..")
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

