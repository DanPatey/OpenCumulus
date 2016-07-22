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

    let session: NSURLSession = {
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        return NSURLSession(configuration: config)
    }()

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
    
    func retrieveInFlightInfo() {
        let url = FlightAwareAPI.inFlightInfoURL()
        let request = NSURLRequest(URL: url)
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            if let jsonData = data {
                if let jsonString = NSString(data: jsonData, encoding: NSUTF8StringEncoding) {
                    print(jsonString)
                }
            }
            else if let requestError = error {
                print("Error fetching recent photos: \(requestError)")
            } else {
                print("Unexpected error with the request")
            }
        }
        task.resume()
    }
}