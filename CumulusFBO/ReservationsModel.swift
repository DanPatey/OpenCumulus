//
//  ReservationsModel.swift
//  CumlusFBO
//
//  Created by Dan Patey on 4/17/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import Foundation

class ReservationsModel {

    enum FuelType: String {
        case LL = "100LL"
        case Jet = "Jet A"
    }
    
    enum FuelUnits: String {
        case Gallons = "Gallons"
        case Pounds = "Pounds"
    }
    
    var name: String?
    var primaryContact: String?
    var homeBase: String?
    var operatedUnder: String?
    
    var departureAirport: String?
    var departureDate: String?
    var departureTime: String?
    
    var arrivalAirport: String?
    var arrivalDate: String?
    var arrivalTime: String?
    
    var aircraftType: String?
    var tailNumber: String?
    var fuelType: FuelType?
    var fuelUnits: FuelUnits?
    var passengers: Int?
    
    var departingDeIce: Bool = false
    var departingBaggageCarts: Bool = false
    var departingGPUCarts: Bool = false
    var departingMarshalling: Bool = false
    var departingLavatoryService: Bool = false
    var departingCatering: Bool = false
    var departingCrewCar: Bool = false
    var departingCarRental: Bool = false
    var departingHotel: Bool = false
    
    var arrivingDeIce: Bool = false
    var arrivingBaggageCarts: Bool = false
    var arrivingGPUCarts: Bool = false
    var arrivingMarshalling: Bool = false
    var arrivingLavatoryService: Bool = false
    var arrivingCatering: Bool = false
    var arrivingCrewCar: Bool = false
    var arrivingCarRental: Bool = false
    var arrivingHotel: Bool = false
    

    // aircraftInfo is giving me problems because it's too complex
    // trying to break these up, fuel units is giving me issues because it's not unwrapped
    func departureSummary() -> String {
        let registrationInfo = "Name: \(self.name ?? "")\nPrimary Contact: \(primaryContact ?? "")\nHome Base: \(self.homeBase ?? "")\nOperated Under: \(self.operatedUnder ?? "")"
        let departureInfo = "\nDeparture Airport: \(self.departureAirport ?? "")\nDeparture Date: \(self.departureDate ?? "")\nDeparture Time: \(self.departureTime ?? "")"
        let aircraftInfo = "\nAircraft Type: \(self.aircraftType ?? "")\nTail Number: \(self.tailNumber ?? "")"
//        let passengersInfo = "\n Passengers: \(self.passengers ?? "")"
//        let fuelInfo = "\nFuel Type: \(self.fuelType ? self.fuelType.rawValue : "")\nFuel Units: \(self.fuelUnits ? self.fuelUnits.rawValue : "")"
        return registrationInfo + departureInfo + aircraftInfo
    }
    
    func arrivalSummary() -> String {
        let registrationInfo = "Name: \(self.name ?? "")\nPrimary Contact: \(primaryContact ?? "")\nHome Base: \(self.homeBase ?? "")\nOperated Under: \(self.operatedUnder ?? "")"
        let arrivalInfo = "\nArrival Airport: \(self.arrivalAirport ?? "")\nArrival Date: \(self.arrivalDate ?? "")\nArrival Time: \(self.arrivalTime ?? "")"
        let aircraftInfo = "\nAircraft Type: \(self.aircraftType ?? "")\nTail Number: \(self.tailNumber ?? "")"
//        let passengersInfo = "\n Passengers: \(self.passengers ?? "")"
//        let fuelInfo = "\nFuel Type: \(self.fuelType ? self.fuelType.rawValue : "")\nFuel Units: \(self.fuelUnits ? self.fuelUnits.rawValue : "")"
        return registrationInfo + arrivalInfo + aircraftInfo
    }
}