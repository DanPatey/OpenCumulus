//
//  SummaryViewController.swift
//  CumlusFBO
//
//  Created by Dan Patey on 3/29/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {
    
    @IBOutlet weak var departureSummary: UITextView! {
        didSet {
            self.departureSummary.text = ReservationsManager.sharedManager.activeReservation.departureSummary()
        }
    }
    @IBOutlet weak var arrivalSummary: UITextView! {
        didSet {
            self.arrivalSummary.text = ReservationsManager.sharedManager.activeReservation.arrivalSummary()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func addItemsToSummary(textFields: [UITextField]) {
        for textfield in textFields {
            print(textfield)
        }
    }
}