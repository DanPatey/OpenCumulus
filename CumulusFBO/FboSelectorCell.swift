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
    
    @IBOutlet weak var airportCodeLabel: UILabel!
    @IBOutlet weak var fieldNameLabel: UILabel!
    @IBOutlet weak var fboTableView: UITableView!
    var fbos = [FBOList]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fboTableView.delegate = self
        fboTableView.dataSource = self
        
        fetchFbos()
    }
        
    // Firebase implementation to send FBOs to database
    func fetchFbos() {
        
        let ref = FIRDatabase.database().reference().child("Destination").child("Airport").child("Long Beach").child("fbos").child("atlantic")
        
        ref.observeEventType(.ChildAdded, withBlock: { (snapshot) in
            print("\(snapshot)")
            let fbos = FBOList()
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                
                fbos.setValuesForKeysWithDictionary(dictionary)
                
                fbos.key = snapshot.key
                
                fbos.fboName = dictionary["code"] as? String
                fbos.fullName = dictionary["fullname"] as? String
                fbos.freq = dictionary["freq"] as? String
                fbos.phoneNumber = dictionary["phone number"] as? String
                fbos.ll = dictionary["100LL"] as? String
                
                
                self.fbos.append(fbos)
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.fboTableView.reloadData()
                })
            }
        })
    }
    
    
    // MARK: - Datasources
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fbos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let fbo = fbos[indexPath.row]
        
        cell.textLabel?.text = fbo.fullName
        
        return cell
    }
}
