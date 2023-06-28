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
    AlarmAddViewCellDataInitModel(title: "보관함", isHidden: false)
]

func alarmAddDataInit() {
    alarmTextFieldText = String()
//    numOfBox = String()
    print("alarmTextFieldText가 초기화되었습니다.")
}

// -----------------------------------------------------------------

//var alarmViewVitaminSelectDataList = [AlarmViewVitaminSelectDataModel]()
//
//struct AlarmViewVitaminSelectDataModel {
//    var checkState: Bool
//}
//
//func alarmViewVitaminSelectDataListInitFunction(count: Int) {
//    for _ in 0..<count {
//        alarmViewVitaminSelectDataList.append(AlarmViewVitaminSelectDataModel(checkState: false))
//    }
//}

// -----------------------------------------------------------------

struct AlarmBoxSelectViewCellDataInitModel {
    let title: String
    let isHidden: Bool
}

let AlarmBoxSelectViewCellData = [
    AlarmAddViewCellDataInitModel(title: "1번 보관함", isHidden: false),
    AlarmAddViewCellDataInitModel(title: "2번 보관함", isHidden: false),
    AlarmAddViewCellDataInitModel(title: "3번 보관함", isHidden: false),
    AlarmAddViewCellDataInitModel(title: "4번 보관함", isHidden: false),
    AlarmAddViewCellDataInitModel(title: "5번 보관함", isHidden: false),
    AlarmAddViewCellDataInitModel(title: "6번 보관함", isHidden: false)
]

// -----------------------------------------------------------------

var boxAndVitaminDataList = [BoxAndVitaminDataModel]()
var testBoxAndVitaminDataList = [BoxAndVitaminDataModel]()

struct BoxAndVitaminDataModel {
    let box: Int
    var vseq: Int
}

func testBoxAndVitaminDataListInit() {
    testBoxAndVitaminDataList = boxAndVitaminDataList
    print("testBoxAndVitaminDataList 초기화")
}

// -----------------------------------------------------------------

var alarmViewBoxinSelectDataList = [AlarmViewBoxSelectDataModel]()

struct AlarmViewBoxSelectDataModel {
    var checkState: Bool
}

func alarmViewBoxinSelectDataListInitFunction(count: Int) {
    for _ in 0..<count {
        alarmViewBoxinSelectDataList.append(AlarmViewBoxSelectDataModel(checkState: false))
    }
}
