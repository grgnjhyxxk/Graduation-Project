//
//  VitaminAddViewCellDataModel.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/23.
//

import UIKit

var vitaminNameTextFieldText = String()
var perdayTextFieldText = String()

struct VitaminAddViewCellDataModel {
    let title: String
    let isHidden: Bool
}

let vitaminAddViewCellData = [
    VitaminAddViewCellDataModel(title: "제품명", isHidden: false),
    VitaminAddViewCellDataModel(title: "성분", isHidden: false),
    VitaminAddViewCellDataModel(title: "섭취량", isHidden: false),
]

// -----------------------------------------------------------------

var ingredientsCellDataList = [IngredientsCellDataModel]()

struct IngredientsCellDataModel {
    let name: String
    let content: Int
}

func ingredientsCellDataListInit() {
    ingredientsCellDataList.removeAll()
    print("ingredientsCellDataList 초기화")
}

// -----------------------------------------------------------------

var vitaminBasicDataList = [VitaminBasicDataModel]()

struct VitaminBasicDataModel {
    let name: String
    let perday: Int
}

func vitaminBasicDataListInit() {
    vitaminBasicDataList.removeAll()
    print("vitaminBasicDataList 초기화")
}

// -----------------------------------------------------------------

var vitaminImageDataList = [VitaminImageDataModel]()

struct VitaminImageDataModel {
    let image: UIImage
}

func vitaminImageDataListInit() {
    vitaminImageDataList.removeAll()
    print("vitaminImageDataList 초기화")
}
