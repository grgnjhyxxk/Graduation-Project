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
        label.font = UIFont.systemFont(ofSize: 20)
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
        
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.tintColor = UIColor.white
        
        return button
    }
    
    func nextButton() -> UIButton {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "greaterthan"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.tintColor = UIColor.white
        
        return button
    }
}
