//
//  GetRecommenedNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/06/02.
//

import Foundation
import Alamofire

struct RecommendedInfo: Decodable {
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
    let prod_name: String
}

func getRecommened(completion: @escaping (Bool) -> Void) {
    DispatchQueue.main.async {
        showLoadingScreen()
        let serverURLString = "\(serverURL)/vitamin/recommend"
        
        let sumOfValuesList = sumAllOfValues()
        let sumOfNamesList = sumAllOfNames()
        let vitaminSumDict = convertToDictionary(sumOfValuesList)

        // JSON 변환
        guard let jsonData = try? JSONSerialization.data(withJSONObject: vitaminSumDict, options: []) else {
            print("JSON 변환에 실패했습니다.")
            completion(false)
            return
        }

        // JSON 데이터를 문자열로 변환
        guard let jsonString = String(data: jsonData, encoding: .utf8) else {
            print("JSON 문자열 변환에 실패했습니다.")
            completion(false)
            return
        }

        let parameters: Parameters = [
            "vitamincontain": sumOfNamesList,
            "vitaminlist": jsonString // JSON 문자열을 요청에 첨부
        ]
        
        AF.request(serverURLString, method: .get, parameters: parameters)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: [RecommendedInfo].self) { response in
                switch response.result {
                case .success(let recommendedInfo):
                    print("AI 추천정보를 받아오는 데 성공하였습니다.")
                    print("받은 AI 추천정보:")
                    
                    for index in 0..<recommendedInfo.count {
                        aiVitaminSearchDataList.append(AIVitaminData(prod_name: recommendedInfo[index].prod_name, vitamin: [Vitamin(vitaminA: Int(recommendedInfo[index].vitaminA), vitaminD: Int(recommendedInfo[index].vitaminD), vitaminE: Int(recommendedInfo[index].vitaminE), vitaminK: Int(recommendedInfo[index].vitaminK), vitaminB1: Int(recommendedInfo[index].vitaminB1), vitaminB2: Int(recommendedInfo[index].vitaminB2), vitaminB6: Int(recommendedInfo[index].vitaminB6), vitaminB12: Int(recommendedInfo[index].vitaminB12), vitaminC: Int(recommendedInfo[index].vitaminC), nicotinic_acid: Int(recommendedInfo[index].nicotinic_acid), pantothenic: Int(recommendedInfo[index].pantothenic), folic_acid: Int(recommendedInfo[index].folic_acid), biotin: Int(recommendedInfo[index].biotin), calcium: Int(recommendedInfo[index].calcium), magnesium: Int(recommendedInfo[index].magnesium), iron: Int(recommendedInfo[index].iron), copper: Int(recommendedInfo[index].copper), selenium: Int(recommendedInfo[index].selenium), iodine: Int(recommendedInfo[index].iodine), manganese: Int(recommendedInfo[index].manganese), molybdenum: Int(recommendedInfo[index].molybdenum), chrome: Int(recommendedInfo[index].chrome))]))
                    }
                    
                    for i in 0..<aiVitaminSearchDataList.count {
                        print(aiVitaminSearchDataList[i])
                    }
                    
                    print("총 \(aiVitaminSearchDataList.count)개 받았습니다.")
                    
                    noneZeroVitaminAi()
                    
                    hideLoadingScreen()
                    completion(true)
                case .failure(let error):
                    print("AI 추천정보를 받아오는 데 실패했습니다: \(error.localizedDescription)")
                    hideLoadingScreen()
                    networkErrorHandlingAlert()
                    completion(false)
                }
            }
    }
}

func sumAllOfNames() -> Array<String> {
    var sumList: [String] = []

    for vitaminData in userVitaminDataList {
        sumList.append(vitaminData.prod_name)
    }
    
    print(sumList)
    
    return sumList
}


func sumAllOfValues() -> Array<Float> {
    var sumList: [Float] = []

    // 비타민의 합을 계산하여 sumList에 추가하는 함수
    func calculateVitaminSum(_ vitaminKeyPath: KeyPath<Vitamin, Int>) {
        let vitaminSum = userVitaminDataList.reduce(0.0) { $0 + Float($1.vitamin.reduce(0) { $0 + $1[keyPath: vitaminKeyPath] }) }
        sumList.append(vitaminSum)
    }

    // 각 비타민에 대해 calculateVitaminSum 함수를 호출하여 합을 계산하고 sumList에 추가
    calculateVitaminSum(\.vitaminA)
    calculateVitaminSum(\.vitaminD)
    calculateVitaminSum(\.vitaminE)
    calculateVitaminSum(\.vitaminK)
    calculateVitaminSum(\.vitaminB1)
    calculateVitaminSum(\.vitaminB2)
    calculateVitaminSum(\.vitaminB6)
    calculateVitaminSum(\.vitaminB12)
    calculateVitaminSum(\.vitaminC)
    calculateVitaminSum(\.nicotinic_acid)
    calculateVitaminSum(\.pantothenic)
    calculateVitaminSum(\.folic_acid)
    calculateVitaminSum(\.biotin)
    calculateVitaminSum(\.calcium)
    calculateVitaminSum(\.magnesium)
    calculateVitaminSum(\.iron)
    calculateVitaminSum(\.copper)
    calculateVitaminSum(\.selenium)
    calculateVitaminSum(\.iodine)
    calculateVitaminSum(\.manganese)
    calculateVitaminSum(\.molybdenum)
    calculateVitaminSum(\.chrome)

    // sumList 출력
    print(sumList)
    
    return sumList
}

func convertToDictionary(_ sumList: [Float]) -> [String: Float] {
    let vitaminKeys = [
        "vitaminA", "vitaminD", "vitaminE", "vitaminK", "vitaminB1", "vitaminB2",
        "vitaminB6", "vitaminB12", "vitaminC", "nicotinic_acid", "pantothenic",
        "folic_acid", "biotin", "calcium", "magnesium", "iron", "copper",
        "selenium", "iodine", "manganese", "molybdenum", "chrome"
    ]
    
    var vitaminSumDict: [String: Float] = [:]
    
    for (index, key) in vitaminKeys.enumerated() {
        vitaminSumDict[key] = sumList[index]
    }
    
    print(vitaminSumDict)
    
    return vitaminSumDict
}
