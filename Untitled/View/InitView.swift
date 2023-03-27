//
//  InitView.swift
//  Untitled
//
//  Created by Jaehyeok Lim on 2023/03/28.
//

import UIKit

class initView: UIView {
    
    func mainTextLabel() -> UIView {
        let label = UILabel()
        
        label.text = "더 편리하고\n가볍게"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 40)
        label.numberOfLines = 0
        
        return label
    }
    
    func subTextLabel() -> UIView {
        let label = UILabel()
        
        label.text = "저희가 삶의 원동력이 되어드릴게요."
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        
        return label
    }
    
    func initViewRingShapeLayer() -> CAShapeLayer {
        let radius: CGFloat = 50
        let lineWidth: CGFloat = 10

        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: radius * 4, height: radius * 4))

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = lineWidth
        shapeLayer.strokeColor = UIColor.customColor.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor

        return shapeLayer
    }
}
