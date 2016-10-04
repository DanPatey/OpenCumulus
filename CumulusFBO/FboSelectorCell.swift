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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        fboTableView.delegate = self
        fboTableView.dataSource = self
        

        fetchFbos()
    }
    
    // Firebase implementation to send FBOs to database
    func fetchFbos() {
        
        let ref = FIRDatabase.database().reference().child("Airport/Long Beach/FBOs/Atlantic")
        
        ref.observeEventType(.Value, withBlock: { (snapshot) in
            
            let fbo = FBOList()
            if let dictionary = snapshot.value as? [String: AnyObject] {
                fbo.key = snapshot.key
                
                fbo.fboName = dictionary["code"] as? String
                fbo.fullName = dictionary["fullname"] as? String
                fbo.freq = dictionary["freq"] as? String
                fbo.phoneNumber = dictionary["phone number"] as? String
                fbo.ll = dictionary["100LL"] as? String
                
                self.fullNameLabel.text = fbo.fullName
                self.phoneNumberLabel.text = fbo.phoneNumber
                
                self.fbos.append(fbo)
                
                
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
        return fboServices.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cells", forIndexPath: indexPath)
        
        cell.textLabel?.text = self.fboServices[indexPath.row]
//        cell.detailTextLabel?.text = self.fboItems[indexPath.row]
        return cell
    }
    
    func details(string: String) {
    
    }
}
