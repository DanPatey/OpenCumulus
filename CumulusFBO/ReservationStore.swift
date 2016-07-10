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
        let newReservation = Reservation(tailNumber: "N53440", aircraftType: "C172S", arrivalTime: "07-06-2016 07:00am", eta: "1:58")
        
        allReservations.append(newReservation)
        
        return newReservation
    }
}