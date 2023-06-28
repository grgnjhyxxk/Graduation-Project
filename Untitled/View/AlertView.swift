//
//  AlertView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/15.
//

import UIKit

var boxNumHandlerList = [String]()
var vseqHandlerList = [Int]()
var intakePerdayHandlerList = [Int]()

func networkErrorHandlingAlert() {
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        if let topWindow = windowScene.windows.last {
            let alert = UIAlertController(title: "네트워크 에러", message: "현재 서버와의 연결이 불안정합니다.\n잠시 후에 시도해 주시기 바랍니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default)
            alert.addAction(okAction)
            topWindow.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
}

func alarmAlert() {
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
        if let topWindow = windowScene.windows.last {
            
            // 문자열 분할
            var boxNumString = String()
            
            for i in boxNumHandlerList {
                boxNumString += i
                boxNumString += " "
            }
            
            // 알림창 생성
            let alert = UIAlertController(title: "섭취 확인", message: "지금 \(boxNumString)번 보관함을 동작시키겠습니까?", preferredStyle: .alert)
            
            // 알림창 액션 추가
            let laterAction = UIAlertAction(title: "나중에", style: .cancel) { (_) in
                // "나중에" 버튼을 클릭한 경우의 처리 로직을 추가하세요.
                print("나중에 버튼 클릭")
            }
            let okAction = UIAlertAction(title: "지금", style: .default) { (_) in
                // "지금" 버튼을 클릭한 경우의 처리 로직을 추가하세요.
                var boxNumHandlerListToInt = [Int]()
                
                for i in boxNumHandlerList {
                    boxNumHandlerListToInt.append(Int(i)!)
                }
                
                alarmSettingPost(boxList: boxNumHandlerListToInt, vseqList: vseqHandlerList, intakePerDayList: intakePerdayHandlerList) { success in
                    if success {
                        let seq = userDataList[0].seq
                        userVitaminDataList.removeAll()
                        getVitaminInformation(seq: seq) { success in
                            if success {
                                
                                for i in 0..<userVitaminDataList.count {
                                    userVitaminDataList[i].taken = 1
                                }
                                
                                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "SSS"), object: nil)
                            } else {
                                
                            }
                        }
                    } else {
                        
                    }
                }
            }
            
            alert.addAction(laterAction)
            alert.addAction(okAction)
            topWindow.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
}
