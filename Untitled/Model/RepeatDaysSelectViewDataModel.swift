//
//  RepeatDaysSelectViewDataModel.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/04.
//

import UIKit

var repeatDaysSelectList = [RepeatDaysSelectViewDataInitModel](repeating: RepeatDaysSelectViewDataInitModel(title: "", checkState: false), count: 7)

struct RepeatDaysSelectViewDataInitModel {
    let title: String
    var checkState: Bool
}

func repeatDaysSelectListInitFunction() {
    repeatDaysSelectList = [
        RepeatDaysSelectViewDataInitModel(title: "월", checkState: false),
        RepeatDaysSelectViewDataInitModel(title: "화", checkState: false),
        RepeatDaysSelectViewDataInitModel(title: "수", checkState: false),
        RepeatDaysSelectViewDataInitModel(title: "목", checkState: false),
        RepeatDaysSelectViewDataInitModel(title: "금", checkState: false),
        RepeatDaysSelectViewDataInitModel(title: "토", checkState: false),
        RepeatDaysSelectViewDataInitModel(title: "일", checkState: false)
    ]
}

func repeatDaysDataContraction(data: String) -> String {
    switch data {
    case "월 화 수 목 금":
        repeatDaysDataContractionText = "주중"
        return "주중"
    case "월 화 수 목 금 토 일":
        repeatDaysDataContractionText = "매일"
        return "매일"
    case "토 일":
        repeatDaysDataContractionText = "주말"
        return "주말"
    default:
        repeatDaysDataContractionText = "\(data)"
        return data
    }
}

func repeatDaysDataReverseContraction(index: Int) {
    repeatDaysSelectListInitFunction()
    
    switch alarmViewCellDataList[index].repeatDays{
    case "주중":
        repeatDaysSelectList[0].checkState = true
        repeatDaysSelectList[1].checkState = true
        repeatDaysSelectList[2].checkState = true
        repeatDaysSelectList[3].checkState = true
        repeatDaysSelectList[4].checkState = true
    case "매일":
        repeatDaysSelectList[0].checkState = true
        repeatDaysSelectList[1].checkState = true
        repeatDaysSelectList[2].checkState = true
        repeatDaysSelectList[3].checkState = true
        repeatDaysSelectList[4].checkState = true
        repeatDaysSelectList[5].checkState = true
        repeatDaysSelectList[6].checkState = true
    case "주말":
        repeatDaysSelectList[5].checkState = true
        repeatDaysSelectList[6].checkState = true
    default:
        let days = alarmViewCellDataList[index].repeatDays.split(separator: " ")
        for day in days {
            switch day {
            case "월":
                repeatDaysSelectList[0].checkState = true
            case "화":
                repeatDaysSelectList[1].checkState = true
            case "수":
                repeatDaysSelectList[2].checkState = true
            case "목":
                repeatDaysSelectList[3].checkState = true
            case "금":
                repeatDaysSelectList[4].checkState = true
            case "토":
                repeatDaysSelectList[5].checkState = true
            case "일":
                repeatDaysSelectList[6].checkState = true
            default:
                break
            }
        }
    }
    print("알람 편집 중 반복 주기 리버스 과정이 정상적으로 처리되었습니다.")
}
