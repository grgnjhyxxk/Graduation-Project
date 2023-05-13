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
    case "월 화 수 목 금 토 일":
        repeatDaysDataContractionText = "매일"
    case "토 일":
        repeatDaysDataContractionText = "주말"
    default:
        return data
    }
    print("반복 주기의 문자열 변환 과정이 정상적으로 처리되었습니다.")
    return repeatDaysDataContractionText
}

func repeatDaysDataReverseContraction(data: Array<AlarmViewCellDataModel>, index: Int) {
    repeatDaysSelectListInitFunction()
    
    switch data[index].repeatDays{
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
        repeatDaysSelectList[0].checkState = false
        repeatDaysSelectList[1].checkState = false
        repeatDaysSelectList[2].checkState = false
        repeatDaysSelectList[3].checkState = false
        repeatDaysSelectList[4].checkState = false
        repeatDaysSelectList[5].checkState = false
        repeatDaysSelectList[6].checkState = false
        break
    }
    print("알람 편집 중 반복 주기 리버스 과정이 정상적으로 처리되었습니다.")
}
