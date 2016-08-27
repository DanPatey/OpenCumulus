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
        let alert = UIAlertController(title: "A Reservation", message: "is landing in 30 minutes", preferredStyle: .Alert)
        // Add the buttons
        alert.addAction(UIAlertAction(title: "Take me to the reservation details", style: UIAlertActionStyle.Default, handler: nil))
        alert.addAction(UIAlertAction(title: "Hide", style: UIAlertActionStyle.Cancel, handler: nil))
        // Present the AlertController
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func planeLandedAlert() {
        // Create the alert
        let alert = UIAlertController(title: "A Reservation", message: "has just landed", preferredStyle: .Alert)
        // Add the buttons
        alert.addAction(UIAlertAction(title: "Take me to the reservation details", style: UIAlertActionStyle.Default, handler: nil))
        alert.addAction(UIAlertAction(title: "Hide", style: UIAlertActionStyle.Cancel, handler: nil))
        // Present the AlertController
        presentViewController(alert, animated: true, completion: nil)
    }
}