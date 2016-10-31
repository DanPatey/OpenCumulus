//
//  LoginViewController.swift
//  CumulusFBO
//
//  Created by Courtney Osborne on 10/28/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var rememberMeButton: UIButton!
    @IBOutlet weak var forgotpasswordButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FIRAuth.auth()?.signInWithEmail(self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
            
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func loginButton(sender: UIButton) {
        
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    }

}
