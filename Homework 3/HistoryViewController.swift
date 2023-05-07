//
//  HistoryViewController.swift
//  Homework 3
//
//  Created by Yedige Ashirbek on 07.05.2023.
//

import UIKit

class HistoryViewController: UIViewController {

    //MARK: - Properties
    
    
    
    //MARK: - Elements
    
    private var navigationLabel: UILabel = {
        let label = CustomNavigationLabel()
        label.configure(text: "History")
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.118, alpha: 1)
        
        view.addSubview(navigationLabel)
        
        NSLayoutConstraint.activate([
        
            navigationLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 12),
            navigationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
        
    }
    
}
