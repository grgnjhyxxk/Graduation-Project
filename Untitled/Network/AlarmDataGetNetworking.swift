//
//  AlarmDataGetNetworking.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/30.
//

import UIKit
import Alamofire

struct AlarmInformation: Decodable {
    let alarm_name: String
    let alarm_time: String
    let days: String
    let box: Int
    let vitamin: String
}

func getAlarmData(seq: Int, completion: @escaping (Bool) -> Void) {
    DispatchQueue.main.async {
        showLoadingScreen()
        let serverURLString = "\(serverURL)/alarm/get"
        
        let parameters: Parameters = [
            "seq": seq
        ]
        
        AF.request(serverURLString, method: .get, parameters: parameters)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: [AlarmInformation].self) { response in
                switch response.result {
                case .success(let alarmInformation):
                    print("알람정보를 받아오는 데 성공하였습니다.")
                    print("받은 알람정보:")
                    
                    print(alarmInformation)
                    
                    for index in 0..<alarmInformation.count {
                        let alarm_name = alarmInformation[index].alarm_name
                        let alarm_time = alarmInformation[index].alarm_time
                        let days = alarmInformation[index].days
                        let box = alarmInformation[index].box
                        let vitamin = alarmInformation[index].vitamin
                        userAlarmDataList.append(AlarmViewCellDataModel(date: alarm_time, repeatDays: days, label: alarm_name, numOfBox: box, vitamins: vitamin))
                    }
                    
                    hideLoadingScreen()
                    completion(true)
                case .failure(let error):
                    print("알람정보를 받아오는 데 실패했습니다: \(error.localizedDescription)")
                    hideLoadingScreen()
                    networkErrorHandlingAlert()
                    completion(false)
                }
            }
    }
}
