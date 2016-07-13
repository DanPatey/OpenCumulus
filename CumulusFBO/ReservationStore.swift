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
        
    func createReservation(tailNumber: String, aircraftType: String, arrivalTime: String) -> Reservation {
        let newReservation = Reservation(tailNumber: tailNumber, aircraftType: aircraftType, arrivalTime: arrivalTime)
        
        allReservations.append(newReservation)
        
        return newReservation
    }
    
    func removeReservation(reservation: Reservation) {
        if let index = allReservations.indexOf(reservation) {
            allReservations.removeAtIndex(index)
        }
    }
}