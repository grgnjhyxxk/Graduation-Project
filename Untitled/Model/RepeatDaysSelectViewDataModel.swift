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
