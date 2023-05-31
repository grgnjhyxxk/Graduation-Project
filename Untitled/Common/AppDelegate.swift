//
//  AppDelegate.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let center = UNUserNotificationCenter.current()
        center.delegate = self // push처리에 대한 delegate - UNUserNotificationCenterDelegate
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        center.requestAuthorization(options: options) { (granted, error) in

            guard granted else {
                return
            }

            DispatchQueue.main.async {
                // 2. APNs에 디바이스 토큰 등록
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
//    private func registerForRemoteNotifications() {
//        // 1. 푸시 center (유저에게 권한 요청 용도)
//        let center = UNUserNotificationCenter.current()
//        center.delegate = self // push처리에 대한 delegate - UNUserNotificationCenterDelegate
//        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
//        center.requestAuthorization(options: options) { (granted, error) in
//
//            guard granted else {
//                return
//            }
//
//            DispatchQueue.main.async {
//                // 2. APNs에 디바이스 토큰 등록
//                UIApplication.shared.registerForRemoteNotifications()
//            }
//        }
//    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentCloudKitContainer(name: "Untitled")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}


extension AppDelegate: UNUserNotificationCenterDelegate {

    // 3. 앱이 foreground상태 일 때, 알림이 온 경우 어떻게 표현할 것인지 처리
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {

        // 푸시가 오면 alert, badge, sound표시를 하라는 의미
        completionHandler([.alert, .badge, .banner])
    }

    // push를 탭한 경우 처리
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("알람클릭")
        boxOperatingNumber = response.notification.request.identifier

        for i in 0..<userAlarmDataList.count {
            if Int(boxOperatingNumber) == userAlarmDataList[i].numOfBox {
                let vitamins = userAlarmDataList[i].vitamins
                for i in 0..<userVitaminDataList.count {
                    if vitamins == userVitaminDataList[i].prod_name {
                        print(userVitaminDataList[i].intake_per_day)
                        intakePerDayNumber = userVitaminDataList[i].intake_per_day
                        productnameString = userVitaminDataList[i].prod_name
                        break
                    }
                }
            }
        }
        alarmAlert()
    }
}
