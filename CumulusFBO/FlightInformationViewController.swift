//
//  FlightInformationViewController.swift
//  CumulusFBO
//
//  Created by Dan Patey on 7/9/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class FlightInformationViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Flight information variables
    @IBOutlet weak var tailNumber: UITextField!
    @IBOutlet weak var aircraftType: UITextField!
    @IBOutlet weak var airportCode: UITextField!
    
    //MARK: Setup date picker for arrivalTime
    @IBOutlet weak var arrivalTime: UITextField!
    @IBAction func arrivalTimeDatePicker(sender: UITextField) {
        // Create the date picker
        let datePickerView : UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.DateAndTime
        datePickerView.addTarget(self, action: #selector(FlightInformationViewController.handleArrivalDatePicker(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        // Create the UIToolbar
        let toolBar = UIToolbar()
        toolBar.barStyle = .Default
        toolBar.translucent = true
        toolBar.sizeToFit()
        
        // Add the buttons
        let previousButton = UIBarButtonItem(title: "Previous", style: .Plain, target: self, action: #selector(FlightInformationViewController.previousButton))
        let nextButton = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: #selector(FlightInformationViewController.nextButton))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: #selector(FlightInformationViewController.doneButton))
        toolBar.setItems([previousButton, nextButton, spaceButton, doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        
        // Add datepicker and toolbar to view
        sender.inputView = datePickerView
        sender.inputAccessoryView = toolBar
    }
    
    func handleArrivalDatePicker(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM dd yyyy HH:mmZZ"
        arrivalTime.text = dateFormatter.stringFromDate(sender.date)
    }

    //MARK: Setup date picker for departureTime
    @IBOutlet weak var departureTime: UITextField!
    @IBAction func departureTimeDatePicker(sender: UITextField) {
        let datePickerView : UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.DateAndTime
        datePickerView.addTarget(self, action: #selector(FlightInformationViewController.handleDepartureDatePicker(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        // Create the UIToolbar
        let toolBar = UIToolbar()
        toolBar.barStyle = .Default
        toolBar.translucent = true
        toolBar.sizeToFit()
        
        // Add the buttons
        let previousButton = UIBarButtonItem(title: "Previous", style: .Plain, target: self, action: #selector(FlightInformationViewController.previousButton))
        let nextButton = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: #selector(FlightInformationViewController.nextButton))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: #selector(FlightInformationViewController.doneButton))
        toolBar.setItems([previousButton, nextButton, spaceButton, doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        
        // Add datepicker and toolbar to view
        sender.inputView = datePickerView
        sender.inputAccessoryView = toolBar
    }
    
    func handleDepartureDatePicker(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM dd yyyy HH:mmZZ"
        departureTime.text = dateFormatter.stringFromDate(sender.date)
    }
    
    //MARK: Datepicker Toolbar functions
    func previousButton() {
        let currentField = self.view.viewWithTag as! UITextField
        print (currentField)
    }
    
    func nextButton() {
        view.endEditing(true)
    }

    func doneButton() {
        view.endEditing(true)
    }
    
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
        RegistrationsManager.sharedManager.activeReservation.tailNumber = tailNumber.text
        RegistrationsManager.sharedManager.activeReservation.aircraftType = aircraftType.text
        RegistrationsManager.sharedManager.activeReservation.airportCode = airportCode.text
        RegistrationsManager.sharedManager.activeReservation.arrivalTime = arrivalTime.text
        RegistrationsManager.sharedManager.activeReservation.departureTime = departureTime.text
    }
}