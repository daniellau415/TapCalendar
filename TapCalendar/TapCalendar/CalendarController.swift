//
//  CalendarController.swift
//  TapCalendar
//
//  Created by Daniel Lau on 11/11/18.
//  Copyright © 2018 Daniel. All rights reserved.
//

import Foundation
import CoreData

class CalendarController {
    
    static let shared = CalendarController()
    
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    var days = [Day]()
    var numberOfDays : Int?
    
    func daysPerMonth(index: Int) {
        if index == 0 || index == 2 || index == 4 || index == 6 || index == 7 || index == 9 || index == 11 {
            numberOfDays = 31
        }
        
        if index == 1 {
            numberOfDays = 28
        }
        
        if index == 3 || index == 5 || index == 8 || index == 10 {
            numberOfDays = 30
        }
    }
    
    func addDays(day: Day) {
        guard let dayNum = numberOfDays else { return }
        days.removeAll()
        for _ in 1...dayNum {
            days.append(day)
        }
        print(days.count)
    }
    
    func toggleOnOff(day: Day) {
        if day.isCompleted == false {
            day.isCompleted = true
            print("Set to true")
        } else {
            day.isCompleted = false
            print("Set to false")
        }
    }
    
}
