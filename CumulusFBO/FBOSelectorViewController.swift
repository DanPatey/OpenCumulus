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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fboCollectionView.delegate = self
        fboCollectionView.dataSource = self
        fboCollectionView.pagingEnabled = true
        
        firebaseInfo()
    }
    
    // MARK: Setting labels
    func firebaseInfo() {
        self.fieldNameLabel.text = fieldName
        self.locationLabel.text = location
        self.codeLabel.text = code
    }
    
    // MARK: - UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }    
}
