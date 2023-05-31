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
    var numOfBox: Int
    var vitamins: String
}

func alarmViewCellDataListInit() {
    alarmViewCellDataList.removeAll()
    print("alarmViewCellDataList 초기화")
}

// ---------------------------------------------------

var userAlarmDataList = [AlarmViewCellDataModel]()
var alarmEditDataList = [AlarmViewCellDataModel]()
