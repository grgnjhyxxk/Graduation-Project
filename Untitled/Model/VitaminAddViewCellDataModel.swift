//
//  VitaminAddViewCellDataModel.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/23.
//

import UIKit

struct VitaminAddViewCellDataModel {
    let title: String
    let isHidden: Bool
}

let vitaminAddViewCellData = [
    ProfileEditViewCellDataModel(title: "이름", isHidden: false),
    ProfileEditViewCellDataModel(title: "생년월일", isHidden: false),
    ProfileEditViewCellDataModel(title: "성별", isHidden: false),
    ProfileEditViewCellDataModel(title: "기기번호", isHidden: false)
]
