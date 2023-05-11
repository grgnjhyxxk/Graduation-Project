//
//  UserAccountDataModel.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/12.
//

import UIKit

var userAccountDataList = [UserAccountDataModel]()

struct UserAccountDataModel {
    var userName: String
    var userBirth: String
    var userGender: String
    var userImage: UIImage
    var userid: String
    var userpassword: String
}
