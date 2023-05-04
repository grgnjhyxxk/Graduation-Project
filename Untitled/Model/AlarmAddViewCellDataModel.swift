//
//  AlarmAddViewCellDataModel.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/02.
//

import UIKit

struct AlarmAddViewCellDataModel {
    let title: String
    let isHidden: Bool
}

let AlarmAddViewCellData = [
    AlarmAddViewCellDataModel(title: "반복", isHidden: false),
    AlarmAddViewCellDataModel(title: "레이블", isHidden: false),
    AlarmAddViewCellDataModel(title: "사용자", isHidden: false),
    AlarmAddViewCellDataModel(title: "다시 알림", isHidden: false)
]
