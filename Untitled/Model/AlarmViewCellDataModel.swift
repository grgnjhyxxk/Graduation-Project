//
//  AlarmViewCellDataModel.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/04/30.
//

import UIKit

var alarmViewCellDataList = [AlarmViewCellDataModel]()

struct AlarmViewCellDataModel {
    let date: String
    let repeatDays: String
    let label: String
    let user: Int
    let repeatSwitchState: Bool
    let userImage: UIImage
}
