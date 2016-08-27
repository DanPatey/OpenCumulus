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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //MARK: Set label attributes
        let bodyFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        tailNumberLabel.font = bodyFont
        aircraftTypeLabel.font = bodyFont
        
        let caption1Font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        arrivalTimeLabel.font = caption1Font
        etaLabel.font = caption1Font
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
            
//    func updateCountdown() {
//        print(timer)
//    }
}