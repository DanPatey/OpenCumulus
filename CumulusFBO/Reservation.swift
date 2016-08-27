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
    init(tailNumber: String, aircraftType: String, arrivalTime: String) {
        self.tailNumber = tailNumber
        self.aircraftType = aircraftType
        self.arrivalTime = arrivalTime
        self.eta = ""
        super.init()
        
        updateETA()
    }
    
    func getEta() -> String {
        return self.eta
    }
    
    // Calls the timer for pilots
    func startTimerLabel(reservation: Reservation) {
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(Reservation.updateETA), userInfo: nil, repeats: true)
    }
    
    //MARK: Countdown to ETA
    func updateETA() {
        // Setup the format for our countdown
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM dd yyyy HH:mmZZ"
        
        // Grab our reservation and convert to NSDate for comparison to current time
        // CHANGE THIS FOR EACH CELL
        let fullReservation = self.arrivalTime
        let fullReservationNSDate = dateFormatter.dateFromString(fullReservation)
        
        // Compare the current time to our arrival date
        let etaNSDate = NSDate().timeIntervalSinceDate(fullReservationNSDate!)
        
        // Format the output of our ETA
        let formatter = NSDateComponentsFormatter()
        formatter.unitsStyle = .Abbreviated
        
        // Convert back to string and drop into the custom cell for ETA
        let etaString = formatter.stringFromTimeInterval(etaNSDate)
//        let etaArr = etaString?.componentsSeparatedByString("") //Problem: Keeps the first Element
        self.eta = etaString!
    }
}