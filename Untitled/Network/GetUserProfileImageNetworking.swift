//
//  GetUserProfileImageNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/17.
//

import UIKit
import Alamofire

func getUserProfileImage(seq: Int, completion: @escaping (Bool) -> Void) {
    DispatchQueue.main.async {
        userProfileImageList.removeAll()
        showLoadingScreen()
        let imageUrl = "\(serverURL)/showprofile?profile_img=\(seq)"
        
        AF.request(imageUrl).responseData { response in
            switch response.result {
            case .success(let imageData):
                if let image = UIImage(data: imageData) {
                    userProfileImageList.append(UserProfileImage(image: image))
                    print("이미지 가져오기 성공")
                    hideLoadingScreen()
                    completion(true)
                }
            case .failure(let error):
                userProfileImageList.append(UserProfileImage(image: UIImage()))
                print("이미지 가져오기 실패: \(error)")
                hideLoadingScreen()
                networkErrorHandlingAlert()
                completion(false)
            }
        }
    }
}
