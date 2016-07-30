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
    
    var count = 10
    
    //MARK set label attributes
    func updateLabels() {
        let bodyFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        tailNumberLabel.font = bodyFont
        aircraftTypeLabel.font = bodyFont
        
        let caption1Font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        arrivalTimeLabel.font = caption1Font
        
        _ = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: #selector(ReservationCell.updateCountdown), userInfo: nil, repeats: true)
    }
    
    func updateCountdown() {
        if(count > 0) {
            etaLabel.text = String(count--)
        }
    }
}