//
//  ViewController.swift
//  CumlusFBO
//
//  Created by Dan Patey on 3/29/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var nameOutlet: UITextField!
    @IBOutlet weak var primaryContact: UITextField!
    @IBOutlet weak var homeBase: UITextField!
    @IBOutlet weak var operatedUnder: UITextField!
    @IBOutlet weak var textFieldsContainerView: UIView! {
        didSet {
            self.textFieldsContainerView.layer.cornerRadius = 5.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        ReservationsManager.sharedManager.activeReservation.name = nameOutlet.text
        ReservationsManager.sharedManager.activeReservation.primaryContact = primaryContact.text
        ReservationsManager.sharedManager.activeReservation.homeBase = homeBase.text
        ReservationsManager.sharedManager.activeReservation.operatedUnder = operatedUnder.text
    }
}