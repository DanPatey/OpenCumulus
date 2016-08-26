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
        
        cell.startTimerLabel()
        let reservation = reservationStore.allReservations[indexPath.row]
        
        cell.tailNumberLabel.text = reservation.tailNumber
        cell.aircraftTypeLabel.text = reservation.aircraftType
        cell.arrivalTimeLabel.text = reservation.arrivalTime
        cell.etaLabel.text = reservation.arrivalTime
        
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
        
//        store.retrieveInFlightInfo()     // Testing FlightAware API
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
        
    override func viewWillAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    func pilotAlert() {
        // Fire UIAlertController
        let alertController = UIAlertController(title: "landing in...", message: "landing soon", preferredStyle: .Alert)
        let alertAction = UIAlertAction(title: "Ok", style: .Default) { (action) in
            print("action")
        }
        alertController.addAction(alertAction)
        
        // Present the AlertController
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}