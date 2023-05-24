//
//  VitaminGetNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/24.
//

import Alamofire

struct VitaminInformation: Decodable {
    let prod_name: String
    let intake_per_day: Int
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
}

func getVitaminInformation(seq: Int) {
    let serverURLString = "http://180.83.19.43:8001/vitamin/get"
    
    let parameters: Parameters = [
        "seq": seq
    ]
    
    AF.request(serverURLString, method: .get, parameters: parameters)
        .validate(statusCode: 200..<300)
        .responseDecodable(of: [VitaminInformation].self) { response in
            switch response.result {
            case .success(let vitaminInformation):
                print("받은 비타민 정보:")
                
                for info in vitaminInformation {
                    print("제품명: \(info.prod_name)")
                    print("하루 섭취량: \(info.intake_per_day)")
                    print("비타민 A: \(info.vitaminA)")
                    print("비타민 D: \(info.vitaminD)")
                    print("비타민 E: \(info.vitaminE)")
                    print("비타민 K: \(info.vitaminK)")
                    print("비타민 B1: \(info.vitaminB1)")
                    print("비타민 B2: \(info.vitaminB2)")
                    print("비타민 B6: \(info.vitaminB6)")
                    print("비타민 B12: \(info.vitaminB12)")
                    print("비타민 C: \(info.vitaminC)")
                    print("니아신: \(info.nicotinic_acid)")
                    print("판토텐산: \(info.pantothenic)")
                    print("엽산: \(info.folic_acid)")
                    print("생물학적 활성 피로산: \(info.biotin)")
                    print("칼슘: \(info.calcium)")
                    print("마그네슘: \(info.magnesium)")
                    print("철: \(info.iron)")
                    print("구리: \(info.copper)")
                    print("셀레늄: \(info.selenium)")
                    print("요오드: \(info.iodine)")
                    print("망간: \(info.manganese)")
                    print("몰리브덴: \(info.molybdenum)")
                    print("크롬: \(info.chrome)")
                    print("")
                }
            case .failure(let error):
                print("비타민 정보를 받아오는 데 실패했습니다: \(error.localizedDescription)")
            }
        }
}






