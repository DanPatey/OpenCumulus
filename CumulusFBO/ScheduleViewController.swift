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
    
    let removeRegistrationInfo = RegistrationViewController()
    let removeFlightInfo = FlightInformationViewController()
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reservationStore.allReservations.count
    }
    
    //MARK: UITableView Data Source
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ReservationCell", forIndexPath: indexPath) as! ReservationCell
        cell.updateLabels()
        
        let reservation = reservationStore.allReservations[indexPath.row]
        
        cell.tailNumberLabel.text = reservation.tailNumber
        cell.aircraftTypeLabel.text = reservation.aircraftType
        cell.arrivalTimeLabel.text = reservation.arrivalTime
        cell.etaLabel.text = RegistrationsManager.sharedManager.activeReservation.arrivalTime
        
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
                
        removeFlightInfo.tailNumber.clearsOnInsertion = true
        removeFlightInfo.aircraftType.clearsOnInsertion = true
        removeFlightInfo.airportCode.clearsOnInsertion = true
        removeFlightInfo.departureTime.clearsOnInsertion = true
        removeFlightInfo.arrivalTime.clearsOnInsertion = true
        
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
}