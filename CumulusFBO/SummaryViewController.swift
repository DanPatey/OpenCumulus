//
//  SummaryViewController.swift
//  CumlusFBO
//
//  Created by Dan Patey on 3/29/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {
    
    @IBOutlet weak var summary: UITextView! {
        didSet {
            self.summary.text = ReservationsManager.sharedManager.activeReservation.generateSummary()
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