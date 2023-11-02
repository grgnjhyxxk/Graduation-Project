//
//  GetBoxAndVitaminNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/06/01.
//

import UIKit
import Alamofire

struct BoxAndVitaminInformation: Decodable {
    let boxnum: Int
    let contain_vitamin: Int
}

func getBoxAndVitamin(completion: @escaping (Bool) -> Void) {
    LoadingView.show(loadingText: "박스 데이터 가져오는 중")
    
    DispatchQueue.global().async {
//        showLoadingScreen()
        let serverURLString = "\(serverURL)/box/getbox"
        
        let seq = userDataList[0].seq
        
        let parameters: Parameters = [
            "seq": seq
        ]
        
        AF.request(serverURLString, method: .get, parameters: parameters)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: [BoxAndVitaminInformation].self) { response in
                switch response.result {
                case .success(let boxAndVitaminInformation):
                    print("박스 정보 가져오기 성공: \n\(boxAndVitaminInformation)")
                    for i in 0..<boxAndVitaminInformation.count {
                        let box = boxAndVitaminInformation[i].boxnum
                        let vseq = boxAndVitaminInformation[i].contain_vitamin
                        boxAndVitaminDataList.append(BoxAndVitaminDataModel(box: box, vseq: vseq))
                    }
                    
//                    hideLoadingScreen()
                    LoadingView.hide()
                    completion(true)
                case .failure(let error):
                    print("박스 정보 가져오기 실패: \(error)")
//                    hideLoadingScreen()
                    LoadingView.hide()
                    networkErrorHandlingAlert()
                    completion(false)
                }
            }
    }
}

