//
//  ProfileEditViewDataModel.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/16.
//

import UIKit

struct ProfileEditViewCellDataModel {
    let title: String
    let isHidden: Bool
}

let profileEditViewCellData = [
    ProfileEditViewCellDataModel(title: "이름", isHidden: false),
    ProfileEditViewCellDataModel(title: "생년월일", isHidden: false),
    ProfileEditViewCellDataModel(title: "성별", isHidden: false),
    ProfileEditViewCellDataModel(title: "기기번호", isHidden: false)
]
