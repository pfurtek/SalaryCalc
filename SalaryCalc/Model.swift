//
//  Model.swift
//  SalaryCalc
//
//  Created by Pawel Furtek on 5/23/16.
//  Copyright © 2016 Pawel Furtek. All rights reserved.
//

import Foundation

class ModelManager {
    var model : Model
    
    static let sharedManager : ModelManager = ModelManager()
    
    init() {
        model = Model()
    }
}

class Model {
    var time : NSDate
    var salary : Double
    var currency : String
    
    init() {
        time = NSDate()
        salary = 0
        currency = ""
    }
    
    func earnedToday(currentTime : NSDate) -> Double {
        let interval : NSTimeInterval = currentTime.timeIntervalSinceDate(time)
        return interval/3600 * salary
    }
}