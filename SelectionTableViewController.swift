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
            print(dictionary)
            for (key, value) in dictionary {
             let codes = value.valueForKey("code") as! String
//            let fieldnames = value.valueForKey("fieldname") as! String
                let locations = value.valueForKey("location") as! String // This returns double lines
            
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
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
