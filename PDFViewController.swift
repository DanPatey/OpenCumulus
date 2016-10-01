//
//  PDFViewController.swift
//  CumulusFBO
//
//  Created by Courtney Osborne on 9/14/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class PDFViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pdfButton(sender: UIButton) {
        
        // Get the document's file path.
        let path = NSBundle.mainBundle().pathForResource("sample2", ofType: "pdf")
        
        // Create an NSURL object based on the file path.
        let url = NSURL.fileURLWithPath(path!)
        
        // Create an NSURLRequest object.
        let request = NSURLRequest(URL: url)
        
        // Load the web viewer using the request object.
        webView.loadRequest(request)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
