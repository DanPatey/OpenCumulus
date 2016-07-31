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
        
    //MARK: Set label attributes
    func updateLabels() {
        let bodyFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        tailNumberLabel.font = bodyFont
        aircraftTypeLabel.font = bodyFont
        
        let caption1Font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        arrivalTimeLabel.font = caption1Font
        
        _ = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(ReservationCell.updateCountdown), userInfo: nil, repeats: true)
    }
    
    //MARK: Countdown to ETA
    func updateCountdown() {
        // Setup the format for our countdown
        let dateFormatter: NSDateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM dd yyyy HH:mmZZ"
        
        // Grab our reservation and convert to NSDate for comparison to current time
        // CHANGE THIS FOR EACH CELL
        let fullReservation = RegistrationsManager.sharedManager.activeReservation.arrivalTime
        let fullReservationNSDate = dateFormatter.dateFromString(fullReservation!)
        
        // Compare the current time to our arrival date
        let etaNSDate = NSDate().timeIntervalSinceDate(fullReservationNSDate!)
        
        // Format the output of our ETA
        let formatter = NSDateComponentsFormatter()
        formatter.unitsStyle = .Abbreviated
        
        // Convert back to string and drop into the custom cell for ETA
        let etaString = formatter.stringFromTimeInterval(etaNSDate)
        let etaArr = etaString?.componentsSeparatedByString("-")
        etaLabel.text = etaArr?[1]
    }
}