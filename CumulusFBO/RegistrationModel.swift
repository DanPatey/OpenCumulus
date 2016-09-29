//
//  ReservationsModel.swift
//  CumlusFBO
//
//  Created by Dan Patey on 4/17/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import Foundation

class RegistrationsModel {
    //MARK: Registration Information
    var firstName: String?
    var lastName: String?
    var company: String?
    var phoneNumber: String?
    var email: String?
    
    //MARK: Flight Information
    var tailNumber: String?
    var aircraftType: String?
    var airportCode: String?
    var arrivalTime: String?
    var departureTime: String?
    
    //MARK: Services Information
    var antiIce = false
    var baggageCart = false
    var gpuCart = false
    var marshaller = false
    var lavService = false
    var catering = false
    var crewCars: String?
    var rentals: String?
    
    //MARK: Aggregate data for summary
    func generateSummary() -> String {
        let registrationInfo = "First Name: \(self.firstName ?? "")\nLast Name: \(self.lastName ?? "")\nCompany: \(self.company ?? "")\nPhone Number: \(self.phoneNumber ?? "")\nEmail: \(self.email ?? "")"
        let flightInfo = "\nTail Number: \(self.tailNumber ?? "")\nAircraft Type: \(self.aircraftType ?? "")\nAirport Code: \(self.airportCode ?? "")\nArrival Time: \(self.arrivalTime ?? "")\nDeparture Time: \(self.departureTime ?? "")"
        
        let services = "\nAnti Ice: \(self.antiIce)\nBaggage Cart: \(self.baggageCart)\nGPUCart: \(self.gpuCart)\nMarshaller: \(self.marshaller)\nLAV Service: \(self.lavService)\nCartering: \(self.catering)\nCrew Cars: \(self.crewCars ?? "")\nRentals: \(self.rentals ?? "")"
        
        return registrationInfo + flightInfo + services
    }
}
