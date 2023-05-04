//
//  RepeatDaysSelectViewDataModel.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/04.
//

import UIKit

var repeatDaysSelectList = [RepeatDaysSelectViewDataModel]()

struct RepeatDaysSelectViewDataModel {
    let title: String
    var checkState: Bool
}

func repeatDaysSelectListInitFunction() {
    repeatDaysSelectList.append(RepeatDaysSelectViewDataModel(title: "월", checkState: false))
    repeatDaysSelectList.append(RepeatDaysSelectViewDataModel(title: "화", checkState: false))
    repeatDaysSelectList.append(RepeatDaysSelectViewDataModel(title: "수", checkState: false))
    repeatDaysSelectList.append(RepeatDaysSelectViewDataModel(title: "목", checkState: false))
    repeatDaysSelectList.append(RepeatDaysSelectViewDataModel(title: "금", checkState: false))
    repeatDaysSelectList.append(RepeatDaysSelectViewDataModel(title: "토", checkState: false))
    repeatDaysSelectList.append(RepeatDaysSelectViewDataModel(title: "일", checkState: false))
}
