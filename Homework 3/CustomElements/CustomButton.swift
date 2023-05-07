//
//  CustomButton.swift
//  Homework 3
//
//  Created by Yedige Ashirbek on 07.05.2023.
//

import UIKit

class customButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure(image: String) {
        setImage(UIImage(systemName: image), for: .normal)
        tintColor = .white
        layer.cornerRadius = 28
        backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
