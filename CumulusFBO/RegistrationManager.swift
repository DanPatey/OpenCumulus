//
//  ReservationsManager.swift
//  CumlusFBO
//
//  Created by Dan Patey on 4/17/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import Foundation

class RegistrationsManager {
    // Collect data through the registration process and put in an arry
    static let sharedManager = RegistrationsManager()
    let activeReservation = RegistrationsModel()
    
    // Store that array here and use it in the schedule
    var schedule = [Schedule]()
}