//
//  VitaminAddViewCellDataModel.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/23.
//

import UIKit

var vitaminNameTextFieldText = String()
var perdayTextFieldText = String()

internal var data = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
internal let day_male_values = [1000.0, 25.0, 15.0, 75.0, 3.0, 3.0, 5.0, 5.0, 1000.0, 25.0, 10.0, 600.0, 50.0, 800.0, 360.0, 10.0, 1.0, 60.0, 300.0, 4.0, 30.0, 30.0]
internal let barLabels = ["비타민A", "비타민D", "비타민E", "비타민K", "비타민B1", "비타민B2", "비타민B6", "비타민B12", "비타민C", "니코틴산", "판토텐산", "엽산", "비오틴", "칼슘", "마그네슘", "철", "구리", "셀레늄", "아이오딘", "망간", "몰리브덴", "크롬"]

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

// -----------------------------------------------------------------

var userVitaminImageDataList = [VitaminImageDataModel]()

struct UserVitaminImageDataModel {
    let image: UIImage
}

// -----------------------------------------------------------------

var userVitaminDataList = [UserVitaminData]()
var userVitaminSearchDataList = [UserVitaminData]()
var aiVitaminSearchDataList = [AIVitaminData]()

struct AIVitaminData {
    var prod_name: String
    var vitamin: [Vitamin]
}

struct UserVitaminData {
    var vseq: Int
    var prod_name: String
    var intake_per_day: Int
    var taken: Int
    var image: Data
    var vitamin: [Vitamin]
}

struct Vitamin {
    let vitaminA: Int
    let vitaminD: Int
    let vitaminE: Int
    let vitaminK: Int
    let vitaminB1: Int
    let vitaminB2: Int
    let vitaminB6: Int
    let vitaminB12: Int
    let vitaminC: Int
    let nicotinic_acid: Int
    let pantothenic: Int
    let folic_acid: Int
    let biotin: Int
    let calcium: Int
    let magnesium: Int
    let iron: Int
    let copper: Int
    let selenium: Int
    let iodine: Int
    let manganese: Int
    let molybdenum: Int
    let chrome: Int
}

var vitaminNames: [[String]] = []
var vitaminValues: [[Int]] = []

var vitaminSearchNames: [[String]] = []
var vitaminSearchValues: [[Int]] = []

var aiVitaminNames: [[String]] = []
var aiVitaminValues: [[Int]] = []

func totalInit() {
    userVitaminSearchDataList.removeAll()
    vitaminSearchNames.removeAll()
    vitaminSearchValues.removeAll()
    print("userVitaminSearchDataList 초기화")
    print("vitaminSearchNames 초기화")
    print("vitaminSearchValues 초기화")
}

func noneZeroVitamin() {
    for vitaminData in userVitaminDataList {
        var userVitaminNames: [String] = []
        var userVitaminValues: [Int] = []
        
        for vitamin in vitaminData.vitamin {
            if vitamin.vitaminA > 0 {
                userVitaminNames.append("vitaminA")
                userVitaminValues.append(vitamin.vitaminA)
            }
            
            if vitamin.vitaminD > 0 {
                userVitaminNames.append("vitaminD")
                userVitaminValues.append(vitamin.vitaminD)
            }
            
            if vitamin.vitaminE > 0 {
                userVitaminNames.append("vitaminE")
                userVitaminValues.append(vitamin.vitaminE)
            }
            
            if vitamin.vitaminK > 0 {
                userVitaminNames.append("vitaminK")
                userVitaminValues.append(vitamin.vitaminK)
            }
            
            if vitamin.vitaminB1 > 0 {
                userVitaminNames.append("vitaminB1")
                userVitaminValues.append(vitamin.vitaminB1)
            }
            
            if vitamin.vitaminB2 > 0 {
                userVitaminNames.append("vitaminB2")
                userVitaminValues.append(vitamin.vitaminB2)
            }
            
            if vitamin.vitaminB6 > 0 {
                userVitaminNames.append("vitaminB6")
                userVitaminValues.append(vitamin.vitaminB6)
            }
            
            if vitamin.vitaminB12 > 0 {
                userVitaminNames.append("vitaminB12")
                userVitaminValues.append(vitamin.vitaminB12)
            }
            
            if vitamin.vitaminC > 0 {
                userVitaminNames.append("vitaminC")
                userVitaminValues.append(vitamin.vitaminC)
            }
            
            if vitamin.nicotinic_acid > 0 {
                userVitaminNames.append("nicotinic_acid")
                userVitaminValues.append(vitamin.nicotinic_acid)
            }
            
            if vitamin.pantothenic > 0 {
                userVitaminNames.append("pantothenic")
                userVitaminValues.append(vitamin.pantothenic)
            }
            
            if vitamin.folic_acid > 0 {
                userVitaminNames.append("folic_acid")
                userVitaminValues.append(vitamin.folic_acid)
            }
            
            if vitamin.biotin > 0 {
                userVitaminNames.append("biotin")
                userVitaminValues.append(vitamin.biotin)
            }
            
            if vitamin.calcium > 0 {
                userVitaminNames.append("calcium")
                userVitaminValues.append(vitamin.calcium)
            }
            
            if vitamin.magnesium > 0 {
                userVitaminNames.append("magnesium")
                userVitaminValues.append(vitamin.magnesium)
            }
            
            if vitamin.iron > 0 {
                userVitaminNames.append("iron")
                userVitaminValues.append(vitamin.iron)
            }
            
            if vitamin.copper > 0 {
                userVitaminNames.append("copper")
                userVitaminValues.append(vitamin.copper)
            }
            
            if vitamin.selenium > 0 {
                userVitaminNames.append("selenium")
                userVitaminValues.append(vitamin.selenium)
            }
            
            if vitamin.iodine > 0 {
                userVitaminNames.append("iodine")
                userVitaminValues.append(vitamin.iodine)
            }
            
            if vitamin.manganese > 0 {
                userVitaminNames.append("manganese")
                userVitaminValues.append(vitamin.manganese)
            }
            
            if vitamin.molybdenum > 0 {
                userVitaminNames.append("molybdenum")
                userVitaminValues.append(vitamin.molybdenum)
            }
            
            if vitamin.chrome > 0 {
                userVitaminNames.append("chrome")
                userVitaminValues.append(vitamin.chrome)
            }
        }
        
        vitaminNames.append(userVitaminNames)
        vitaminValues.append(userVitaminValues)
    }
    
    for i in 0..<vitaminNames.count {
        print("\(i+1)번째 영양제 정보:")
        for j in 0..<vitaminNames[i].count {
            print("\(vitaminNames[i][j]): \(vitaminValues[i][j])")
        }
        print("----------------------")
    }
}

