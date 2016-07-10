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
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(FlightInformationViewController.handleDatePicker(_:)), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func handleDatePicker(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MMMM dd yyyy hh:mmZZ"
        arrivalTime.text = dateFormatter.stringFromDate(sender.date)
    }
    
    @IBOutlet weak var departureTime: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        ReservationsManager.sharedManager.activeReservation.tailNumber = tailNumber.text
        ReservationsManager.sharedManager.activeReservation.airportCode = airportCode.text
        ReservationsManager.sharedManager.activeReservation.arrivalTime = arrivalTime.text
        ReservationsManager.sharedManager.activeReservation.departureTime = departureTime.text
    }
}