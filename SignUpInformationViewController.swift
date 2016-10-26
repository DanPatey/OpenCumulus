//
//  SignUpInformationViewController.swift
//  CumulusFBO
//
//  Created by Courtney Osborne on 10/25/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class SignUpInformationViewController: UIViewController {
    
    // MARK: Textfields
    @IBOutlet weak var firstNameTextfield: UITextField!
    @IBOutlet weak var lastNameTextfield: UITextField!
    @IBOutlet weak var companyTextfield: UITextField!
    @IBOutlet weak var phoneNumberTextfield: UITextField!
    @IBOutlet weak var tailNumberTextfield: UITextField!
    @IBOutlet weak var aircraftTextfield: UITextField!
    @IBOutlet weak var homeAirportTextfield: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
