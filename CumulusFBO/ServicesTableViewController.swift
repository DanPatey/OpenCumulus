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
    
    var carsCount = 0.0
    var rentalCount = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }

    @IBAction func crewCarsCount(sender: UIStepper) {
        carsCount += 1.0

        sender.stepValue = carsCount
        print(carsCount)
    }
    
    @IBAction func rentalCarsStepper(sender: UIStepper) {
        
        sender.maximumValue += rentalCount
        sender.minimumValue -= rentalCount
        rentals.text = String(rentalCount)
    }
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }

}
