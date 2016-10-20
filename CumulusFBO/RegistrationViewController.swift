//
//  ViewController.swift
//  CumlusFBO
//
//  Created by Dan Patey on 3/29/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Registration variables
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var company: UITextField!
    @IBOutlet weak var email: UITextField!
    
    // MARK: ScrollView
    @IBOutlet weak var scrollView: UIScrollView!
    
    //MARK: View controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // This is a surprise delegate problem for some reason
        self.firstName.delegate = self
        self.lastName.delegate = self
        self.phoneNumber.delegate = self
        self.company.delegate = self
        self.email.delegate = self
        
    }
    
    //MARK: Dismiss keyboard on tap
    @IBAction func backgroundTapped(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    //MARK: Dismiss keyboard on pressing return
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        // Create the UIToolbar
        let toolBar = UIToolbar()
        toolBar.barStyle = .Default
        toolBar.translucent = true
        toolBar.sizeToFit()
        
        // Add the buttons
        let previousButton = UIBarButtonItem(title: "Previous", style: .Plain, target: self, action: #selector(RegistrationViewController.previousButton))
        let nextButton = UIBarButtonItem(title: "Next", style: .Plain, target: self, action: #selector(RegistrationViewController.nextButton))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: #selector(RegistrationViewController.doneButton))
        toolBar.setItems([previousButton, nextButton, spaceButton, doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        
        // Add datepicker and toolbar to view
        textField.inputAccessoryView = toolBar
        
        return true
    }
    
    //MARK: ScrollView
    func textFieldDidBeginEditing(textField: UITextField) {

     if textField == lastName {
            scrollView.setContentOffset(CGPointMake(0, 70), animated: true)
        } else if textField == phoneNumber {
            scrollView.setContentOffset(CGPointMake(0, 70), animated: true)
        } else if textField == company {
            scrollView.setContentOffset(CGPointMake(0, 70), animated: true)
        } else if textField == email {
            scrollView.setContentOffset(CGPointMake(0, 170), animated: true)
        } else if textField == firstName {
            scrollView.setContentOffset(CGPointMake(0, 0), animated: true)
        }
    }

    func textFieldDidEndEditing(textField: UITextField) {

        if textField == firstName {
                scrollView.setContentOffset(CGPointMake(0, 0), animated: true)
            } else if textField == lastName {
                scrollView.setContentOffset(CGPointMake(0, 0), animated: true)
            } else if textField == company {
                scrollView.setContentOffset(CGPointMake(0, 0), animated: true)
            } else if textField == phoneNumber {
                scrollView.setContentOffset(CGPointMake(0, 0), animated: true)
            } else if textField == email {
                scrollView.setContentOffset(CGPointMake(0, 0), animated: true)
            }
        }
  
    //MARK: Datepicker Toolbar functions
    func nextButton(textField: UITextField) {
        if firstName.editing == true {
            lastName.becomeFirstResponder()
        } else if lastName.editing == true {
            phoneNumber.becomeFirstResponder()
        } else if phoneNumber.editing == true {
            company.becomeFirstResponder()
        } else if company.editing == true {
            email.becomeFirstResponder()
        } else if email.editing == true {
            firstName.becomeFirstResponder()
        }
    }
    
    func previousButton(textField: UITextField) {
        if firstName.editing == true {
            email.becomeFirstResponder()
        } else if lastName.editing == true {
            firstName.becomeFirstResponder()
        } else if phoneNumber.editing == true {
            lastName.becomeFirstResponder()
        } else if company.editing == true {
            phoneNumber.becomeFirstResponder()
        } else if email.editing == true {
            company.becomeFirstResponder()
        }
    }
    
    func doneButton() {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if phoneNumber.text == "" {
            let alert = UIAlertController(title: "", message: "FBO Requires Phone Number For Reservations", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.Cancel, handler: nil))
            // Present the AlertController
            presentViewController(alert, animated: true, completion: nil)
        } else {
            RegistrationsManager.sharedManager.activeReservation.firstName = firstName.text
            RegistrationsManager.sharedManager.activeReservation.lastName = lastName.text
            RegistrationsManager.sharedManager.activeReservation.phoneNumber = phoneNumber.text
            RegistrationsManager.sharedManager.activeReservation.company = company.text
            RegistrationsManager.sharedManager.activeReservation.email = email.text
        }
    }
}
