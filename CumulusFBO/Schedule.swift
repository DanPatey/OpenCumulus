//
//  Schedule.swift
//  CumulusFBO
//
//  Created by Dan Patey on 7/9/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class Schedule: NSObject {
    var tailNumber: String
    var aircraftType: String
    var arrivalTime: String
    var eta: String
    
    init(tailNumber: String, aircraftType: String, arrivalTime: String, eta: String) {
        self.tailNumber = tailNumber
        self.aircraftType = aircraftType
        self.arrivalTime = arrivalTime
        self.eta = eta
    }
}