//
//  FboSelectorCell.swift
//  CumulusFBO
//
//  Created by Courtney Osborne on 9/6/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit
import Firebase

class FboSelectorCell: UICollectionViewCell, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var fboTableView: UITableView!
    
    var fbos = [FBOList]()
    var fboServices = ["JET-A","100LL","Freq"]
    var fboItems = [String]()
    var fieldname = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fboTableView.delegate = self
        fboTableView.dataSource = self

    }

    
//    func fetchFbos(key: String) {
//        
//        let ref = FIRDatabase.database().reference().child("Airport/\(key)/FBOs/Signature")
//        
//        ref.observeEventType(.Value, withBlock: { (snapshot) in
//            
//            if let dictionary = snapshot.value as? [String: AnyObject] {
    
                // This will fire after the second 'nil' value in FBOSelector
//                RegistrationsManager.sharedManager.activeReservation.firll = dictionary["100ll"] as? String
//                RegistrationsManager.sharedManager.activeReservation.firfreq = dictionary["freq"] as? String
//                RegistrationsManager.sharedManager.activeReservation.firjeta = dictionary["jet-a"] as? String
//                RegistrationsManager.sharedManager.activeReservation.firemail = dictionary["email"] as? String
//                RegistrationsManager.sharedManager.activeReservation.firfullName = dictionary["fullname"] as? String
//                RegistrationsManager.sharedManager.activeReservation.firphoneNumber = dictionary["phonenumber"] as? String
            
//                 dispatch_async(dispatch_get_main_queue(), {
//                    self.fboTableView.reloadData()
//                })
//            }
//        })
//    }
  
   
    // MARK: - Datasources
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fieldname.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cells", forIndexPath: indexPath)
        
        cell.textLabel?.text = self.fboServices[indexPath.row]
//        cell.detailTextLabel?.text = self.fboItems[indexPath.row]
        return cell
    }
    
}
