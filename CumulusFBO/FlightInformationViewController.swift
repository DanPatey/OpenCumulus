//
//  FlightInformationViewController.swift
//  CumulusFBO
//
//  Created by Dan Patey on 7/9/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class FlightInformationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tailNumber: UITextField!
    @IBOutlet weak var aircraftType: UITextField!
    @IBOutlet weak var airportCode: UITextField!
    
    // Setup date picker for arrivalTime
    @IBOutlet weak var arrivalTime: UITextField!
    @IBAction func arrivalTimeDatePicker(sender: UITextField) {
        let datePickerView : UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.DateAndTime
        datePickerView.addTarget(self, action: #selector(FlightInformationViewController.handleArrivalDatePicker(_:)), forControlEvents: UIControlEvents.ValueChanged)
        sender.inputView = datePickerView
    }
    
    func handleArrivalDatePicker(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM dd yyyy hh:mmZZ"
        arrivalTime.text = dateFormatter.stringFromDate(sender.date)
    }

    // Setup date picker for departureTime
    @IBOutlet weak var departureTime: UITextField!
    @IBAction func departureTimeDatePicker(sender: UITextField) {
        let datePickerView : UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.DateAndTime
        datePickerView.addTarget(self, action: #selector(FlightInformationViewController.handleDepartureDatePicker(_:)), forControlEvents: UIControlEvents.ValueChanged)
        sender.inputView = datePickerView
    }
    
    func handleDepartureDatePicker(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM dd yyyy hh:mmZZ"
        departureTime.text = dateFormatter.stringFromDate(sender.date)
    }
    
    // Dismiss keyboard on tap
    @IBAction func backgroundTapped(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    // Dismiss keyboard on pressing return
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        RegistrationsManager.sharedManager.activeReservation.tailNumber = tailNumber.text
        RegistrationsManager.sharedManager.activeReservation.aircraftType = aircraftType.text
        RegistrationsManager.sharedManager.activeReservation.airportCode = airportCode.text
        RegistrationsManager.sharedManager.activeReservation.arrivalTime = arrivalTime.text
        RegistrationsManager.sharedManager.activeReservation.departureTime = departureTime.text
    }
}