////
////  DepartureViewController.swift
////  CumlusFBO
////
////  Created by Dan Patey on 3/29/16.
////  Copyright © 2016 Dan Patey. All rights reserved.
////
//
//import UIKit
//
//class DepartureViewController: UIViewController {
//    
//    @IBOutlet weak var departureAirport: UITextField!
//    @IBOutlet weak var departureDate: UITextField!
//    @IBOutlet weak var departureTime: UITextField!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        ReservationsManager.sharedManager.activeReservation.departureAirport = departureAirport.text
//        ReservationsManager.sharedManager.activeReservation.departureDate = departureDate.text
//        ReservationsManager.sharedManager.activeReservation.departureTime = departureTime.text
//    }
//}