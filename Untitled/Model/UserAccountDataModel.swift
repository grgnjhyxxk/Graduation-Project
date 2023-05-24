//
//  UserAccountDataModel.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/12.
//

import UIKit

var userAccountDataList = [UserAccountDataModel]()

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

func userAccountDataListInit() {
    userAccountDataList.removeAll()
    print("userAccountDataList 초기화")
}

// -----------------------------------------------------------------

var userDataList = [UserDataAtServer]()

struct UserDataAtServer: Codable {
    var seq: Int
    var id : String
    var name: String
    var gender: Int
    var birth: Int
    var serial_id: Int
}

func userDataListInit() {
    userDataList.removeAll()
    print("userDataList 초기화")
}

// -----------------------------------------------------------------

var userProfileImageList = [UserProfileImage]()

struct UserProfileImage {
    var image: UIImage
}

func userProfileImageListInit() {
    userProfileImageList.removeAll()
    print("userProfileImageList 초기화")
}

// -----------------------------------------------------------------

var userEditProfileDList = [UserEditProfileData]()

struct UserEditProfileData {
    var name: String
    var gender: Int
    var birth: Int
    var image: UIImage
}

func userEditProfileDListInit() {
    userEditProfileDList.removeAll()
    print("userEditProfileDList 초기화")
}
