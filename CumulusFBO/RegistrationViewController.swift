//
//  ViewController.swift
//  CumlusFBO
//
//  Created by Dan Patey on 3/29/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var email: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        RegistrationsManager.sharedManager.activeReservation.firstName = firstName.text
        RegistrationsManager.sharedManager.activeReservation.lastName = lastName.text
        RegistrationsManager.sharedManager.activeReservation.company = company.text
        RegistrationsManager.sharedManager.activeReservation.phoneNumber = phoneNumber.text
        RegistrationsManager.sharedManager.activeReservation.email = email.text
    }
}