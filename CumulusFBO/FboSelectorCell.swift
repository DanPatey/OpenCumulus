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
        
        let ref = FIRDatabase.database().reference().child("Airport/Long Beach/FBOs/Atlantic")
        
        ref.observeEventType(.Value, withBlock: { (snapshot) in
            print(">>\(snapshot)")
            
            let fbo = FBOList()
            if let dictionary = snapshot.value as? [String: AnyObject] {
                fbo.key = snapshot.key
                
                fbo.fboName = dictionary["code"] as? String
                fbo.fullName = dictionary["fullname"] as? String
                fbo.freq = dictionary["freq"] as? String
                fbo.phoneNumber = dictionary["phone number"] as? String
                fbo.ll = dictionary["100LL"] as? String
                
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
        return fbos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cells", forIndexPath: indexPath)
        
        let fbo = fbos[indexPath.row]
        print("Fbo: \(fbo.ll)")
        
        cell.textLabel?.text = fbo.ll
        
        return cell
    }
    
}
