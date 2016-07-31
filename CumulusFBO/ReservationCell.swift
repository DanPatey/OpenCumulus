//
//  ReservationItem.swift
//  CumulusFBO
//
//  Created by Dan Patey on 7/12/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class ReservationCell: UITableViewCell {
    
    @IBOutlet var tailNumberLabel: UILabel!
    @IBOutlet var arrivalTimeLabel: UILabel!
    @IBOutlet var aircraftTypeLabel: UILabel!
    @IBOutlet var etaLabel: UILabel!
        
    //MARK set label attributes
    func updateLabels() {
        let bodyFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        tailNumberLabel.font = bodyFont
        aircraftTypeLabel.font = bodyFont
        
        let caption1Font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        arrivalTimeLabel.font = caption1Font
        
        _ = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ReservationCell.updateCountdown), userInfo: nil, repeats: true)
    }
    
    func updateCountdown() {
        let todaysDate: NSDate = NSDate()
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let currentTime: String = dateFormatter.stringFromDate(todaysDate)
        print("Current Time")
        print(currentTime)
        
        let fullReservation = RegistrationsManager.sharedManager.activeReservation.arrivalTime
        let fullReservationArr = fullReservation?.componentsSeparatedByString(" ")
        let reservationTimeArr = fullReservationArr![3].componentsSeparatedByString("-")
        let reservationTime: String = reservationTimeArr[0]
        print("Reservation Time")
        print(reservationTime)
        
        let eta = Int(reservationTime)! - Int(currentTime)!
        print("ETA IS:")
        print(eta)
    }
}