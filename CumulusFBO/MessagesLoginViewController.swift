//
//  MessagesLoginViewController.swift
//  CumulusFBO
//
//  Created by Dan Patey on 8/29/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit
import FirebaseAuth

class MessagesLoginViewController: UIViewController {
    
    var ref: FIRAuth!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRAuth.auth()
    }
    
    @IBAction func loginDidTouch(sender: AnyObject) {
        ref.signInAnonymouslyWithCompletion { (users, error) in
            if error != nil { print(error!.description); return }
        
        print(self.ref.currentUser?.displayName)
        self.performSegueWithIdentifier("LoginToChat", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        let navigationViewController = segue.destinationViewController as! UINavigationController
        let chatViewController = navigationViewController.viewControllers.first as! ChatViewController
        chatViewController.senderId = "SomeUserId"
        chatViewController.senderDisplayName = "Some User"
    }
}