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
    
    @IBOutlet weak var summary: UITextView! {
        didSet {
//            self.summary.text = RegistrationsManager.sharedManager.activeReservation.generateSummary()
            //Add text for each cell
        }
    }
    @IBAction func editButton(sender: UIBarButtonItem) {
        self.summary.editable = true
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
    }
    
    func addItemsToSummary(textFields: [UITextField]) {
        for textfield in textFields {
            print(textfield)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let tailNumber = RegistrationsManager.sharedManager.activeReservation.tailNumber
        let aircraftType = RegistrationsManager.sharedManager.activeReservation.aircraftType
        let arrivalTime = RegistrationsManager.sharedManager.activeReservation.arrivalTime
        
        reservationStore.createReservation(tailNumber!, aircraftType: aircraftType!, arrivalTime: arrivalTime!)
    }
}
