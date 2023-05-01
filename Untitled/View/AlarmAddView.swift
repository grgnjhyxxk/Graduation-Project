//
//  AlarmAddView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/01.
//

import UIKit

class alarmAddView: UIView {
    
    func datePicker() -> UIDatePicker {
        let datePicker = UIDatePicker()
        
        datePicker.datePickerMode = .time
        datePicker.minimumDate = nil
        datePicker.maximumDate = nil
        datePicker.preferredDatePickerStyle = .wheels
//        datePicker.overrideUserInterfaceStyle = .dark
        
        return datePicker
    }
}
