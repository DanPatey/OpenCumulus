//
//  LoginViewController.swift
//  CumulusFBO
//
//  Created by Courtney Osborne on 9/4/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBarHidden = true 
        loginButton.layer.opacity = 0.80
        loginButton.titleLabel?.textColor = UIColor.whiteColor()
        startButton.layer.opacity = 0.80
        startButton.titleLabel?.textColor = UIColor.whiteColor()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(false)
        navigationController?.navigationBarHidden = true 
    }
}
