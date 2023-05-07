//
//  CustomNavigationLabel.swift
//  Homework 3
//
//  Created by Yedige Ashirbek on 07.05.2023.
//

import UIKit

class CustomNavigationLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String) {
        font = UIFont(name: Constants.fonts.semiBold, size: 17)
        self.text = text
        textColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
