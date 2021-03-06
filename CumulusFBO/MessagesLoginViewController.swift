//
//  MessagesLoginViewController.swift
//  CumulusFBO
//
//  Created by Dan Patey on 8/29/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit
import Firebase

class MessagesLoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginDidTouch(sender: AnyObject) {
        FIRAuth.auth()?.signInAnonymouslyWithCompletion {( user, error) in
            if error != nil { print(error!.description); return }
        self.performSegueWithIdentifier("LoginToChat", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "LoginToChat" {
        let navigationViewController = segue.destinationViewController as! UINavigationController
        let chatViewController = navigationViewController.topViewController as! ChatViewController
        chatViewController.senderId = "SomeUserId"
        chatViewController.senderDisplayName = "Some User"
        }
    }
}