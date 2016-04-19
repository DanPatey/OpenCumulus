//
//  ArrivalServicesViewController.swift
//  CumlusFBO
//
//  Created by Dan Patey on 3/29/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class ArrivalServicesViewController: UIViewController {

    @IBOutlet weak var arrivingDeIce: UISwitch!
    @IBOutlet weak var arrivingBaggageCarts: UISwitch!
    @IBOutlet weak var arrivingGPUCart: UISwitch!
    @IBOutlet weak var arrivingMarshaller: UISwitch!
    @IBOutlet weak var arrivingLavatoryService: UISwitch!
    @IBOutlet weak var arrivingCatering: UISwitch!
    @IBOutlet weak var arrivingCrewCar: UISwitch!
    @IBOutlet weak var arrivingCarRental: UISwitch!
    @IBOutlet weak var arrivingHotel: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.prepopulateSwitches()
        self.arrivingDeIce.addTarget(self, action: #selector(DepartureServicesViewController.switchSwitched(_:)), forControlEvents: UIControlEvents.ValueChanged)
        self.arrivingBaggageCarts.addTarget(self, action: #selector(DepartureServicesViewController.switchSwitched(_:)), forControlEvents: UIControlEvents.ValueChanged)
        self.arrivingGPUCart.addTarget(self, action: #selector(DepartureServicesViewController.switchSwitched(_:)), forControlEvents: UIControlEvents.ValueChanged)
        self.arrivingMarshaller.addTarget(self, action: #selector(DepartureServicesViewController.switchSwitched(_:)), forControlEvents: UIControlEvents.ValueChanged)
        self.arrivingLavatoryService.addTarget(self, action: #selector(DepartureServicesViewController.switchSwitched(_:)), forControlEvents: UIControlEvents.ValueChanged)
        self.arrivingCatering.addTarget(self, action: #selector(DepartureServicesViewController.switchSwitched(_:)), forControlEvents: UIControlEvents.ValueChanged)
        self.arrivingCrewCar.addTarget(self, action: #selector(DepartureServicesViewController.switchSwitched(_:)), forControlEvents: UIControlEvents.ValueChanged)
        self.arrivingCarRental.addTarget(self, action: #selector(DepartureServicesViewController.switchSwitched(_:)), forControlEvents: UIControlEvents.ValueChanged)
        self.arrivingHotel.addTarget(self, action: #selector(DepartureServicesViewController.switchSwitched(_:)), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func prepopulateSwitches() {
        self.arrivingDeIce.on = ReservationsManager.sharedManager.activeReservation.arrivingDeIce
        self.arrivingBaggageCarts.on = ReservationsManager.sharedManager.activeReservation.arrivingBaggageCarts
        self.arrivingGPUCart.on = ReservationsManager.sharedManager.activeReservation.arrivingGPUCarts
        self.arrivingMarshaller.on = ReservationsManager.sharedManager.activeReservation.arrivingMarshalling
        self.arrivingLavatoryService.on = ReservationsManager.sharedManager.activeReservation.arrivingLavatoryService
        self.arrivingCatering.on = ReservationsManager.sharedManager.activeReservation.arrivingCatering
        self.arrivingCrewCar.on = ReservationsManager.sharedManager.activeReservation.arrivingCrewCar
        self.arrivingCarRental.on = ReservationsManager.sharedManager.activeReservation.arrivingCarRental
        self.arrivingHotel.on = ReservationsManager.sharedManager.activeReservation.arrivingHotel
    }
    
    func switchSwitched(theSwitch: UISwitch) {
        switch theSwitch {
        case arrivingDeIce:
            ReservationsManager.sharedManager.activeReservation.arrivingDeIce = theSwitch.on
        case arrivingBaggageCarts:
            ReservationsManager.sharedManager.activeReservation.arrivingBaggageCarts = theSwitch.on
        case arrivingGPUCart:
            ReservationsManager.sharedManager.activeReservation.arrivingGPUCarts = theSwitch.on
        case arrivingMarshaller:
            ReservationsManager.sharedManager.activeReservation.arrivingMarshalling = theSwitch.on
        case arrivingLavatoryService:
            ReservationsManager.sharedManager.activeReservation.arrivingLavatoryService = theSwitch.on
        case arrivingCatering:
            ReservationsManager.sharedManager.activeReservation.arrivingCatering = theSwitch.on
        case arrivingCrewCar:
            ReservationsManager.sharedManager.activeReservation.arrivingCrewCar = theSwitch.on
        case arrivingCarRental:
            ReservationsManager.sharedManager.activeReservation.arrivingCarRental = theSwitch.on
        case arrivingHotel:
            ReservationsManager.sharedManager.activeReservation.arrivingHotel = theSwitch.on
        default:
            break
        }
    }
}