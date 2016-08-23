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
    
    let carsCount = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }

    @IBAction func crewCarsCount(sender: UIStepper) {
        if sender.maximumValue {
            
        }
        
    }
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }

}
