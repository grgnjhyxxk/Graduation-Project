//
//  AlarmViewCellDataModel.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/04/30.
//

import UIKit

var alarmViewCellDataList = [AlarmViewCellDataModel]()

struct AlarmViewCellDataModel {
    var date: String
    var repeatDays: String
    var label: String
    var box: String
}

func alarmViewCellDataListInit() {
    alarmViewCellDataList.removeAll()
    print("alarmViewCellDataList 초기화")
}

// ---------------------------------------------------

var userAlarmDataList = [AlarmViewCellDataModel]()
var alarmEditDataList = [AlarmViewCellDataModel]()

// ---------------------------------------------------

struct BoxCellDataModel {
    var title: String
}

let boxCellData = [
    BoxCellDataModel(title: "1번 보관함"),
    BoxCellDataModel(title: "2번 보관함"),
    BoxCellDataModel(title: "3번 보관함"),
    BoxCellDataModel(title: "4번 보관함"),
    BoxCellDataModel(title: "5번 보관함"),
    BoxCellDataModel(title: "6번 보관함"),
]

// ---------------------------------------------------


