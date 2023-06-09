//
//  AlarmFunction.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/30.
//

import UIKit

// seq box intake vseq
func scheduleVitaminAlarm() {
    DispatchQueue.global().async {
        // UNUserNotificationCenter 싱글턴 인스턴스를 가져옴
        let center = UNUserNotificationCenter.current()
        
        // 사용자에게 알림 권한을 요청
        center.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            // 알림 권한을 부여받았는지 확인
            guard granted else { return }
            
            // 알림 콘텐츠 생성
            let time = userAlarmDataList.first?.date
            let alarmName = userAlarmDataList.first?.label
            let box = userAlarmDataList.first?.box // 12
            
            print("\(alarmName!) \(box!)")
            
            // 문자열 나누기
            var boxList: [String] = []

            if let box = box {
                let components = box.components(separatedBy: " ")
                boxList = components
            }

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
            content.title = "\(alarmName!)"
            content.body = "\(vitaminNames)를 복용할 시간입니다."
            content.sound = UNNotificationSound.default
            
            // 시간 문자열을 DateComponents로 변환
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            guard let date = formatter.date(from: time!) else {
                print("올바른 시간 형식이 아닙니다.")
                return
            }
            let components = Calendar.current.dateComponents([.hour, .minute], from: date)
            
//             알림 트리거 생성
            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)

            // 알림 요청 생성
            let request = UNNotificationRequest(identifier: "\(box!)", content: content, trigger: trigger)
            
//             알림을 스케줄에 추가
            center.add(request) { (error) in
                if let error = error {
                    print("알림을 스케줄에 추가하는 도중 에러 발생: \(error)")
                } else {
                    print("알림이 스케줄에 추가되었습니다.")
                }
            }
        }
    }
}
