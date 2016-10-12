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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    // Thought this might be a good way to set variables sooner than in the segue 
    // I am able to override fetchFbos() with these even though it's called in the segue
    // Verified by reading the output of fullfieldname in FBOSelector
    
    // When the user selects a cell, fill the array with information from that cell
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }

    // MARK: - Send information to the FBOSelector
    // Send the fieldName the user selects
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! FBOSelectorViewController
        
        let path = tableView.indexPathForSelectedRow
        destination.fieldName = self.locations[(path?.row)!]
        
        self.fetchFbos(self.locations[(path?.row)!])
    }
    
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
            RegistrationsManager.sharedManager.activeReservation.firphoneNumber = dictionary["phonenumber"] as? String
            }
        })
    }
}
