//
//  FlightInformationViewController.swift
//  CumulusFBO
//
//  Created by Dan Patey on 7/9/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class FlightInformationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textFieldScroll: UIScrollView!
    
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
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
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
        textField.inputAccessoryView = toolBar
       
        return true
    }
    
    //MARK: Datepicker Toolbar functions
    func nextButton(textField: UITextField) {
        if tailNumber.editing == true {
            aircraftType.becomeFirstResponder()
        } else if aircraftType.editing == true {
            airportCode.becomeFirstResponder()
        } else if airportCode.editing == true {
            textFieldScroll.setContentOffset(CGPointMake(0, 100), animated: true)
            arrivalTime.becomeFirstResponder()
        } else if arrivalTime.editing == true {
            textFieldScroll.setContentOffset(CGPointMake(0, 100), animated: true)
            departureTime.becomeFirstResponder()
        } else if departureTime.editing == true {
            textFieldScroll.setContentOffset(CGPointMake(0, 100), animated: true)
            tailNumber.becomeFirstResponder()
        }
    }
    
    func previousButton(textField: UITextField) {
        if tailNumber.editing == true {
            departureTime.becomeFirstResponder()
        } else if aircraftType.editing == true {
            tailNumber.becomeFirstResponder()
        } else if airportCode.editing == true {
            textFieldScroll.setContentOffset(CGPointMake(0, 100), animated: true)
            aircraftType.becomeFirstResponder()
        } else if arrivalTime.editing == true {
            textFieldScroll.setContentOffset(CGPointMake(0, 100), animated: true)
            airportCode.becomeFirstResponder()
        } else if departureTime.editing == true {
            textFieldScroll.setContentOffset(CGPointMake(0, 100), animated: true)
            arrivalTime.becomeFirstResponder()
        }
    }

    func doneButton() {
        view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
        //Scrolling TextField
        if textField == aircraftType {
        textFieldScroll.setContentOffset(CGPointMake(0, 70), animated: true)
        } else if textField == airportCode {
        textFieldScroll.setContentOffset(CGPointMake(0, 70), animated: true)
        } else if textField == arrivalTime {
        textFieldScroll.setContentOffset(CGPointMake(0, 70), animated: true)
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        //Scrolling TextField
        if textField == aircraftType {
        textFieldScroll.setContentOffset(CGPointMake(0, 0), animated: true)
        } else if textField == airportCode {
        textFieldScroll.setContentOffset(CGPointMake(0, 0), animated: true)
        } else if textField == arrivalTime {
        textFieldScroll.setContentOffset(CGPointMake(0, 0), animated: true)
        }
    }
    
    //MARK: Dismiss keyboard on tap
    @IBAction func backgroundTapped(sender: UITapGestureRecognizer) {
        textFieldScroll.setContentOffset(CGPointMake(0, 0), animated: true)
        view.endEditing(true)
    }
    
    //MARK: Dismiss keyboard on pressing return
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textFieldScroll.setContentOffset(CGPointMake(0, 0), animated: true)
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        tailNumber.text = ""
        aircraftType.text = ""
        airportCode.text = ""
        departureTime.text = ""
        arrivalTime.text = ""
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if tailNumber.text != "" && aircraftType.text != "" && airportCode.text != "" && aircraftType.text != "" && departureTime.text != "" {
                RegistrationsManager.sharedManager.activeReservation.tailNumber = tailNumber.text
                RegistrationsManager.sharedManager.activeReservation.aircraftType = aircraftType.text
                RegistrationsManager.sharedManager.activeReservation.airportCode = airportCode.text
                RegistrationsManager.sharedManager.activeReservation.arrivalTime = arrivalTime.text
                RegistrationsManager.sharedManager.activeReservation.departureTime = departureTime.text
        } else {
            let alert = UIAlertController(title: "", message: "You Must Fill In All Required Information", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.Cancel, handler: nil))
            // Present the AlertController
            presentViewController(alert, animated: true, completion: nil)
        }
    }
}


