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
    var user: String
    var repeatSwitchState: Bool
}
