//
//  UserLoginViewController.swift
//  CumulusFBO
//
//  Created by Courtney Osborne on 10/24/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit
import Firebase

class UserLoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userEmail: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var reEnterTextField: UITextField!

    var customers = CustomersModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        userEmail.delegate = self
        passwordTextField.delegate = self
        reEnterTextField.delegate = self
    }
    
    @IBAction func userLogin(sender: UIButton) {
        
        addUser()
    }
    
    func addUser() {
        
        guard let email = self.userEmail.text, password = self.passwordTextField.text else {
            print("Invalid form")
            return
        }
        
        FIRAuth.auth()?.createUserWithEmail(email, password:password, completion: { (user: FIRUser?, error) in
            
            self.customers.uid = user!.uid
            self.customers.email = user!.email
            
            // ADD fail message if password doesn't match
            // Re-Enter Password
            
            if error != nil {
                print(error)
                return
            }
            let ref = FIRDatabase.database().reference().child("users").child(self.customers.uid)
            
            let values = ["email":self.customers.email, "uid":self.customers.uid]
            
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
