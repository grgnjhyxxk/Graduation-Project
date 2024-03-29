//
//  GetVitaminImageNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/30.
//

import UIKit
import Alamofire

func getVitaminImage(seq: Int, completion: @escaping (Bool) -> Void) {
    LoadingView.show(loadingText: "영양제 이미지 데이터 가져오는 중")

    DispatchQueue.global().async {
        userProfileImageList.removeAll()
//        showLoadingScreen()
        let imageUrl = "\(serverURL)/sendimage"
        
        AF.request(imageUrl).responseData { response in
            switch response.result {
            case .success(let imageData):
                if let image = UIImage(data: imageData) {
                    userProfileImageList.append(UserProfileImage(image: image))
                    print("영양제 이미지 가져오기 성공")
//                    hideLoadingScreen()
                    LoadingView.hide()
                    completion(true)
                }
            case .failure(let error):
                userProfileImageList.append(UserProfileImage(image: UIImage()))
                print("영양제 이미지 가져오기 실패: \(error)")
//                hideLoadingScreen()
                LoadingView.hide()
                networkErrorHandlingAlert()
                completion(false)
            }
        }
    }
}
