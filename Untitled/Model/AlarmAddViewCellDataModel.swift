//
//  AlarmAddViewCellDataModel.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/02.
//

import UIKit

var alarmTextFieldText = String()
var repeatDaysDataContractionText = String()
var numOfBox = String()

struct AlarmAddViewCellDataInitModel {
    let title: String
    let isHidden: Bool
}

let AlarmAddViewCellData = [
    AlarmAddViewCellDataInitModel(title: "반복", isHidden: false),
    AlarmAddViewCellDataInitModel(title: "레이블", isHidden: false),
    AlarmAddViewCellDataInitModel(title: "보관함", isHidden: false),
    AlarmAddViewCellDataInitModel(title: "영양제", isHidden: false)
]

func alarmAddDataInit() {
    alarmTextFieldText = String()
    numOfBox = String()
    print("numOfBox, alarmTextFieldText가 초기화되었습니다.")
}

// -----------------------------------------------------------------

var alarmViewVitaminSelectDataList = [AlarmViewVitaminSelectDataModel]()

struct AlarmViewVitaminSelectDataModel {
    var checkState: Bool
}

func alarmViewVitaminSelectDataListInitFunction(count: Int) {
    for _ in 0..<count {
        alarmViewVitaminSelectDataList.append(AlarmViewVitaminSelectDataModel(checkState: false))
    }
}
