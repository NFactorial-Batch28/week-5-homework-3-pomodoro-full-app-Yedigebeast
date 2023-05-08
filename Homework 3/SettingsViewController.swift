//
//  SettingsViewController.swift
//  Homework 3
//
//  Created by Yedige Ashirbek on 07.05.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    //MARK: - Properties
    
    private var timeModel = TimeModel()

    //MARK: - Elements
    
    private var navigationLabel: UILabel = {
        let label = CustomNavigationLabel()
        label.configure(text: "Settings")
        return label
    }()
    
    private var focusTime: CustomCell = {
        let view = CustomCell()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var breakTime: CustomCell = {
        let view = CustomCell()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.11, green: 0.11, blue: 0.118, alpha: 1)
        
        focusTime.configure(text: "Focus Time", textFieldText: timeModel.focusTimeCount.toString())
        breakTime.configure(text: "Break Time", textFieldText: timeModel.breakTimeCount.toString())
        focusTime.delegate = self
        breakTime.delegate = self
        focusTime.type = .focusTime
        breakTime.type = .breakTime
        
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

//MARK: - Custom Cell Delegate Methods

extension SettingsViewController: CustomCellDelegate {
    func textInFieldChanged(type: timeType, text: String) {
        if text.toInt() == 0 {
            return
        }
        if type == .focusTime {
            timeModel.focusTimeCount = text.toInt()
        } else if type == .breakTime {
            timeModel.breakTimeCount = text.toInt()
        }
    }
}


//MARK: - Number to String and vice versa

extension Int {
    func toString() -> String {
        let hour = addZero(s: "\(self / 60)")
        let minute = addZero(s: "\(self % 60)")
        return "\(hour):\(minute)"
    }
    
    private func addZero(s: String) -> String {
        if s.count == 1 {
            return "0\(s)"
        } else {
            return s
        }
    }
}

extension String {
    func toInt() -> Int {
        if let hour = Int(self.prefix(2)), let minute = Int(self.suffix(2)) {
            return (hour * 60 + minute)
        }
        return 0
    }
}
