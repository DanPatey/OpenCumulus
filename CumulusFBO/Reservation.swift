//
//  Schedule.swift
//  CumulusFBO
//
//  Created by Dan Patey on 7/9/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class Reservation: NSObject {
    
    //MARK: Model variables
    var tailNumber: String
    var aircraftType: String
    var arrivalTime: String
    var eta: String
    
    //MARK: Initalize model
    init(tailNumber: String, aircraftType: String, arrivalTime: String, eta: String) {
        self.tailNumber = tailNumber
        self.aircraftType = aircraftType
        self.arrivalTime = arrivalTime
        self.eta = eta
        
        super.init()
    }
}