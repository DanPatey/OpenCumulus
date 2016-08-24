//
//  ServicesTableViewController.swift
//  CumulusFBO
//
//  Created by Courtney Osborne on 8/19/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class ServicesTableViewController: UITableViewController {

    @IBOutlet weak var crewCars: UILabel!
    @IBOutlet weak var rentals: UILabel!
    @IBOutlet weak var antiIceSwitch: UISwitch!
    @IBOutlet weak var baggageCart: UISwitch!
    @IBOutlet weak var gpuCart: UISwitch!
    @IBOutlet weak var marshaller: UISwitch!
    @IBOutlet weak var lavService: UISwitch!
    @IBOutlet weak var catering: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func crewCarsCount(sender: UIStepper) {
        self.crewCars.text = "\(Int(sender.value))"
    }
    
    @IBAction func rentalCarsStepper(sender: UIStepper) {
        self.rentals.text = "\(Int(sender.value))"
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        RegistrationsManager.sharedManager.activeReservation.antiIce = antiIceSwitch.on
        RegistrationsManager.sharedManager.activeReservation.baggageCart = baggageCart.on
        RegistrationsManager.sharedManager.activeReservation.gpuCart = gpuCart.on
        RegistrationsManager.sharedManager.activeReservation.marshaller = marshaller.on
        RegistrationsManager.sharedManager.activeReservation.lavService = lavService.on
        RegistrationsManager.sharedManager.activeReservation.catering = catering.on
        RegistrationsManager.sharedManager.activeReservation.crewCars = crewCars.text
        RegistrationsManager.sharedManager.activeReservation.rentals = rentals.text
    }

}












