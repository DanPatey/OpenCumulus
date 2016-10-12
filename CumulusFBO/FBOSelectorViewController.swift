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

    var fbo = [FBOList]()
    var fieldName : String!
    var airports = [AirportsModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FIRAuth.auth()?.signInAnonymouslyWithCompletion() { (user, error) in
//            print("Successful login!: \(user?.uid)")
        }
        fboCollectionView.delegate = self
        fboCollectionView.dataSource = self
        fboCollectionView.pagingEnabled = true
        
        firebaseInfo()
    }
    
    // MARK: Setting labels
    // Grab the information from SelectorTableView and place in the labels
    func firebaseInfo() {
        self.fieldNameLabel.text = fieldName
        self.locationLabel.text = RegistrationsManager.sharedManager.activeReservation.firfullName
    }
    
    var currentSelection = NSIndexPath()
    @IBAction func rightArrowButton(sender: UIButton) {
        if currentSelection == 0 {
            currentSelection = NSIndexPath(forRow: currentSelection.row+1, inSection: currentSelection.section)
        } else {
            currentSelection = NSIndexPath(forRow: 0, inSection: 0)
        }
        self.fboCollectionView.selectItemAtIndexPath(currentSelection, animated: true, scrollPosition: .Top)
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
        currentSelection = indexPath
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }    
}
