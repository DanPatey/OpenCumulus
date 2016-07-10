//
//  ScheduleStore.swift
//  CumulusFBO
//
//  Created by Dan Patey on 7/9/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class ReservationStore {
    // Store all our schedules
    var allReservations = [Reservation]()
    
    func createReservation() -> Reservation {
        let newReservation = Reservation()
        
        allReservations.append(newReservation)
        
        return allReservations
    }
}