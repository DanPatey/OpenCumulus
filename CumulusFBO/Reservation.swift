//
//  Schedule.swift
//  CumulusFBO
//
//  Created by Dan Patey on 7/9/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class Reservation: NSObject {
    var tailNumber: String
    var aircraftType: String
    var arrivalTime: String
    var eta: String
    
    init(tailNumber: String, aircraftType: String, arrivalTime: String, eta: String) {
        self.tailNumber = tailNumber
        self.aircraftType = aircraftType
        self.arrivalTime = arrivalTime
        self.eta = eta
        
        super.init()
    }
    
    convenience init(random: Bool = false) {
        if random {
            let tailNumbers = ["N53440", "N73262", "N796SP"]
            let aircraftTypes = ["172S", "Citation", "Hawker"]
            let arrivalTimes = ["07-06-2016 12:00PM", "10-12-2016 07:00AM", "04-05-2016 06:00PM"]
            let etas = ["2:00", "1:49", "1:22"]
            
            // Implement the rest of this randomizer
        }
    }
}