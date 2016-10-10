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
    
    var firstName: String? = ""
    var lastName: String? = ""
    var company: String? = ""
    var phoneNumber: String? = ""
    var email: String? = ""
    
    var antiIceStatus: String?
    var baggageCartStatus: String?
    var gpuCartStatus: String?
    var marshallerStatus: String?
    var lavatoryService: String?
    var cateringStatus: String?
    var rentalCarsStatus: String?
    var crewCarsStatus: String?
    
    @IBOutlet weak var checkMarkLabel: UILabel!
    
    //MARK: Price Labels
    @IBOutlet weak var antiIce: UILabel! {
        didSet {
            if RegistrationsManager.sharedManager.activeReservation.antiIce == true {
                //FBO int that gives the price for these services
                self.antiIce.text = "$10.00"
                return antiIceStatus = "Anti-icing"
            }
        }
    }
    @IBOutlet weak var baggageCartPrice: UILabel! {
        didSet {
            if RegistrationsManager.sharedManager.activeReservation.baggageCart == true {
                //FBO int that gives the price for these services
                self.baggageCartPrice.text = "$10.00"
                return baggageCartStatus = "A Baggage Cart"
            }
        }
    }
    
    @IBOutlet weak var gpuCartPrice: UILabel! {
        didSet {
            if RegistrationsManager.sharedManager.activeReservation.gpuCart == true {
                //FBO int that gives the price for these services
                self.gpuCartPrice.text = "$10.00"
                return gpuCartStatus = "A GPU Cart"
            }
        }
    }
    
    @IBOutlet weak var marshallerPrice: UILabel! {
        didSet {
            if RegistrationsManager.sharedManager.activeReservation.marshaller == true {
                //FBO int that gives the price for these services
                self.marshallerPrice.text = "$10.00"
                return marshallerStatus = "A Marshaller"
            }
        }
    }
    
    @IBOutlet weak var lavServicePrice: UILabel! {
        didSet {
            if RegistrationsManager.sharedManager.activeReservation.lavService == true {
                //FBO int that gives the price for these services
                self.lavServicePrice.text = "$10.00"
                return lavatoryService = "Lavatory Service"
            }
        }
    }
    
    @IBOutlet weak var cateringPrice: UILabel! {
        didSet {
            if RegistrationsManager.sharedManager.activeReservation.catering == true {
                //FBO int that gives the price for these services
                self.cateringPrice.text = "$10.00"
                return cateringStatus = "Catering"
            }
        }
    }
    
    @IBOutlet weak var rentalCarsPrice: UILabel! {
        didSet {
            if RegistrationsManager.sharedManager.activeReservation.rentals == "1" {
                //FBO int that gives the price for these services
                self.rentalCarsPrice.text = "$10.00"
                return rentalCarsStatus = "A Rental Car"
            }
        }
    }
    
    @IBOutlet weak var crewCarsPrice: UILabel! {
        didSet {
            if RegistrationsManager.sharedManager.activeReservation.crewCars == "1" {
                //FBO int that gives the price for these services
                self.crewCarsPrice.text = "$10.00"
                return crewCarsStatus = "A Crew Car"
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
        
        // MARK: Email template creation
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
            
            // Create email message body
            let beginningMessage = "You've received a new reservation from an FBOGo user!" + "<br><br>"
            let tailNumberMessage = "Tail Number: " + tailNumber! + "<br>"
            let aircraftTypeMessage = "Aircraft Type: " + aircraftType! + "<br>"
            let arrivalTimeMessge = "Is Arriving at: " + arrivalTime! + "<br>"
            
            // Create the required body text
            let emailMessage = (beginningMessage + tailNumberMessage + aircraftTypeMessage + arrivalTimeMessge)
            
            // Add optional personal info
            var personalInfoArray = [
                                     "First Name: " + RegistrationsManager.sharedManager.activeReservation.firstName!,
                                     "Last Name: " + RegistrationsManager.sharedManager.activeReservation.lastName!,
                                     "Company: " + RegistrationsManager.sharedManager.activeReservation.company!,
                                     "Phone Number: " + RegistrationsManager.sharedManager.activeReservation.phoneNumber!,
                                     "Email: " + RegistrationsManager.sharedManager.activeReservation.email!]
            // Filter out fields not used
            personalInfoArray = personalInfoArray.filter { $0.hasPrefix(": ") == false }
            print(personalInfoArray)
            
            // Combine used fields with a break for HTML formatting
            let personalInfo = personalInfoArray.flatMap{$0}.joinWithSeparator("<br>")
            print(personalInfo)
            
            // Add optional services requested
            let servicesMessage = "<br>Extra Services Requested: <br>"
            var servicesRequested = ""
            
            servicesRequested = [antiIceStatus, baggageCartStatus, gpuCartStatus, marshallerStatus, lavatoryService, cateringStatus, crewCarsStatus, rentalCarsStatus].flatMap{$0}.joinWithSeparator("<br>")
            
            // Add our footer message
            let footerMessage = "<br><br>" + "FBOGo available on iOS in the App Store today!"
            
            // Create a session and fill it with our request
            let session = NSURLSession.sharedSession()
            
            // If no services are requested, disregard all services messges from the email body
            var urlPath: String
            if servicesRequested != "" && personalInfo != "" {
                urlPath = mailgunAPIPath! + "from=FBOGo Reservation scheduler@mg.cumulusfbo.com&to=reservations@cumulusfbo.com&to=\(emailRecipient)&subject=A New Reservation!&html=\(emailMessage)\(personalInfo)\(servicesMessage)\(servicesRequested)\(footerMessage)"
            } else if servicesRequested != "" && personalInfo == "" {
                urlPath = mailgunAPIPath! + "from=FBOGo Reservation scheduler@mg.cumulusfbo.com&to=reservations@cumulusfbo.com&to=\(emailRecipient)&subject=A New Reservation!&html=\(emailMessage)\(servicesMessage)\(servicesRequested)\(footerMessage)"
            } else if servicesRequested == "" && personalInfo != "" {
                urlPath = mailgunAPIPath! + "from=FBOGo Reservation scheduler@mg.cumulusfbo.com&to=reservations@cumulusfbo.com&to=\(emailRecipient)&subject=A New Reservation!&html=\(emailMessage)\(personalInfo)\(footerMessage)"
            } else {
                urlPath = mailgunAPIPath! + "from=FBOGo Reservation scheduler@mg.cumulusfbo.com&to=reservations@cumulusfbo.com&to=\(emailRecipient)&subject=A New Reservation!&html=\(emailMessage)\(footerMessage)"
            }
            
            // Sanitize our URL
            let url = NSURL(string: urlPath.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!)
            // POST and report back with any errors and response codes
            let request: NSMutableURLRequest = NSMutableURLRequest(URL: url!)
            request.HTTPMethod = "POST"
            let task = session.dataTaskWithRequest(request, completionHandler: {(data, response, error) in
                // **DO NOT REMOVE** Session Debug info **TURN ON IF NEEDED**
//                if let error = error {
//                    print(error)
//                }
                
//                if let response = response {
//                    print("url = \(response.URL!)")
//                    print("response = \(response)")
//                    let httpResponse = response as! NSHTTPURLResponse
//                    print("response code = \(httpResponse.statusCode)")
//                }
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
