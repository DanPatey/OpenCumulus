//
//  ScheduleStore.swift
//  CumulusFBO
//
//  Created by Dan Patey on 7/9/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class ReservationStore {

    //MARK: Store our schedules
    var allReservations = [Reservation]()

    let session: NSURLSession = {
        let config = NSURLSessionConfiguration.defaultSessionConfiguration()
        return NSURLSession(configuration: config)
    }()
    
    func createReservation(tailNumber: String, aircraftType: String, arrivalTime: String, eta: String) -> Reservation {
        let newReservation = Reservation(tailNumber: tailNumber, aircraftType: aircraftType, arrivalTime: arrivalTime, eta: eta)
        allReservations.append(newReservation)
        return newReservation
    }

    func removeReservation(reservation: Reservation) {
        if let index = allReservations.indexOf(reservation) {
            allReservations.removeAtIndex(index)
        }
    }
    
    //MARK: API Call to FlightAware
    func retrieveInFlightInfo() {
        var keys: NSDictionary?

        if let path = NSBundle.mainBundle().pathForResource("Keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        }
        
        if let dict = keys {
            let flightawareUser = dict["flightawareUser"] as? String
            let flightawareKey = dict["flightawareApiKey"] as? String
            let urlPath = "https://" + flightawareUser! + ":" + flightawareKey! + "@flightxml.flightaware.com/json/FlightXML2/InFlightInfo?ident=AAL1726"
            let endpoint = NSURL(string: urlPath)
            let request = NSMutableURLRequest(URL: endpoint!)
            let session = NSURLSession.sharedSession()

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
}