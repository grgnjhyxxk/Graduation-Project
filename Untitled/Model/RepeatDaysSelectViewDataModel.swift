//
//  RepeatDaysSelectViewDataModel.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/04.
//

import UIKit

var repeatDaysSelectList = [RepeatDaysSelectViewDataModel](repeating: RepeatDaysSelectViewDataModel(title: "", checkState: false), count: 7)


struct RepeatDaysSelectViewDataModel {
    let title: String
    var checkState: Bool
}

func repeatDaysSelectListInitFunction() {
    repeatDaysSelectList = [
        RepeatDaysSelectViewDataModel(title: "월", checkState: false),
        RepeatDaysSelectViewDataModel(title: "화", checkState: false),
        RepeatDaysSelectViewDataModel(title: "수", checkState: false),
        RepeatDaysSelectViewDataModel(title: "목", checkState: false),
        RepeatDaysSelectViewDataModel(title: "금", checkState: false),
        RepeatDaysSelectViewDataModel(title: "토", checkState: false),
        RepeatDaysSelectViewDataModel(title: "일", checkState: false)
    ]
}
