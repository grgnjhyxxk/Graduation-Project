//
//  MQTT.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/06/01.
//

//import UIKit
//import CocoaMQTT
//
//func MQTTClient(boxList: Array<String>, vseqList: Array<Int>, IntakePerDayList: Array<Int>) {
//    // MQTT 클라이언트 설정
//    let seq = userDataList[0].seq
//    let name = userDataList[0].name
//    let birth = userDataList[0].birth
//
//    var message = "\(seq) "
//    
//    for i in 0..<boxList.count {
//        message += "\(boxList[i])\(vseqList[i])\(IntakePerDayList[i])"
//        if i != boxList.count-1 {
//            message += " "
//        }
//    }
//    
////    let clientID = "CocoaMQTT-" + String(ProcessInfo().processIdentifier)
//    let mqtt5 = CocoaMQTT5(clientID: "\(seq)_\(name)_\(birth)", host: "180.83.19.43", port: 18830)
//
//    let connectProperties = MqttConnectProperties()
//    connectProperties.topicAliasMaximum = 1
//    connectProperties.sessionExpiryInterval = 0
//    connectProperties.receiveMaximum = 100
//    connectProperties.maximumPacketSize = 500
//    mqtt5.connectProperties = connectProperties
//    mqtt5.keepAlive = 60
//    
//    let publishProperties = MqttPublishProperties()
//    publishProperties.contentType = "JSON"
//    
////    if mqtt5.connect() {
////        print("connected")
////    }
////
////    DispatchQueue.main.async {
////        mqtt5.connect()
////        print("message: \(message)")
////
////        mqtt5.publish("todevice", withString: "\(message)", qos: .qos1, DUP: false, retained: false, properties: publishProperties);
////    }
//    
//    if mqtt5.connState == .connected || mqtt5.connState == .connecting {
//        mqtt5.disconnect()
//    }
//
//    if mqtt5.connect() {
//        print("Connecting...")
//    } else {
//        print("Connection failed")
//        print("Connection state: \(mqtt5.connState)")
//    }
//    
//    print("message: \(message)")
//    
//    DispatchQueue.main.async {
//        mqtt5.publish("todevice", withString: "\(message)", DUP: false, retained: false, properties: publishProperties);
//        mqtt5.subscribe("fromdevice")
//    }
//}