func noneZeroVitaminSearch() {
    for vitaminData in userVitaminSearchDataList {
        var userVitaminNames: [String] = []
        var userVitaminValues: [Int] = []
        
        for vitamin in vitaminData.vitamin {
            if vitamin.vitaminA > 0 {
                userVitaminNames.append("vitaminA")
                userVitaminValues.append(vitamin.vitaminA)
            }
            
            if vitamin.vitaminD > 0 {
                userVitaminNames.append("vitaminD")
                userVitaminValues.append(vitamin.vitaminD)
            }
            
            if vitamin.vitaminE > 0 {
                userVitaminNames.append("vitaminE")
                userVitaminValues.append(vitamin.vitaminE)
            }
            
            if vitamin.vitaminK > 0 {
                userVitaminNames.append("vitaminK")
                userVitaminValues.append(vitamin.vitaminK)
            }
            
            if vitamin.vitaminB1 > 0 {
                userVitaminNames.append("vitaminB1")
                userVitaminValues.append(vitamin.vitaminB1)
            }
            
            if vitamin.vitaminB2 > 0 {
                userVitaminNames.append("vitaminB2")
                userVitaminValues.append(vitamin.vitaminB2)
            }
            
            if vitamin.vitaminB6 > 0 {
                userVitaminNames.append("vitaminB6")
                userVitaminValues.append(vitamin.vitaminB6)
            }
            
            if vitamin.vitaminB12 > 0 {
                userVitaminNames.append("vitaminB12")
                userVitaminValues.append(vitamin.vitaminB12)
            }
            
            if vitamin.vitaminC > 0 {
                userVitaminNames.append("vitaminC")
                userVitaminValues.append(vitamin.vitaminC)
            }
            
            if vitamin.nicotinic_acid > 0 {
                userVitaminNames.append("nicotinic_acid")
                userVitaminValues.append(vitamin.nicotinic_acid)
            }
            
            if vitamin.pantothenic > 0 {
                userVitaminNames.append("pantothenic")
                userVitaminValues.append(vitamin.pantothenic)
            }
            
            if vitamin.folic_acid > 0 {
                userVitaminNames.append("folic_acid")
                userVitaminValues.append(vitamin.folic_acid)
            }
            
            if vitamin.biotin > 0 {
                userVitaminNames.append("biotin")
                userVitaminValues.append(vitamin.biotin)
            }
            
            if vitamin.calcium > 0 {
                userVitaminNames.append("calcium")
                userVitaminValues.append(vitamin.calcium)
            }
            
            if vitamin.magnesium > 0 {
                userVitaminNames.append("magnesium")
                userVitaminValues.append(vitamin.magnesium)
            }
            
            if vitamin.iron > 0 {
                userVitaminNames.append("iron")
                userVitaminValues.append(vitamin.iron)
            }
            
            if vitamin.copper > 0 {
                userVitaminNames.append("copper")
                userVitaminValues.append(vitamin.copper)
            }
            
            if vitamin.selenium > 0 {
                userVitaminNames.append("selenium")
                userVitaminValues.append(vitamin.selenium)
            }
            
            if vitamin.iodine > 0 {
                userVitaminNames.append("iodine")
                userVitaminValues.append(vitamin.iodine)
            }
            
            if vitamin.manganese > 0 {
                userVitaminNames.append("manganese")
                userVitaminValues.append(vitamin.manganese)
            }
            
            if vitamin.molybdenum > 0 {
                userVitaminNames.append("molybdenum")
                userVitaminValues.append(vitamin.molybdenum)
            }
            
            if vitamin.chrome > 0 {
                userVitaminNames.append("chrome")
                userVitaminValues.append(vitamin.chrome)
            }
        }
        
        vitaminSearchNames.append(userVitaminNames)
        vitaminSearchValues.append(userVitaminValues)
    }
    
    for i in 0..<vitaminSearchNames.count {
        print("\(i+1)번째 영양제 정보:")
        for j in 0..<vitaminSearchNames[i].count {
            print("\(vitaminSearchNames[i][j]): \(vitaminSearchValues[i][j])")
        }
        print("----------------------")
    }
}

