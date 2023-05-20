//
//  GetUserProfileImageNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/17.
//

import UIKit
import Alamofire

func getUserProfileImage() {
//    let url = URL(string: "\(serverURL)/showprofile?profile_img=default_image")
//    let imageView = UIImageView()
//    imageView.load(url: url!)
//    let image = imageView.image
//    userProfileImageList.append(UserProfileImage(image: image ?? UIImage()))
//    print("성공")
    
    // 이미지를 가져올 URL
    let imageUrl = "http://180.83.19.43:8001/showprofile?profile_img=default_image"

    // Alamofire를 사용하여 이미지 요청
    AF.request(imageUrl).responseData { response in
        switch response.result {
        case .success(let imageData):
            // 이미지 데이터를 사용하여 작업을 수행합니다.
            if let image = UIImage(data: imageData) {
                // 이미지를 사용합니다.
                userProfileImageList.append(UserProfileImage(image: image))
                print("이미지 가져오기 성공")
            }
        case .failure(let error):
            // 요청이 실패한 경우 에러를 처리합니다.
            userProfileImageList.append(UserProfileImage(image: UIImage()))
            print("이미지 가져오기 실패: \(error)")
        }
    }

}
