//
//  SummaryViewController.swift
//  CumlusFBO
//
//  Created by Dan Patey on 3/29/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

let reservationStore = ReservationStore()

class SummaryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var checkMarkLabel: UILabel!
    
    @IBOutlet weak var tailNumberLabel: UILabel! {
        didSet {
         self.tailNumberLabel.text = RegistrationsManager.sharedManager.activeReservation.tailNumber
        }
    }
    @IBOutlet weak var aircraftTypeLabel: UILabel! {
        didSet {
            self.aircraftTypeLabel.text = RegistrationsManager.sharedManager.activeReservation.aircraftType
        }
    }
    @IBOutlet weak var airportCodeLabel: UILabel! {
        didSet {
            self.airportCodeLabel.text = RegistrationsManager.sharedManager.activeReservation.airportCode
        }
    }
    @IBOutlet weak var arrivalTimeLabel: UILabel! {
        didSet {
            self.arrivalTimeLabel.text =  RegistrationsManager.sharedManager.activeReservation.arrivalTime
        }
    }
    @IBOutlet weak var departureTimeLabel: UILabel! {
        didSet {
            self.departureTimeLabel.text = RegistrationsManager.sharedManager.activeReservation.departureTime
        }
    }
    
    // Checkbox button that appears and disappear
    @IBAction func onsiteCheckBox(sender: UIButton) {
        if checkMarkLabel.hidden == false {
            checkMarkLabel.hidden = true
            
        } else {
            checkMarkLabel.hidden = false
            // Don't send user to payment option
        }
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.delegate = self
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: Save information to Reservation
    @IBAction func SaveRegistration(sender: UIBarButtonItem) {
    }
    
    //MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Submit", style: .Done, target: self, action: #selector(SummaryViewController.submitButtonWithAlert))
    }
    
    //Sends Notification information to cells in ScheduleViewController
    func submitButtonWithAlert() {
        NSNotificationCenter.defaultCenter().postNotificationName("summaryInformation", object: nil)
        let tailNumber = RegistrationsManager.sharedManager.activeReservation.tailNumber
        let aircraftType = RegistrationsManager.sharedManager.activeReservation.aircraftType
        let arrivalTime = RegistrationsManager.sharedManager.activeReservation.arrivalTime
        
        reservationStore.createReservation(tailNumber!, aircraftType: aircraftType!, arrivalTime: arrivalTime!)
        
        let alert = UIAlertController(title: "Thanks for flying with Cumulus", message: "Fbo information will be sent to you shortly", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.Cancel, handler: nil))
        // Present the AlertController
        presentViewController(alert, animated: true, completion: nil)

    }
    
    func addItemsToSummary(textFields: [UITextField]) {
        for textfield in textFields {
            print(textfield)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }
}
