//
//  ViewController.swift
//  Homework 3
//
//  Created by Yedige Ashirbek on 07.05.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    //MARK: - Properties
    
    
    
    //MARK: - Elements
    
    private var bgImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bg")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var focusCategoryButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont(name: Constants.fonts.regular, size: 16)
        button.setTitle("Focus Category", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fonts.bold, size: 44)
        label.text = "25:00"
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var currentTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fonts.regular, size: 16)
        label.text = "Focus on your task"
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var circleProgressBarView: CircleProgressBar = {
        let progressBar = CircleProgressBar(frame: .zero)
        progressBar.createCircularPath(progress: 0.0)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()
    
    private var buttonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 80
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private var playButton: UIButton = {
        let button = customButton(type: .system)
        button.configure(image: "play.fill")
        return button
    }()
    
    private var stopButton: UIButton = {
        let button = customButton(type: .system)
        button.configure(image: "stop.fill")
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        buttonStack.addArrangedSubview(playButton)
        buttonStack.addArrangedSubview(stopButton)
        
        view.addSubview(bgImage)
        view.addSubview(focusCategoryButton)
        view.addSubview(circleProgressBarView)
        view.addSubview(timeLabel)
        view.addSubview(currentTypeLabel)
        view.addSubview(buttonStack)
                
        NSLayoutConstraint.activate([
            
            bgImage.topAnchor.constraint(equalTo: view.topAnchor),
            bgImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bgImage.leftAnchor.constraint(equalTo: view.leftAnchor),
            bgImage.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            focusCategoryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            focusCategoryButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 92),
            focusCategoryButton.heightAnchor.constraint(equalToConstant: 36),
            focusCategoryButton.widthAnchor.constraint(equalToConstant: 170),
            
            circleProgressBarView.topAnchor.constraint(equalTo: focusCategoryButton.bottomAnchor, constant: 180),
            circleProgressBarView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            timeLabel.topAnchor.constraint(equalTo: focusCategoryButton.bottomAnchor, constant: 134),
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            currentTypeLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 4),
            currentTypeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonStack.topAnchor.constraint(equalTo: focusCategoryButton.bottomAnchor, constant: 360),
            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            playButton.heightAnchor.constraint(equalToConstant: 56),
            playButton.widthAnchor.constraint(equalToConstant: 56),

            stopButton.heightAnchor.constraint(equalToConstant: 56),
            stopButton.widthAnchor.constraint(equalToConstant: 56),
            
        ])
        
        focusCategoryButton.addTarget(self, action: #selector(focusCategoryButtonPressed), for: .touchUpInside)
        playButton.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector(stopButtonPressed), for: .touchUpInside)
        
    }
    
}

//MARK: - Buttons Pressed

extension MainViewController {
    
    @objc private func focusCategoryButtonPressed() {
        print("Button pressed, Focus Category should be changed")
    }
    
    @objc private func playButtonPressed() {
        print("Button pressed, start the timer")
    }
    
    @objc private func stopButtonPressed() {
        print("Button pressed, stop the timer")
    }
    
}

