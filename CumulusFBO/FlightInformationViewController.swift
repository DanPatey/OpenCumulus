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
    @IBOutlet weak var selectArrivalTime: UIButton!
    @IBOutlet weak var departureTime: UITextField!
    @IBOutlet weak var selectDepartureTime: UIButton!
    
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