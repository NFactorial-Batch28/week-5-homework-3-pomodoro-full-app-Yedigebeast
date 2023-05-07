//
//  SettingsViewController.swift
//  Homework 3
//
//  Created by Yedige Ashirbek on 07.05.2023.
//

import UIKit

class SettingsViewController: UIViewController {

    //MARK: - Properties
    
    
    
    //MARK: - Elements
    
    private var navigationLabel: UILabel = {
        let label = CustomNavigationLabel()
        label.configure(text: "Settings")
        return label
    }()
    
    private var focusTime: UIView = {
        let view = CustomCell()
        view.configure(text: "Focus Time", textFieldPlaceholder: "25:00")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var breakTime: UIView = {
        let view = CustomCell()
        view.configure(text: "Break Time", textFieldPlaceholder: "05:00")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.118, alpha: 1)
        
        view.addSubview(navigationLabel)
        view.addSubview(focusTime)
        view.addSubview(breakTime)
        
        NSLayoutConstraint.activate([
        
            navigationLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 12),
            navigationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            focusTime.topAnchor.constraint(equalTo: navigationLabel.bottomAnchor, constant: 34),
            focusTime.leftAnchor.constraint(equalTo: view.leftAnchor),
            focusTime.rightAnchor.constraint(equalTo: view.rightAnchor),
            focusTime.heightAnchor.constraint(equalToConstant: 44),
            
            breakTime.topAnchor.constraint(equalTo: focusTime.bottomAnchor, constant: 10),
            breakTime.leftAnchor.constraint(equalTo: view.leftAnchor),
            breakTime.rightAnchor.constraint(equalTo: view.rightAnchor),
            breakTime.heightAnchor.constraint(equalToConstant: 44),
            
        ])
            
    }

}
