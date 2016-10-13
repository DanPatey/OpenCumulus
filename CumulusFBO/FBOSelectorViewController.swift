//
//  FBOSelectorViewController.swift
//  CumulusFBO
//
//  Created by Courtney Osborne on 9/5/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit
import Firebase

class FBOSelectorViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var fieldNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel! 
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var fboCollectionView: UICollectionView!

    var fieldName : String!
    var location: String!
    var code : String!
    var firbaseName = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fboCollectionView.delegate = self
        fboCollectionView.dataSource = self
        fboCollectionView.pagingEnabled = true
        
        self.fieldNameLabel.text = fieldName
        self.locationLabel.text = location
        self.codeLabel.text = code
        
        fetchInfo()
    }
    
    // Firebase implementation to send FBOs to database
    // This is failing because the values are read in FBOSelector before they are set here
    // Using the fieldname selected pass the rest of the information to FBOSelector
    func fetchInfo() {
        
        let ref = FIRDatabase.database().reference().child("Airport")
        
        ref.observeEventType(.Value, withBlock: { (snapshot) in
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                
                for (key, _) in dictionary {
                    
                    self.firbaseName.append(key)

                    dispatch_async(dispatch_get_main_queue(), {
                        self.fboCollectionView.reloadData()
                    })
                }
            }
        })
    }
    
    // MARK: - UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print(firbaseName.count)
        return firbaseName.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! FboSelectorCell
        
        cell.fullNameLabel.text = self.firbaseName[indexPath.row]
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }    
}
