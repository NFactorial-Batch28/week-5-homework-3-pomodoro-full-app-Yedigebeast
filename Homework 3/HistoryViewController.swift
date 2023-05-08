//
//  HistoryViewController.swift
//  Homework 3
//
//  Created by Yedige Ashirbek on 07.05.2023.
//

import UIKit
import CoreData

class HistoryViewController: UIViewController {

    //MARK: - Properties
    
    private var list = [Item]()
    private var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private let dateFormatter = DateFormatter()
    
    //MARK: - Elements
    
    private var navigationLabel: UILabel = {
        let label = CustomNavigationLabel()
        label.configure(text: "History")
        return label
    }()
    
    private var text: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fonts.semiBold, size: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
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
        
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.locale = Locale(identifier: "Asia/Almaty")
        
        text.text = "\(dateFormatter.string(from: Date()))"
        
        focusTime.configure(text: "Focus Time", text1: "")
        breakTime.configure(text: "Break Time", text1: "")
        
        view.addSubview(navigationLabel)
        view.addSubview(text)
        view.addSubview(focusTime)
        view.addSubview(breakTime)
            
        NSLayoutConstraint.activate([
        
            navigationLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 12),
            navigationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            text.topAnchor.constraint(equalTo: navigationLabel.bottomAnchor, constant: 26),
            text.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            
            focusTime.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 10),
            focusTime.leftAnchor.constraint(equalTo: view.leftAnchor),
            focusTime.rightAnchor.constraint(equalTo: view.rightAnchor),
            focusTime.heightAnchor.constraint(equalToConstant: 44),
            
            breakTime.topAnchor.constraint(equalTo: focusTime.bottomAnchor, constant: 10),
            breakTime.leftAnchor.constraint(equalTo: view.leftAnchor),
            breakTime.rightAnchor.constraint(equalTo: view.rightAnchor),
            breakTime.heightAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadItems()
        var focusCount = 0
        var breakCount = 0
        for item in list {
            if dateFormatter.string(from: item.date!) == dateFormatter.string(from: Date()) {
                focusCount += Int(item.focusTimeCount)
                breakCount += Int(item.breakTimeCount)
            }
            print(dateFormatter.string(from: item.date!), item.focusTimeCount, item.breakTimeCount)
        }
        print("-")
        focusTime.configure(text: "Focus Time", text1: focusCount.toString())
        breakTime.configure(text: "Break Time", text1: breakCount.toString())
    }
    
}

//MARK: - Core Data

extension HistoryViewController {
    func loadItems() {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        
        do {
            
            list = try context.fetch(request)
            
        } catch {
            
            print("Error loading companies \(error)")
            
        }
    }
    
    func save() {
        do {
            
            try context.save()
            
        } catch {
            
            print("Error saving context \(error)")
            
        }
    }
}
