//
//  ViewController.swift
//  CumlusFBO
//
//  Created by Dan Patey on 3/29/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Registration variables
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var email: UITextField!
    
    let registration = ReservationCell()
    
    //MARK: Dismiss keyboard on tap
    @IBAction func backgroundTapped(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    //MARK: Dismiss keyboard on pressing return
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        RegistrationsManager.sharedManager.activeReservation.firstName = firstName.text
        RegistrationsManager.sharedManager.activeReservation.lastName = lastName.text
        RegistrationsManager.sharedManager.activeReservation.company = company.text
        RegistrationsManager.sharedManager.activeReservation.phoneNumber = phoneNumber.text
        RegistrationsManager.sharedManager.activeReservation.email = email.text
    }
    
    //MARK: Set label attributes
    func updateLabels() {
        
        let bodyFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        registration.tailNumberLabel.font = bodyFont
        registration.aircraftTypeLabel.font = bodyFont
        
        let caption1Font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        registration.arrivalTimeLabel.font = caption1Font
        
        // Terminals timer
        _ = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
        registration.etaLabel.font = caption1Font
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
        registration.etaLabel.text = etaArr?[1]
    }
}