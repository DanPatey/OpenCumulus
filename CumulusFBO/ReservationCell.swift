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
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM dd yyyy HH:mmZZ"
        
        let fullReservation = RegistrationsManager.sharedManager.activeReservation.arrivalTime
        print("Reservation Time")
        print(fullReservation! + "\n")
        
        print("ETA IS")
        let fullReservationString = dateFormatter.dateFromString(fullReservation!)
        print (fullReservationString)
        
        let eta = NSDate().timeIntervalSinceDate(fullReservationString!)
        let formatter = NSDateComponentsFormatter()
        formatter.unitsStyle = .Abbreviated
        formatter.stringFromTimeInterval(eta)
        print(eta)
    }
}