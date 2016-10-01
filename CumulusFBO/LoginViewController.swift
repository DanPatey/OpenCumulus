//
//  LoginViewController.swift
//  CumulusFBO
//
//  Created by Courtney Osborne on 9/4/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.layer.opacity = 0.80
        startButton.titleLabel?.textColor = UIColor.whiteColor()
        
        // Email the FBO with desired information
        let session = NSURLSession.sharedSession()
        let request = NSMutableURLRequest(URL: NSURL(string: "https://api.mailgun.net/v3/mg.cumulusfbo.com/messages")!)
        request.HTTPMethod = "POST"
        let data = "from: Excited User <mailgun@mg.cumulusfbo.com>&to: [dan@cumulusfbo.com, dan@cumulusfbo.com]&subject:Hello&text:Testing some Mailgun awesomness!"
        request.HTTPBody = data.dataUsingEncoding(NSASCIIStringEncoding)
        request.setValue("key-a34392f25377924b8c692fad4518ed69", forHTTPHeaderField: "api")
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
}
