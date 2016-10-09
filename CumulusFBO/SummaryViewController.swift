//
//  SummaryViewController.swift
//  CumlusFBO
//
//  Created by Dan Patey on 3/29/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

let reservationStore = ReservationStore()
class SummaryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var checkMarkLabel: UILabel!
    
    //MARK: Price Labels
    @IBOutlet weak var antiIce: UILabel! {
        didSet {
            if RegistrationsManager.sharedManager.activeReservation.antiIce == true {
                //FBO int that gives the price for these services
                self.antiIce.text = "$10.00"
            }
        }
    }
    @IBOutlet weak var baggageCartPrice: UILabel! {
        didSet {
            if RegistrationsManager.sharedManager.activeReservation.baggageCart == true {
                //FBO int that gives the price for these services
                self.baggageCartPrice.text = "$10.00"
            }
        }
    }
    
    @IBOutlet weak var gpuCartPrice: UILabel! {
        didSet {
            if RegistrationsManager.sharedManager.activeReservation.gpuCart == true {
                //FBO int that gives the price for these services
                self.gpuCartPrice.text = "$10.00"
            }
        }
    }
    
    @IBOutlet weak var marshallerPrice: UILabel! {
        didSet {
            if RegistrationsManager.sharedManager.activeReservation.marshaller == true {
                //FBO int that gives the price for these services
                self.marshallerPrice.text = "$10.00"
            }
        }
    }
    
    @IBOutlet weak var lavServicePrice: UILabel! {
        didSet {
            if RegistrationsManager.sharedManager.activeReservation.lavService == true {
                //FBO int that gives the price for these services
                self.lavServicePrice.text = "$10.00"
            }
        }
    }
    
    @IBOutlet weak var cateringPrice: UILabel! {
        didSet {
            if RegistrationsManager.sharedManager.activeReservation.catering == true {
                //FBO int that gives the price for these services
                self.cateringPrice.text = "$10.00"
            }
        }
    }
    
    @IBOutlet weak var rentalCarsPrice: UILabel! {
        didSet {
            if RegistrationsManager.sharedManager.activeReservation.rentals == "1" {
                //FBO int that gives the price for these services
                self.rentalCarsPrice.text = "$10.00"
            }
        }
    }
    
    @IBOutlet weak var crewCarsPrice: UILabel! {
        didSet {
            if RegistrationsManager.sharedManager.activeReservation.crewCars == "1" {
                //FBO int that gives the price for these services
                self.crewCarsPrice.text = "$10.00"
            }
        }
    }
    
    @IBOutlet weak var fuelPrice: UILabel! {
        didSet {
        //FBO int that gives the price for these services
        self.fuelPrice.text = "$10.00"
        }
    }
    
    //MARK: Flight Information
    @IBOutlet weak var tailNumberLabel: UILabel! {
        didSet {
            self.tailNumberLabel.text = RegistrationsManager.sharedManager.activeReservation.tailNumber
        }
    }
    @IBOutlet weak var aircraftTypeLabel: UILabel! {
        didSet {
            self.aircraftTypeLabel.text = RegistrationsManager.sharedManager.activeReservation.aircraftType
        }
    }
    @IBOutlet weak var airportCodeLabel: UILabel! {
        didSet {
            self.airportCodeLabel.text = RegistrationsManager.sharedManager.activeReservation.airportCode
        }
    }
    @IBOutlet weak var arrivalTimeLabel: UILabel! {
        didSet {
            self.arrivalTimeLabel.text =  RegistrationsManager.sharedManager.activeReservation.arrivalTime
        }
    }
    @IBOutlet weak var departureTimeLabel: UILabel! {
        didSet {
            self.departureTimeLabel.text = RegistrationsManager.sharedManager.activeReservation.departureTime
        }
    }

    //MARK: Checkbox button that appears and disappear
    @IBAction func onsiteCheckBox(sender: UIButton) {
        if checkMarkLabel.hidden == false {
            checkMarkLabel.hidden = true
            
        } else {
            checkMarkLabel.hidden = false
            // Don't send user to payment option
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.delegate = self
        textField.resignFirstResponder()
        return true
    }
    
    //MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBarButtons()
    }
    
    //MARK: Far Right buttons on the navigation on the bar
    func navigationBarButtons() {
        let submitButton = UIBarButtonItem(title: "Submit", style: .Plain, target: self, action: #selector(SummaryViewController.submitButtonWithAlert))
        let image = UIImage(named: "Edit Button")
        let editButton = UIBarButtonItem(image: image, style: .Plain, target: self, action: #selector(SummaryViewController.editInformationButton))
        
        self.navigationItem.rightBarButtonItems = [submitButton, editButton]
    }
    
    // MARK: Save information to ReservationSends Notification information to cells in ScheduleViewController
    func submitButtonWithAlert() {
        NSNotificationCenter.defaultCenter().postNotificationName("summaryInformation", object: nil)
        let tailNumber = RegistrationsManager.sharedManager.activeReservation.tailNumber
        let aircraftType = RegistrationsManager.sharedManager.activeReservation.aircraftType
        let arrivalTime = RegistrationsManager.sharedManager.activeReservation.arrivalTime
        
        // Create the reservation in our internal schedule array
        reservationStore.createReservation(tailNumber!, aircraftType: aircraftType!, arrivalTime: arrivalTime!)
        
        // Email the FBO with desired information
        // Parse our Keys.plist so we can use our path
        var keys: NSDictionary?
        
        if let path = NSBundle.mainBundle().pathForResource("Keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        }
        
        if let dict = keys {
            // variablize our https path with API key, recipient and message text
            let mailgunAPIPath = dict["mailgunAPIPath"] as? String
            // TODO: fill this with FBO email address
            let emailRecipient = "bar@foo.com"
            let beginningMessage = "You've received a new reservation from an FBOGo user!" + "<br><br>"
            let tailNumberMessage = "Tail Number: " + tailNumber! + "<br>"
            let aircraftTypeMessage = "Aircraft Type: " + aircraftType! + "<br>"
            let arrivalTimeMessge = "Is Arriving at: " + arrivalTime! + "<br><br><br>"
            let footerMessage = "FBOGo available on iOS in the App Store today!"
            let emailMessage = (beginningMessage + tailNumberMessage + aircraftTypeMessage + arrivalTimeMessge + footerMessage)
            
            // create a session and fill it with our request
            let session = NSURLSession.sharedSession()
            let urlPath = mailgunAPIPath! + "from=FBOGo Reservation scheduler@mg.cumulusfbo.com&to=reservations@cumulusfbo.com&to=\(emailRecipient)&subject=A New Reservation!&html=\(emailMessage)"
            
            // Sanitize our URL
            let url = NSURL(string: urlPath.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!)
            // POST and report back with any errors and response codes
            let request: NSMutableURLRequest = NSMutableURLRequest(URL: url!)
            request.HTTPMethod = "POST"
            let task = session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
                if let error = error {
                    print(error)
                }
                
                if let response = response {
                    print("url = \(response.URL!)")
                    print("response = \(response)")
                    let httpResponse = response as! NSHTTPURLResponse
                    print("response code = \(httpResponse.statusCode)")
                }
            })
            task.resume()
        }
        
        // Display an alert letting the user information has been sent
        let alert = UIAlertController(title: "Thank You For Flying With Cumulus", message: "Flight information has been sent to the FBO", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.Cancel, handler: nil))
        // Present the AlertController
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func servicesPrices() {
    }
    
    func editInformationButton() {
        print("works")
    }
    
    func addItemsToSummary(textFields: [UITextField]) {
        for textfield in textFields {
            print(textfield)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }
}
