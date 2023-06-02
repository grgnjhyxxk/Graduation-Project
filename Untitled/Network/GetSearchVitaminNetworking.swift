//
//  AiVitaminProdNamePostNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/06/02.
//

import UIKit
import Alamofire

struct VitaminAiInformation: Decodable {
    let vitaminA: Int
    let vitaminD: Int
    let vitaminE: Int
    let vitaminK: Int
    let vitaminB1: Int
    let vitaminB2: Int
    let vitaminB6: Int
    let vitaminB12: Int
    let vitaminC: Int
    let nicotinic_acid: Int
    let pantothenic: Int
    let folic_acid: Int
    let biotin: Int
    let calcium: Int
    let magnesium: Int
    let iron: Int
    let copper: Int
    let selenium: Int
    let iodine: Int
    let manganese: Int
    let molybdenum: Int
    let chrome: Int
    let intake_per_day: Int
    let success: Int
}

func searchVitamin() {
    let serverURL = "\(serverURL)"
    let endpoint = "/vitamin/search"
    
    let parameters: Parameters = [
        "finddata": "센트룸 맨"
    ]
    
    AF.request(serverURL + endpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
        .validate(statusCode: 200..<300)
        .responseDecodable(of: VitaminAiInformation.self) { response in
            switch response.result {
            case .success(let vitaminInfo):
                // Handle the decoded data here
                print("Vitamin information:")
                print(vitaminInfo)
            case .failure(let error):
                // Handle the error here
                print("Failed to fetch vitamin information: \(error)")
            }
        }
}
