//
//  CustomCell.swift
//  Homework 3
//
//  Created by Yedige Ashirbek on 07.05.2023.
//

import UIKit

class CustomCell: UIView {
    
    //MARK: - Elements
    
    private var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fonts.regular, size: 17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var textField: UITextField = {
        let textField = UITextField()
        textField.textColor = .white
        textField.font = UIFont(name: Constants.fonts.regular, size: 17)
        textField.attributedPlaceholder = NSAttributedString(
            string: "Hello",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.922, green: 0.922, blue: 0.961, alpha: 0.6)]
        )
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private var separator: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "separator")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String, textFieldPlaceholder: String) {
        addSubview(label)
        addSubview(textField)
        addSubview(separator)
        
        label.text = text
        textField.placeholder = textFieldPlaceholder
        
        NSLayoutConstraint.activate([
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            textField.centerYAnchor.constraint(equalTo: centerYAnchor),
            textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            separator.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.leftAnchor.constraint(equalTo: leftAnchor, constant: 16)
            
        ])
        
    }
}
