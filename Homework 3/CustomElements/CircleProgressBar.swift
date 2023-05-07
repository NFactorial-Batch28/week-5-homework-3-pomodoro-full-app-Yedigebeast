//
//  CircleProgressBar.swift
//  Homework 3
//
//  Created by Yedige Ashirbek on 07.05.2023.
//

import UIKit

class CircleProgressBar: UIView {
    
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var startPoint = CGFloat(-Double.pi / 2)
    private var endPoint = CGFloat(3 * Double.pi / 2)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createCircularPath(progress strokeEnds: Double) {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: 124, startAngle: startPoint, endAngle: endPoint, clockwise: true)
        
        circleLayer.path = circularPath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 6.0
        circleLayer.strokeEnd = 1.0
        circleLayer.strokeColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.3).cgColor
        layer.addSublayer(circleLayer)
        
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 6.0
        progressLayer.strokeEnd = strokeEnds
        progressLayer.strokeColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor
        layer.addSublayer(progressLayer)
    }
    
}
