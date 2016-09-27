//
//  ScheduleViewController.swift
//  CumulusFBO
//
//  Created by Dan Patey on 7/9/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import UIKit

class ScheduleViewController: UITableViewController {
    
    var store: ReservationStore!
    var cell = ReservationCell()
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reservationStore.allReservations.count
    }
    
    //Information from SummaryViewController
    func summaryInformation(notification: NSNotification) {
        // This should add a tableviewcell to the tableView with the product that is added
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ScheduleViewController.summaryInformation), name: "summaryInformation", object: nil)
    }
    
    //MARK: UITableView Data Source
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ReservationCell", forIndexPath: indexPath) as! ReservationCell
        let reservation = reservationStore.allReservations[indexPath.row]
        
        cell.tailNumberLabel.text = reservation.tailNumber
        cell.aircraftTypeLabel.text = reservation.aircraftType
        cell.arrivalTimeLabel.text = reservation.arrivalTime
        cell.etaLabel.text = reservation.getEta()
        
        reservation.startTimerLabel(reservation)
                
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let reservation = reservationStore.allReservations[indexPath.row]
            
            let title = "Remove \(reservation.tailNumber) from schedule?"
            let message = "Are you sure you want to delete this item?"
            let ac = UIAlertController(title: title, message: message, preferredStyle: .ActionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            ac.addAction(cancelAction)
            let deleteAction = UIAlertAction(title: "Remove", style: .Destructive, handler: { (action) -> Void in
                reservationStore.removeReservation(reservation)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            })
            ac.addAction(deleteAction)
            
            presentViewController(ac, animated: true, completion: nil)
        }
    }
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barViewControllers = self.tabBarController?.viewControllers
        let svc = barViewControllers![1] as! ScheduleViewController
        svc.store = ReservationStore()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
        
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(updateEtaLabel), userInfo: nil, repeats: true)
        NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(checkNotifications), userInfo: nil, repeats: true)

    }
    
    override func viewWillAppear(animated: Bool) {
    }
    
    func updateEtaLabel() {
        self.tableView.reloadData()
    }
    
    //MARK: Fire UIAlertController

    func checkNotifications() {
        for i in 0 ..< reservationStore.allReservations.count {
            let currentETA = reservationStore.allReservations[i].eta
            
            if currentETA == "-30m" {
                planeLandingSoonAlert()
            } else if currentETA == "0s" {
                planeLandedAlert()
            }
        }
    }
    
    func planeLandingSoonAlert() {
        // Create the alert
        let alert = UIAlertController(title: "Aircraft 30 minutes out", message: "A reserved aircraft will be landing in 30 minutes", preferredStyle: .Alert)
        // Add the buttons
        alert.addAction(UIAlertAction(title: "Goto Reservation Details", style: UIAlertActionStyle.Default, handler: nil))
        alert.addAction(UIAlertAction(title: "Hide Alert", style: UIAlertActionStyle.Cancel, handler: nil))
        // Present the AlertController
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func planeLandedAlert() {
        // Create the alert
        let alert = UIAlertController(title: "Aircraft Landed", message: "A reserved aircraft has landed and is in taxi to your location", preferredStyle: .Alert)
        // Add the buttons
        alert.addAction(UIAlertAction(title: "Goto Reservation Details", style: UIAlertActionStyle.Default, handler: nil))
        alert.addAction(UIAlertAction(title: "Hide", style: UIAlertActionStyle.Cancel, handler: nil))
        // Present the AlertController
        presentViewController(alert, animated: true, completion: nil)
    }
}
