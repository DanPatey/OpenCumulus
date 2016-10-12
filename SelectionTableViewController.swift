//
//  SelectionTableViewController.swift
//  CumulusFBO
//
//  Created by Courtney Osborne on 10/9/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit
import Firebase

class SelectionTableViewController: UITableViewController {

    var locations = [String]()
    var information: String!
    var fbos = [FBOList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        FIRAuth.auth()?.signInAnonymouslyWithCompletion() { (user, error) in
//            print("Successful login!: \(user?.uid)")
        }
        fetchAirport()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Firebase implementation to send FBOs to database
    func fetchAirport() {
        
        let ref = FIRDatabase.database().reference().child("Airport")
        
        ref.observeEventType(.Value, withBlock: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
                for (key, _) in dictionary {
                    self.locations.append(key)
                    
                    dispatch_async(dispatch_get_main_queue(), {
                        self.tableView.reloadData()
                    })
                }
            }
        })
    }

    
    // MARK: - Table view data source
    func numberOfSections(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
     override func tableView( tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = self.locations[indexPath.row]
        return cell
    }

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! FBOSelectorViewController
        let path = tableView.indexPathForSelectedRow
            destination.fieldName = self.locations[(path?.row)!]
        self.fetchFbos(self.locations[(path?.row)!])
    }
    
    func fetchFbos(fieldName: String) {
        let ref = FIRDatabase.database().reference().child("Airport/\(fieldName)/FBOs/Signature")
        
        ref.observeEventType(.Value, withBlock: { (snapshot) in
//           print(snapshot)
        if let dictionary = snapshot.value as? [String: AnyObject] {
//            RegistrationsManager.sharedManager.activeReservation.firfboName = fieldName
            RegistrationsManager.sharedManager.activeReservation.firemail = dictionary["email"] as? String
            RegistrationsManager.sharedManager.activeReservation.firll = dictionary["100ll"] as? String
            RegistrationsManager.sharedManager.activeReservation.firfreq = dictionary["freq"] as? String
            RegistrationsManager.sharedManager.activeReservation.firjeta = dictionary["jet-a"] as? String
            RegistrationsManager.sharedManager.activeReservation.firfullName = dictionary["fullname"] as? String
            RegistrationsManager.sharedManager.activeReservation.firphoneNumber = dictionary["phonenumber"] as? String
//                self.fbos.append(fbo)
            }
        })
    }
}
