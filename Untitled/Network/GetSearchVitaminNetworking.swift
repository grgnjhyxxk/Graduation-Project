//
//  GetSearchVitaminNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/06/02.
//

import Alamofire

struct VitaminAiInformation: Decodable {
    let vitaminA: Float
    let vitaminD: Float
    let vitaminE: Float
    let vitaminK: Float
    let vitaminB1: Float
    let vitaminB2: Float
    let vitaminB6: Float
    let vitaminB12: Float
    let vitaminC: Float
    let nicotinic_acid: Float
    let pantothenic: Float
    let folic_acid: Float
    let biotin: Float
    let calcium: Float
    let magnesium: Float
    let iron: Float
    let copper: Float
    let selenium: Float
    let iodine: Float
    let manganese: Float
    let molybdenum: Float
    let chrome: Float
    let intake_per_day: Int
    let success: Int
}

func getSearchVitamin(prodname: String, completion: @escaping (Bool) -> Void) {
    DispatchQueue.main.async {
        showLoadingScreen()
        let serverURLString = "\(serverURL)/vitamin/search"
        
        let parameters: Parameters = [
            "prodname": prodname
        ]
        
//        if prodname != "센트룸 맨" {
//            print("DB에 없는 영양소.")
//            completion(false)
//        }
        
        AF.request(serverURLString, method: .get, parameters: parameters)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: VitaminAiInformation.self) { response in
                switch response.result {
                case .success(let vitaminAiInformation):
                    print("비타민 검색 정보를 받아오는 데 성공하였습니다.")
                    print("받은 비타민 검색 정보:")
                    
                    print(vitaminAiInformation)
                    
                    userVitaminSearchDataList.append(UserVitaminData(vseq: -1, prod_name: prodname, intake_per_day: vitaminAiInformation.intake_per_day, taken: 0, image: Data(), vitamin: [Vitamin(vitaminA: Int(vitaminAiInformation.vitaminA), vitaminD: Int(vitaminAiInformation.vitaminD), vitaminE: Int(vitaminAiInformation.vitaminE), vitaminK: Int(vitaminAiInformation.vitaminK), vitaminB1: Int(vitaminAiInformation.vitaminB1), vitaminB2: Int(vitaminAiInformation.vitaminB2), vitaminB6: Int(vitaminAiInformation.vitaminB6), vitaminB12: Int(vitaminAiInformation.vitaminB12), vitaminC: Int(vitaminAiInformation.vitaminC), nicotinic_acid: Int(vitaminAiInformation.nicotinic_acid), pantothenic: Int(vitaminAiInformation.pantothenic), folic_acid: Int(vitaminAiInformation.folic_acid), biotin: Int(vitaminAiInformation.biotin), calcium: Int(vitaminAiInformation.calcium), magnesium: Int(vitaminAiInformation.magnesium), iron: Int(vitaminAiInformation.iron), copper: Int(vitaminAiInformation.copper), selenium: Int(vitaminAiInformation.selenium), iodine: Int(vitaminAiInformation.iodine), manganese: Int(vitaminAiInformation.manganese), molybdenum: Int(vitaminAiInformation.molybdenum), chrome: Int(vitaminAiInformation.chrome))]))

                    noneZeroVitaminSearch()
                    
                    hideLoadingScreen()
                    completion(true)
                case .failure(let error):
                    print("비타민 검색 정보를 받아오는 데 실패했습니다: \(error.localizedDescription)")
                    hideLoadingScreen()
                    networkErrorHandlingAlert()
                    completion(false)
                }
            }
    }
}
