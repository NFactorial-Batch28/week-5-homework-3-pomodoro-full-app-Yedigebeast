//
//  TimeModel.swift
//  Homework 3
//
//  Created by Yedige Ashirbek on 08.05.2023.
//

import Foundation

enum timeType {
    case breakTime
    case focusTime
    case none
}

enum timeState {
    case stopped
    case paused
    case ongoing
}

protocol TimeModelDelegate {
    func left(portion: Double, seconds: Int)
    func timerEnds()
}
 
class TimeModel {
    
    var currentTimeType: timeType {
        get {
            if UserDefaults.standard.bool(forKey: "currentTimeType") == false {
                return .focusTime
            } else {
                return .breakTime
            }
        }
        set {
            if newValue == .focusTime {
                UserDefaults.standard.set(false, forKey: "currentTimeType")
            } else {
                UserDefaults.standard.set(true, forKey: "currentTimeType")
            }
        }
    }
    
    var breakTimeCount: Int {
        get {
            if UserDefaults.standard.integer(forKey: "breakTimeCount") == 0 {
                return 300
            } else {
                return UserDefaults.standard.integer(forKey: "breakTimeCount")
            }
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "breakTimeCount")
        }
    }
    var focusTimeCount: Int {
        get {
            if UserDefaults.standard.integer(forKey: "focusTimeCount") == 0 {
                return 1500
            } else {
                return UserDefaults.standard.integer(forKey: "focusTimeCount")
            }
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "focusTimeCount")
        }
    }
    
    var delegate: TimeModelDelegate?
    var secondsPassed = 0
    var timerState = timeState.stopped
    var timer: Timer?
    
    func startTheTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.secondsPassed += 1
            self.checkForEnding(timer: timer)
        }
    }
    
    private func checkForEnding(timer: Timer) {
        if (self.currentTimeType == .focusTime) {
            delegate?.left(portion: calculatePortion(for: focusTimeCount), seconds: focusTimeCount - secondsPassed)
            if self.secondsPassed == self.focusTimeCount {
                timerState = .stopped
                timer.invalidate()
                secondsPassed = 0
                currentTimeType = .breakTime
                delegate?.timerEnds()
            }
        }
        else if (self.currentTimeType == .breakTime) {
            delegate?.left(portion: calculatePortion(for: breakTimeCount), seconds: breakTimeCount - secondsPassed)
            if self.secondsPassed == self.breakTimeCount {
                timerState = .stopped
                timer.invalidate()
                secondsPassed = 0
                currentTimeType = .focusTime
                delegate?.timerEnds()
            }
        }
    }
    
    private func calculatePortion(for allTime: Int) -> Double {
        let q = Double(secondsPassed)
        let q1 = Double(allTime)
        return (q / q1)
    }
    
    func stopTheTimer() {
        timer?.invalidate()
        secondsPassed = 0
    }
    
    func pauseTheTimer() {
        timer?.invalidate()
    }
    
}
