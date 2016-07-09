////
////  ArrivialViewController.swift
////  CumlusFBO
////
////  Created by Dan Patey on 3/29/16.
////  Copyright © 2016 Dan Patey. All rights reserved.
////
//
//import UIKit
//
//class ArrivialViewController: UIViewController {
//
//    @IBOutlet weak var arrivalAirport: UITextField!
//    @IBOutlet weak var arrivalDate: UITextField!
//    @IBOutlet weak var arrivalTime: UITextField!
//    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        ReservationsManager.sharedManager.activeReservation.arrivalAirport = arrivalAirport.text
//        ReservationsManager.sharedManager.activeReservation.arrivalDate = arrivalDate.text
//        ReservationsManager.sharedManager.activeReservation.arrivalTime = arrivalTime.text
//    }
//}