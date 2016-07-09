////
////  DepartureServicesViewController.swift
////  CumlusFBO
////
////  Created by Dan Patey on 3/29/16.
////  Copyright © 2016 Dan Patey. All rights reserved.
////
//
//import UIKit
//
//class DepartureServicesViewController: UIViewController {
//
//    @IBOutlet weak var departingDeIce: UISwitch!
//    @IBOutlet weak var departingBaggageCarts: UISwitch!
//    @IBOutlet weak var departingGPUCart: UISwitch!
//    @IBOutlet weak var departingMarshalling: UISwitch!
//    @IBOutlet weak var departingLavatoryService: UISwitch!
//    @IBOutlet weak var departingCatering: UISwitch!
//    @IBOutlet weak var departingCrewCar: UISwitch!
//    @IBOutlet weak var departingCarRental: UISwitch!
//    @IBOutlet weak var departingHotel: UISwitch!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.prepopulateSwitches()
//        self.departingDeIce.addTarget(self, action: #selector(DepartureServicesViewController.switchSwitched(_:)), forControlEvents: UIControlEvents.ValueChanged)
//        self.departingBaggageCarts.addTarget(self, action: #selector(DepartureServicesViewController.switchSwitched(_:)), forControlEvents: UIControlEvents.ValueChanged)
//        self.departingGPUCart.addTarget(self, action: #selector(DepartureServicesViewController.switchSwitched(_:)), forControlEvents: UIControlEvents.ValueChanged)
//        self.departingMarshalling.addTarget(self, action: #selector(DepartureServicesViewController.switchSwitched(_:)), forControlEvents: UIControlEvents.ValueChanged)
//        self.departingLavatoryService.addTarget(self, action: #selector(DepartureServicesViewController.switchSwitched(_:)), forControlEvents: UIControlEvents.ValueChanged)
//        self.departingCatering.addTarget(self, action: #selector(DepartureServicesViewController.switchSwitched(_:)), forControlEvents: UIControlEvents.ValueChanged)
//        self.departingCrewCar.addTarget(self, action: #selector(DepartureServicesViewController.switchSwitched(_:)), forControlEvents: UIControlEvents.ValueChanged)
//        self.departingCarRental.addTarget(self, action: #selector(DepartureServicesViewController.switchSwitched(_:)), forControlEvents: UIControlEvents.ValueChanged)
//        self.departingHotel.addTarget(self, action: #selector(DepartureServicesViewController.switchSwitched(_:)), forControlEvents: UIControlEvents.ValueChanged)
//    }
//    
//    func prepopulateSwitches() {
//        self.departingDeIce.on = ReservationsManager.sharedManager.activeReservation.departingDeIce
//        self.departingBaggageCarts.on = ReservationsManager.sharedManager.activeReservation.departingBaggageCarts
//        self.departingGPUCart.on = ReservationsManager.sharedManager.activeReservation.departingGPUCarts
//        self.departingMarshalling.on = ReservationsManager.sharedManager.activeReservation.departingMarshalling
//        self.departingLavatoryService.on = ReservationsManager.sharedManager.activeReservation.departingLavatoryService
//        self.departingCatering.on = ReservationsManager.sharedManager.activeReservation.departingCatering
//        self.departingCrewCar.on = ReservationsManager.sharedManager.activeReservation.departingCrewCar
//        self.departingCarRental.on = ReservationsManager.sharedManager.activeReservation.departingCarRental
//        self.departingHotel.on = ReservationsManager.sharedManager.activeReservation.departingHotel
//    }
//    
//    func switchSwitched(theSwitch: UISwitch) {
//        switch theSwitch {
//        case departingDeIce:
//            ReservationsManager.sharedManager.activeReservation.departingDeIce = theSwitch.on
//        case departingBaggageCarts:
//            ReservationsManager.sharedManager.activeReservation.departingBaggageCarts = theSwitch.on
//        case departingGPUCart:
//            ReservationsManager.sharedManager.activeReservation.departingGPUCarts = theSwitch.on
//        case departingMarshalling:
//            ReservationsManager.sharedManager.activeReservation.departingMarshalling = theSwitch.on
//        case departingLavatoryService:
//            ReservationsManager.sharedManager.activeReservation.departingLavatoryService = theSwitch.on
//        case departingCatering:
//            ReservationsManager.sharedManager.activeReservation.departingCatering = theSwitch.on
//        case departingCrewCar:
//            ReservationsManager.sharedManager.activeReservation.departingCrewCar = theSwitch.on
//        case departingCarRental:
//            ReservationsManager.sharedManager.activeReservation.departingCarRental = theSwitch.on
//        case departingHotel:
//            ReservationsManager.sharedManager.activeReservation.departingHotel = theSwitch.on
//        default:
//            break
//        }
//    }
//}