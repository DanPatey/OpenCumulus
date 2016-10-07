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
    @IBOutlet weak var autoCompleteTextField: AutoCompleteTextField!
    
    var fbo = [FBOList]()
    var airports = [AirportsModel]()
    var selectedContact : [String : AnyObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FIRAuth.auth()?.signInAnonymouslyWithCompletion() { (user, error) in
            
            print("Successful login!: \(user?.uid)")
        }
    
        fboCollectionView.delegate = self
        fboCollectionView.dataSource = self
        fboCollectionView.pagingEnabled = true
        
        handleTextFieldInterfaces()
        fetchAirport()
        configureTextField()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     func configureTextField() {
        autoCompleteTextField.autoCompleteTextColor = UIColor(red: 128.0/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
        autoCompleteTextField.autoCompleteTextFont = UIFont(name: "HelveticaNeue-Light", size: 12.0)!
        autoCompleteTextField.autoCompleteCellHeight = 35.0
        autoCompleteTextField.maximumAutoCompleteCount = 20
        autoCompleteTextField.hidesWhenSelected = true
        autoCompleteTextField.hidesWhenEmpty = true
        autoCompleteTextField.enableAttributedText = true
        var attributes = [String:AnyObject]()
        attributes[NSForegroundColorAttributeName] = UIColor.blackColor()
        attributes[NSFontAttributeName] = UIFont(name: "HelveticaNeue-Bold", size: 12.0)
        autoCompleteTextField.autoCompleteAttributes = attributes
    }

    func handleTextFieldInterfaces() {
        
        let ref = FIRDatabase.database().reference().child("Airport")
            ref.observeEventType(.Value, withBlock: { (snapshot) in
                
        self.autoCompleteTextField.onTextChange = {[weak self] text in
            
             let stuff = [String]()
                if !text.isEmpty {
                    if let snaps = snapshot.value as? [String : AnyObject] {
                        for (key, _) in snaps {
                            // Needs to find out if the "text" is equal to the key characters
                            print(key) // Prints names of FBO's
                        }
                    }
                    dispatch_async(dispatch_get_main_queue(), {
                        self!.autoCompleteTextField.autoCompleteStrings = stuff
                    })
                }
            }
         
        })
        
        self.autoCompleteTextField.onSelect =  {[weak self] text, indexpath in
            self?.autoCompleteTextField.text = text
        }
    }

    // Firebase implementation to send FBOs to database
    func fetchAirport() {
        
        let ref = FIRDatabase.database().reference().child("Airport/Long Beach")
        
        ref.observeEventType(.Value, withBlock: { (snapshot) in
            
            let airport = AirportsModel()
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                airport.airportCode = dictionary["code"] as? String
                airport.location = dictionary["location"] as? String
                airport.fieldName = dictionary["fieldname"] as? String
                
                self.locationLabel.text = airport.location
                self.fieldNameLabel.text = airport.fieldName
                self.codeLabel.text = airport.airportCode
                self.airports.append(airport)
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.fboCollectionView.reloadData()
                })
            }
        })
    }
    
    @IBAction func leftArrowButton(sender: UIButton) {

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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
