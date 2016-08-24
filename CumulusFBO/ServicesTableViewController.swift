//
//  ServicesTableViewController.swift
//  CumulusFBO
//
//  Created by Courtney Osborne on 8/19/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class ServicesTableViewController: UITableViewController {

    @IBOutlet weak var crewCars: UILabel!
    @IBOutlet weak var rentals: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }

    @IBAction func crewCarsCount(sender: UIStepper) {
        self.crewCars.text = "\(sender.value)"
    }
    
    @IBAction func rentalCarsStepper(sender: UIStepper) {
        self.rentals.text = "\(sender.value)"
    }
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }

}
