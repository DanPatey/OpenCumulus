//
//  SignUpInformationViewController.swift
//  CumulusFBO
//
//  Created by Courtney Osborne on 10/25/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class SignUpInformationViewController: UIViewController, UITextFieldDelegate{
    
    // MARK: Textfields
    @IBOutlet weak var firstNameTextfield: UITextField!
    @IBOutlet weak var lastNameTextfield: UITextField!
    @IBOutlet weak var companyTextfield: UITextField!
    @IBOutlet weak var phoneNumberTextfield: UITextField!
    @IBOutlet weak var tailNumberTextfield: UITextField!
    @IBOutlet weak var aircraftTextfield: UITextField!
    @IBOutlet weak var homeAirportTextfield: UITextField!
    
    var pilotInformation = PilotInformationModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstNameTextfield.delegate = self
        lastNameTextfield.delegate = self
        companyTextfield.delegate = self
        phoneNumberTextfield.delegate = self
        tailNumberTextfield.delegate = self
        aircraftTextfield.delegate = self
        homeAirportTextfield.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    // MARK: - Navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        RegistrationsManager.sharedManager.userInformation.firstName = self.firstNameTextfield.text
        RegistrationsManager.sharedManager.userInformation.lastName = self.lastNameTextfield.text
        RegistrationsManager.sharedManager.userInformation.company = self.companyTextfield.text
        RegistrationsManager.sharedManager.userInformation.phoneNumber = self.phoneNumberTextfield.text
        RegistrationsManager.sharedManager.userInformation.tailNumber = self.tailNumberTextfield.text
        RegistrationsManager.sharedManager.userInformation.aircraftType = self.aircraftTextfield.text
        RegistrationsManager.sharedManager.userInformation.homeAirport = self.homeAirportTextfield.text
        
    }

}