func noneZeroVitaminAi() {
    for vitaminData in aiVitaminSearchDataList {
        var userVitaminNames: [String] = []
        var userVitaminValues: [Int] = []
        
        for vitamin in vitaminData.vitamin {
            if vitamin.vitaminA > 0 {
                userVitaminNames.append("vitaminA")
                userVitaminValues.append(vitamin.vitaminA)
            }
            
            if vitamin.vitaminD > 0 {
                userVitaminNames.append("vitaminD")
                userVitaminValues.append(vitamin.vitaminD)
            }
            
            if vitamin.vitaminE > 0 {
                userVitaminNames.append("vitaminE")
                userVitaminValues.append(vitamin.vitaminE)
            }
            
            if vitamin.vitaminK > 0 {
                userVitaminNames.append("vitaminK")
                userVitaminValues.append(vitamin.vitaminK)
            }
            
            if vitamin.vitaminB1 > 0 {
                userVitaminNames.append("vitaminB1")
                userVitaminValues.append(vitamin.vitaminB1)
            }
            
            if vitamin.vitaminB2 > 0 {
                userVitaminNames.append("vitaminB2")
                userVitaminValues.append(vitamin.vitaminB2)
            }
            
            if vitamin.vitaminB6 > 0 {
                userVitaminNames.append("vitaminB6")
                userVitaminValues.append(vitamin.vitaminB6)
            }
            
            if vitamin.vitaminB12 > 0 {
                userVitaminNames.append("vitaminB12")
                userVitaminValues.append(vitamin.vitaminB12)
            }
            
            if vitamin.vitaminC > 0 {
                userVitaminNames.append("vitaminC")
                userVitaminValues.append(vitamin.vitaminC)
            }
            
            if vitamin.nicotinic_acid > 0 {
                userVitaminNames.append("nicotinic_acid")
                userVitaminValues.append(vitamin.nicotinic_acid)
            }
            
            if vitamin.pantothenic > 0 {
                userVitaminNames.append("pantothenic")
                userVitaminValues.append(vitamin.pantothenic)
            }
            
            if vitamin.folic_acid > 0 {
                userVitaminNames.append("folic_acid")
                userVitaminValues.append(vitamin.folic_acid)
            }
            
            if vitamin.biotin > 0 {
                userVitaminNames.append("biotin")
                userVitaminValues.append(vitamin.biotin)
            }
            
            if vitamin.calcium > 0 {
                userVitaminNames.append("calcium")
                userVitaminValues.append(vitamin.calcium)
            }
            
            if vitamin.magnesium > 0 {
                userVitaminNames.append("magnesium")
                userVitaminValues.append(vitamin.magnesium)
            }
            
            if vitamin.iron > 0 {
                userVitaminNames.append("iron")
                userVitaminValues.append(vitamin.iron)
            }
            
            if vitamin.copper > 0 {
                userVitaminNames.append("copper")
                userVitaminValues.append(vitamin.copper)
            }
            
            if vitamin.selenium > 0 {
                userVitaminNames.append("selenium")
                userVitaminValues.append(vitamin.selenium)
            }
            
            if vitamin.iodine > 0 {
                userVitaminNames.append("iodine")
                userVitaminValues.append(vitamin.iodine)
            }
            
            if vitamin.manganese > 0 {
                userVitaminNames.append("manganese")
                userVitaminValues.append(vitamin.manganese)
            }
            
            if vitamin.molybdenum > 0 {
                userVitaminNames.append("molybdenum")
                userVitaminValues.append(vitamin.molybdenum)
            }
            
            if vitamin.chrome > 0 {
                userVitaminNames.append("chrome")
                userVitaminValues.append(vitamin.chrome)
            }
        }
        
        aiVitaminNames.append(userVitaminNames)
        aiVitaminValues.append(userVitaminValues)
    }
    
    for i in 0..<aiVitaminNames.count {
        print("\(i+1)번째 영양제 정보:")
        for j in 0..<aiVitaminNames[i].count {
            print("\(aiVitaminNames[i][j]): \(aiVitaminValues[i][j])")
        }
        print("----------------------")
    }
}
