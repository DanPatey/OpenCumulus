//
//  Helper.swift
//  CumulusFBO
//
//  Created by Dan Patey on 8/27/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

extension UIViewController {
    func displayAlert(title:String, error:String, buttonText: String) {
        // Create the alert
        let alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
    
        // Add an action
        alert.addAction(UIAlertAction(title: buttonText, style: .Default, handler: { action in
        
            // Dismiss when the button is pressed
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
    
        // Add it to viewController
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

extension UITableViewController {
    override func displayAlert(title:String, error:String, buttonText: String) {
        // Create the alert
        let alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
        
        // Add an action
        alert.addAction(UIAlertAction(title: buttonText, style: .Default, handler: { action in
            
            // Dismiss when the button is pressed
            self.dismissViewControllerAnimated(true, completion: nil)
        }))
        
        // Add it to viewController
        self.presentViewController(alert, animated: true, completion: nil)
    }
}