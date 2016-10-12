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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        FIRAuth.auth()?.signInAnonymouslyWithCompletion() { (user, error) in
//            print("Successful login!: \(user?.uid)")
        }
        fetchAirport()
    }
    
    // MARK: JSON parsing
    // Grab the list of airports by stepping through JSON
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
    
    // This is failing because the values are read in FBOSelector before they are set here
    // Using the fieldname selected pass the rest of the information to FBOSelector
    func fetchFbos(fieldName: String) {
        let ref = FIRDatabase.database().reference().child("Airport/\(fieldName)/FBOs/Signature")
        
        ref.observeEventType(.Value, withBlock: { (snapshot) in
            //           print(snapshot)
            if let dictionary = snapshot.value as? [String: AnyObject] {
                RegistrationsManager.sharedManager.activeReservation.firll = dictionary["100ll"] as? String
                RegistrationsManager.sharedManager.activeReservation.firfreq = dictionary["freq"] as? String
                RegistrationsManager.sharedManager.activeReservation.firjeta = dictionary["jet-a"] as? String
                RegistrationsManager.sharedManager.activeReservation.firemail = dictionary["email"] as? String
                RegistrationsManager.sharedManager.activeReservation.firfullName = dictionary["fullname"] as? String
                // This will fire after the second 'nil' value in FBOSelector
                print("DELAYED SETTER")
                print(RegistrationsManager.sharedManager.activeReservation.firfullName)
                RegistrationsManager.sharedManager.activeReservation.firphoneNumber = dictionary["phonenumber"] as? String
            }
        })
    }
    
    // MARK: - Table view data source
    func numberOfSections(tableView: UITableView) -> Int {
        return 1
    }
    
    // Set the number of rows by number of locations parsed from JSON
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locations.count
    }
    
    // Fill our cells with locations
    override func tableView( tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = self.locations[indexPath.row]
        return cell
    }
    
    // MARK: - Send information to the FBOSelector
    // Send the fieldName the user selects
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! FBOSelectorViewController
        
        let path = tableView.indexPathForSelectedRow
        destination.fieldName = self.locations[(path?.row)!]
        
        self.fetchFbos(self.locations[(path?.row)!])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
