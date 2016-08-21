//
//  ServicesTableViewController.swift
//  CumulusFBO
//
//  Created by Courtney Osborne on 8/19/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class ServicesTableViewController: UITableViewController {

    @IBOutlet weak var antiIceSwitch: UISwitch!
    @IBOutlet weak var baggageCart: UISwitch!
    @IBOutlet weak var gpuCart: UISwitch!
    @IBOutlet weak var marshallerSwitch: UISwitch!
    @IBOutlet weak var lavService: UISwitch!
    @IBOutlet weak var cateringSwitch: UISwitch!
    @IBOutlet weak var crewCarSwitch: UISwitch!
    @IBOutlet weak var rentalCarSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func antiIce(sender: UISwitch) {
        if sender.on {
            print("on")
        }
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
