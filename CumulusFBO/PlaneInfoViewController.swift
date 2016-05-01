//
//  PlaneInfoViewController.swift
//  CumlusFBO
//
//  Created by Dan Patey on 3/29/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class PlaneInfoViewController: UIViewController {
    
    @IBOutlet weak var aircraftType: UITextField!
    @IBOutlet weak var tailNumber: UITextField!
    @IBOutlet weak var fuelType: UITextField!
    @IBOutlet weak var fuelUnits: UITextField!
    @IBOutlet weak var numberOfPassengers: UITextField!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        ReservationsManager.sharedManager.activeReservation.aircraftType = aircraftType.text
        ReservationsManager.sharedManager.activeReservation.tailNumber = tailNumber.text
//        ReservationsManager.sharedManager.activeReservation.fuelType = fuelType.text
//        ReservationsManager.sharedManager.activeReservation.fuelUnits = fuelUnits.text
//        ReservationsManager.sharedManager.activeReservation.passengers = numberOfPassengers.integer
    }
}