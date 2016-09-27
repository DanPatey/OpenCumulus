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

    @IBOutlet weak var fboCollectionView: UICollectionView!
    
    @IBOutlet weak var autoCompleteTextField: AutoCompleteTextField!
    var fbos = [FBOList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FIRAuth.auth()?.signInAnonymouslyWithCompletion() { (user, error) in
            
            print("Successful login!: \(user?.uid)")
        }
    
        fboCollectionView.delegate = self
        fboCollectionView.dataSource = self
        fboCollectionView.pagingEnabled = true
        
        handleTextFieldInterfaces()
        fetchFbos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Firebase implementation to send FBOs to database
    func fetchFbos() {
            
        let ref = FIRDatabase.database().reference().child("Fbos")
        
        ref.observeEventType(.ChildAdded, withBlock: { (snapshot) in
            print(">>>>>>>>>>>>>>>>>>>>>>>\(snapshot)")
            let fbos = FBOList()
            
            if let dictionary = snapshot.value as? [String: AnyObject] {
                
                fbos.setValuesForKeysWithDictionary(dictionary)
                
                fbos.key = snapshot.key
                
                fbos.fboName = dictionary["Longbeach"] as? String
                
                self.fbos.append(fbos)
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.fboCollectionView.reloadData()
                })
            }
        })

    }
    
    // AutoComplete textfield
    private func handleTextFieldInterfaces(){
        autoCompleteTextField.onTextChange = { text in
            if !text.isEmpty{
              print(text)
            }
        }
        
        autoCompleteTextField.onSelect = {text, indexpath in
            print(text)
        }
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
