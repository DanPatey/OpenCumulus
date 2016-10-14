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
    var kjl = ["0.1","23","32"]
    var fboItems = [String]()
    var fieldname = [String]()
    var keys = String()
    var jeta = [String]()
    var ll = [String]()
    var freq = [String]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fboTableView.delegate = self
        fboTableView.dataSource = self
        fetchInfo()
    }
    
    func fetchInfo() {
        
        let ref = FIRDatabase.database().reference().child("Airport")
        
        ref.observeEventType(.Value, withBlock: { (snapshot) in
            print(snapshot)
            if let dictionary = snapshot.value as? [String: AnyObject] {
                
                for (key, _) in dictionary {
                    
                    self.fetchFbos(key)
                    self.keys = key
                    dispatch_async(dispatch_get_main_queue(), {
                        self.fboTableView.reloadData()
                    })
                }
            }
        })
    }
    
    func fetchFbos(key: String) {
        
        let ref = FIRDatabase.database().reference().child("Airport/\(key)/FBOs")
        
        ref.observeEventType(.Value, withBlock: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                
            for (_, value) in dictionary {
                
                let jeta = value.valueForKey("jet-a") as! String
                let ll = value.valueForKey("100ll") as! String
                let freq = value.valueForKey("freq") as! String
                self.jeta.append(jeta)
                self.ll.append(ll)
                self.freq.append(freq)
                }
            }
        })
    }
   
    func cellstuff() {
        let ref = FIRDatabase.database().reference().child("Airport/\(self.keys)FBOs/Signature")
        ref.observeEventType(.Value, withBlock: { (snapshot) in
            if let dictionary = snapshot.value as? [String: AnyObject] {
                
                for (key, value) in dictionary {
                    print(key)
                    print(value)
                }
            }
        })
    }
    
    // MARK: - Datasources
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fboServices.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cells", forIndexPath: indexPath)
        
        cell.textLabel?.text = self.fboServices[indexPath.row]
        cell.detailTextLabel?.text = "dd"//self.kjl[indexPath.row]
        return cell
    }
    
}
