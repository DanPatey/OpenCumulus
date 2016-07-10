//
//  FlightInformationViewController.swift
//  CumulusFBO
//
//  Created by Dan Patey on 7/9/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class FlightInformationViewController: UIViewController {
    
    @IBOutlet weak var tailNumber: UITextField!
    @IBOutlet weak var airportCode: UITextField!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        RegistrationsManager.sharedManager.activeReservation.tailNumber = tailNumber.text
        RegistrationsManager.sharedManager.activeReservation.airportCode = airportCode.text
        RegistrationsManager.sharedManager.activeReservation.arrivalTime = arrivalTime.text
        RegistrationsManager.sharedManager.activeReservation.departureTime = departureTime.text
    }
}