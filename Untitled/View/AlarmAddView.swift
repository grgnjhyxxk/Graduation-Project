//
//  AlarmAddView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/05/01.
//

import UIKit

class alarmAddView: UIView {
    
    func titleLabel() -> UILabel {
        let label = UILabel()
            
        label.text = "알람 추가"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        
        return label
    }
    
    func datePicker() -> UIDatePicker {
        let datePicker = UIDatePicker()
        
        datePicker.datePickerMode = .time
        datePicker.minimumDate = nil
        datePicker.maximumDate = nil
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.overrideUserInterfaceStyle = .dark
        datePicker.tintColor = UIColor.applicationPointColorHighlightColor
        
        return datePicker
    }
    
    func closeButton() -> UIButton {
        let button = UIButton()
        
        button.setTitle("취소", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        return button
    }
    
    func saveButton() -> UIButton {
        let button = UIButton()
        
        button.setTitle("저장", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17.5)
        
        return button
    }
}
