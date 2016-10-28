//
//  UserLoginViewController.swift
//  CumulusFBO
//
//  Created by Courtney Osborne on 10/24/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit
import Firebase

class UserSignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var reEnterTextField: UITextField!

    var pilot = PilotModel()
    var pilotInformation = PilotInformationModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        userEmail.delegate = self
        passwordTextField.delegate = self
//        reEnterTextField.delegate = self
    }
    
    @IBAction func userLogin(sender: UIButton) {
        addUser()
    }
    
    func addUser() {
        
        guard let email = self.userEmail.text, let password = self.passwordTextField.text else {
            print("Invalid form")
            return
        }
        
        FIRAuth.auth()?.createUserWithEmail(email, password:password, completion: { (user: FIRUser?, error) in
            
            self.pilot.uid = user!.uid
            self.pilot.email = user!.email
            
            // ADD fail message if password don't match
            // Re-Enter Password
            
            if error != nil {
                print(error)
                return
            }
            let ref = FIRDatabase.database().reference().child("users").child(self.pilot.uid)
            
            let values = ["Name":RegistrationsManager.sharedManager.userInformation.firstName, "LastName":RegistrationsManager.sharedManager.userInformation.lastName, "email":self.pilot.email, "Company":RegistrationsManager.sharedManager.userInformation.company, "PhoneNumber":RegistrationsManager.sharedManager.userInformation.phoneNumber, "TailNumber":RegistrationsManager.sharedManager.userInformation.tailNumber, "AircraftType":RegistrationsManager.sharedManager.userInformation.aircraftType, "HomeAirport":RegistrationsManager.sharedManager.userInformation.homeAirport, "uid":self.pilot.uid]
            print(values)
            ref.updateChildValues(values, withCompletionBlock: { (err, ref) in
                print("Success!!")
                
                if err != nil {
                    print(err)
                    return
                }
            })
            
            ref.observeEventType(.Value, withBlock: { (snapshot) in
                
                print(snapshot.key, snapshot.value)
                
                }, withCancelBlock: { (error) in
                    
                    print(error)
            })
        })
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Navigation
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
