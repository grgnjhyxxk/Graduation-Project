//
//  AlarmFunction.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/30.
//

import UIKit

// seq box intake vseq
func scheduleVitaminAlarm(label: String) {
    DispatchQueue.global().async {
        // UNUserNotificationCenter 싱글턴 인스턴스를 가져옴
        let center = UNUserNotificationCenter.current()
        
        // 사용자에게 알림 권한을 요청
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            // 알림 권한을 부여받았는지 확인
            guard granted else { return }
            
            if let index = alarmViewCellDataList.firstIndex(where: { $0.label == label }) {
                print("인덱스는 \(index) 입니다.")
                // 알림 콘텐츠 생성
                let time = alarmViewCellDataList[index].date
                let alarmName = alarmViewCellDataList[index].label
                let box = alarmViewCellDataList[index].box // 12
                
                print("\(alarmName) \(box)")
                
                // 문자열 나누기
                var boxList: [String] = []

                let components = box.components(separatedBy: " ")
                boxList = components

                print(boxList)
                
                // vseq 찾기
                var vseqList = [Int]()
                
                for i in boxList {
                    vseqList.append(boxAndVitaminDataList[Int(i)!-1].vseq)
                }
                
                // vitaminName 찾기
                var vitaminList = [String]()
                
                for i in 0..<userVitaminDataList.count {
                    for j in 0..<vseqList.count {
                        if userVitaminDataList[i].vseq == vseqList[j] {
                            vitaminList.append(userVitaminDataList[i].prod_name)
                        }
                    }
                }
                
                var vitaminNames = String()
                
                for i in vitaminList {
                    vitaminNames += i
                    vitaminNames += " "
                }
                
                print("\(String(describing: alarmName)), \(vitaminNames)")
                
                let content = UNMutableNotificationContent()
                content.title = "\(alarmName)"
                content.body = "\(vitaminNames)를 복용할 시간입니다."
                content.sound = UNNotificationSound.default
                
                // 시간 문자열을 DateComponents로 변환
                let formatter = DateFormatter()
                formatter.dateFormat = "HH:mm"
                guard let date = formatter.date(from: time) else {
                    print("올바른 시간 형식이 아닙니다.")
                    return
                }
                
                let components_new = Calendar.current.dateComponents([.hour, .minute], from: date)
                
    //             알림 트리거 생성
                let trigger = UNCalendarNotificationTrigger(dateMatching: components_new, repeats: true)

                // 알림 요청 생성
                let request = UNNotificationRequest(identifier: "\(box)", content: content, trigger: trigger)
                
    //             알림을 스케줄에 추가
                center.add(request) { (error) in
                    if let error = error {
                        print("알림을 스케줄에 추가하는 도중 에러 발생: \(error)")
                    } else {
                        print("알림이 스케줄에 추가되었습니다.")
                    }
                }
            } else {
                print("값이 'test'인 요소를 찾을 수 없습니다.")
            }
        }
    }
}

func cancelVitaminAlarm(index: Int) {
    let center = UNUserNotificationCenter.current()
    
    center.removePendingNotificationRequests(withIdentifiers: [userAlarmDataList[index].box])
}

func editVitaminAlarm(label: String) {
    // UNUserNotificationCenter 싱글턴 인스턴스를 가져옴
    let center = UNUserNotificationCenter.current()
    
    // 기존 알람을 취소
    center.removePendingNotificationRequests(withIdentifiers: ["\(label)"])
    
    // 새로운 알람을 등록
    editVitaminAlarmWithEditData(label: label) // 기존의 알람 등록 함수를 호출하거나 새로운 알람 정보를 전달하여 호출
}

func getAllScheduledNotifications() {
    UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
        for request in requests {
            print("Identifier:",request.identifier)
            print("Content Title:",request.content.title)
            print("Content Body:",request.content.body)
        }
    }
}

func editVitaminAlarmWithEditData(label: String) {
    DispatchQueue.global().async {
        // UNUserNotificationCenter 싱글턴 인스턴스를 가져옴
        let center = UNUserNotificationCenter.current()
        
        // 사용자에게 알림 권한을 요청
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            // 알림 권한을 부여받았는지 확인
            guard granted else { return }
            
            if let index = alarmEditDataList.firstIndex(where: { $0.label == label }) {
                print("인덱스는 \(index) 입니다.")
                // 알림 콘텐츠 생성
                let time = alarmEditDataList[index].date
                let alarmName = alarmEditDataList[index].label
                let box = alarmEditDataList[index].box // 12
                
                print("\(alarmName) \(box)")
                
                // 문자열 나누기
                var boxList: [String] = []

                let components = box.components(separatedBy: " ")
                boxList = components

                print(boxList)
                
                // vseq 찾기
                var vseqList = [Int]()
                
                for i in boxList {
                    vseqList.append(boxAndVitaminDataList[Int(i)!-1].vseq)
                }
                
                // vitaminName 찾기
                var vitaminList = [String]()
                
                for i in 0..<userVitaminDataList.count {
                    for j in 0..<vseqList.count {
                        if userVitaminDataList[i].vseq == vseqList[j] {
                            vitaminList.append(userVitaminDataList[i].prod_name)
                        }
                    }
                }
                
                var vitaminNames = String()
                
                for i in vitaminList {
                    vitaminNames += i
                    vitaminNames += " "
                }
                
                print("\(String(describing: alarmName)), \(vitaminNames)")
                
                let content = UNMutableNotificationContent()
                content.title = "\(alarmName)"
                content.body = "\(vitaminNames)를 복용할 시간입니다."
                content.sound = UNNotificationSound.default
                
                // 시간 문자열을 DateComponents로 변환
                let formatter = DateFormatter()
                formatter.dateFormat = "HH:mm"
                guard let date = formatter.date(from: time) else {
                    print("올바른 시간 형식이 아닙니다.")
                    return
                }
                
                let components_new = Calendar.current.dateComponents([.hour, .minute], from: date)
                
                // 알림 트리거 생성
                let trigger = UNCalendarNotificationTrigger(dateMatching: components_new, repeats: true)

                // 알림 요청 생성
                let request = UNNotificationRequest(identifier: "\(box)", content: content, trigger: trigger)
                
                // 알림을 스케줄에 추가
                center.add(request) { (error) in
                    if let error = error {
                        print("알림을 스케줄에 추가하는 도중 에러 발생: \(error)")
                    } else {
                        print("알림이 스케줄에 추가되었습니다.")
                    }
                }
            } else {
                print("값이 'test'인 요소를 찾을 수 없습니다.")
            }
        }
    }
}
