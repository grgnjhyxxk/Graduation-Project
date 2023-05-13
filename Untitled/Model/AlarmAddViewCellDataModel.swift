//
//  AlarmAddViewCellDataModel.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/02.
//

import UIKit

var alarmTextFieldText = String()
var repeatDaysDataContractionText = String()

struct AlarmAddViewCellDataInitModel {
    let title: String
    let isHidden: Bool
}

let AlarmAddViewCellData = [
    AlarmAddViewCellDataInitModel(title: "반복", isHidden: false),
    AlarmAddViewCellDataInitModel(title: "레이블", isHidden: false),
    AlarmAddViewCellDataInitModel(title: "사용자", isHidden: false),
    AlarmAddViewCellDataInitModel(title: "다시 알림", isHidden: false)
]

func alarmTextFieldTextInit() {
    alarmTextFieldText = String()
    print("alarmTextFieldText가 초기화되었습니다.")
}
