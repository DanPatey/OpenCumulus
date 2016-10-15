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
    var code = [String]()
    var fieldname = [String]()
    var phoneNumber = [String]()
    var fullname = [String]()
    var ll = [String]()
    var freq = [String]()
    var jeta = [String]()
    
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
        
            for (key, value) in dictionary {

             let codes = value.valueForKey("code") as! String
                let locations = value.valueForKey("location") as! String // This returns double lines
                
                    self.fboInfo(key)
                    self.code.append(codes)
                    self.locations.append(key) //Doesn't match the database names
                    self.fieldname.append(locations) //Doesn't match the database names
                    dispatch_async(dispatch_get_main_queue(), {
                        self.tableView.reloadData()
                    })
                }
            }
        })
    }
    
    func fboInfo(key: String) {
        let ref = FIRDatabase.database().reference().child("Airport/\(key)/FBOs/")

        ref.observeEventType(.Value, withBlock: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {

                for (_, value) in dictionary {
                    print(value)
                    let phonenumber = value.valueForKey("phonenumber") as! String
                    let fullname = value.valueForKey("fullname") as! String
                    let jeta = value.valueForKey("jet-a") as! String
                    let ll = value.valueForKey("100ll") as! String
                    let freq = value.valueForKey("freq") as! String
                   
                    self.phoneNumber.append(phonenumber)
                    self.fullname.append(fullname)
                    self.freq.append(freq)
                    self.ll.append(ll)
                    self.jeta.append(jeta)
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
        cell.detailTextLabel?.text = self.code[indexPath.row]
        return cell
    }
    
    // MARK: - Send information to the FBOSelector
    // Send the fieldName the user selects
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! FBOSelectorViewController
        
        let path = tableView.indexPathForSelectedRow
        destination.location = self.locations[(path?.row)!]
        destination.code = self.code[(path?.row)!]
        destination.fieldName = self.fieldname[(path?.row)!]
        destination.firPhoneNumber = self.phoneNumber[(path?.row)!]
        destination.firFullname = self.fullname[(path?.row)!]
        destination.jeta = self.jeta[(path?.row)!]
        destination.frequency = self.freq[(path?.row)!]
        destination.ll = self.ll[(path?.row)!]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
