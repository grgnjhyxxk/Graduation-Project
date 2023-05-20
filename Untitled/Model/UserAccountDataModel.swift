//
//  UserAccountDataModel.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/12.
//

import UIKit

var userAccountDataList = [UserAccountDataModel]()
var userDataList = [UserDataAtServer]()
var userProfileImageList = [UserProfileImage]()

struct UserAccountDataModel {
    var userid: String
    var userpassword: String
    var serialNumber: Int
    var users: [User] // User 구조체를 배열로 선언
}

struct User {
    var userName: String
    var userBirth: Int
    var userGender: Bool
}

struct UserDataAtServer: Codable {
    var seq: Int
    var id : String
    var name: String
    var gender: Int
    var birth: Int
    var serial_id: Int
}

struct UserProfileImage {
    var image: UIImage
}


