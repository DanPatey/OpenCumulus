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
            
            print("Successful login!: \(user?.uid)")
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
           
            let fbo = FBOList()
            if let dictionary = snapshot.value as? [String: AnyObject] {
//                fbo.key = snapshot.key
                
                fbo.ll = dictionary["100ll"] as? String
                fbo.email = dictionary["email"] as? String
                fbo.fullName = dictionary["fullname"] as? String
                fbo.freq = dictionary["freq"] as? String
                fbo.phonenumber = dictionary["phonenumber"] as? String
                fbo.jeta = dictionary["jet-a"] as? String
                
                self.fbos.append(fbo)
               print("FBO: \(self.fbos)")
                
            }
        })
    }
}

