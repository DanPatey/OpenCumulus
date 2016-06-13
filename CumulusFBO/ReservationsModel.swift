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
    var fuelType: String?
    var fuelUnits: String?
    var passengers: String?
    
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
    
    
    func arrivalSummary() -> String {
        let registrationInfo = "Name: \(self.name ?? "")\nPrimary Contact: \(primaryContact ?? "")\nHome Base: \(self.homeBase ?? "")\nOperated Under: \(self.operatedUnder ?? "")"
        let arrivalInfo = "\nArrival Airport: \(self.arrivalAirport ?? "")\nArrival Date: \(self.arrivalDate ?? "")\nArrival Time: \(self.arrivalTime ?? "")"
        let aircraftInfo = "\nAircraft Type: \(self.aircraftType ?? "")\nTail Number: \(self.tailNumber ?? "")"
        let passengersInfo = "\nPassengers: \(self.passengers ?? "")"
        let fuelInfo = "\nFuel Type: \(self.fuelType ?? "")\nFuel Units: \(self.fuelUnits ?? "")"
        return registrationInfo + arrivalInfo + aircraftInfo + passengersInfo + fuelInfo
    }
    
    func arrivalServicesSummary() -> String {
        let arrivingDeIceString: String
        let arrivingBaggageCartsString: String
        let arrivingGPUCartsString: String
        let arrivingMarshallingString: String
        let arrivingLavatoryServiceString: String
        let arrivingCateringString: String
        let arrivingCrewCarString: String
        let arrivingHotelString: String
            
        if arrivingDeIce == true {
            let arrivingDeIceString = "\nDeIcing: Yes"
            return arrivingDeIceString
        } else if arrivingDeIce == false {
            let arrivingDeIceString = "\nDeIcing: No"
            return arrivingDeIceString
        }
    
        if arrivingBaggageCarts == true {
            let arrivingBaggageCartsString = "\nBaggage Cart: Yes"
            return arrivingBaggageCartsString
        } else {
            let arrivingBaggageCartsString = "\nBaggage Cart: No"
            return arrivingBaggageCartsString
        }
            
        if arrivingGPUCarts == true {
            let arrivingGPUCartsString = "\nGPU Cart: Yes"
            return arrivingGPUCartsString
        } else {
            let arrivingGPUCartsString = "\nGPU Cart: No"
            return arrivingGPUCartsString
        }
            
        if arrivingMarshalling == true {
            let arrivingMarshallingString = "\nMarshalling: Yes"
            return arrivingMarshallingString
        } else {
            let arrivingMarshallingString = "\nMarshalling: No"
            return arrivingMarshallingString
        }
            
        if arrivingLavatoryService == true {
            let arrivingLavatoryServiceString = "\nLavatory Service: Yes"
            return arrivingLavatoryServiceString
        } else {
            let arrivingLavatoryServiceString = "\nLavatory Service: No"
            return arrivingLavatoryServiceString
        }
            
        if departingCatering == true {
            let arrivingCateringString = "\nCatering: Yes"
            return arrivingCateringString
        } else {
            let arrivingCateringString = "\nCatering: No"
            return arrivingCateringString
        }
            
        if departingCrewCar == true {
            let arrivingCrewCarString = "\nCrew Car: Yes"
            return arrivingCrewCarString
        } else {
            let arrivingCrewCarString = "\nCrew Car: No"
            return arrivingCrewCarString
        }
            
        if departingHotel == true {
            let arrivingHotelString = "\nHotel: Yes"
            return arrivingHotelString
        } else {
            let arrivingHotelString = "\nHotel: No"
            return arrivingHotelString
        }
            
        return arrivingDeIceString + arrivingBaggageCartsString + arrivingGPUCartsString + arrivingMarshallingString + arrivingLavatoryServiceString + arrivingCateringString + arrivingCrewCarString + arrivingHotelString
    }
    
    func departureSummary() -> String {
        let registrationInfo = "Name: \(self.name ?? "")\nPrimary Contact: \(primaryContact ?? "")\nHome Base: \(self.homeBase ?? "")\nOperated Under: \(self.operatedUnder ?? "")"
        let departureInfo = "\nDeparture Airport: \(self.departureAirport ?? "")\nDeparture Date: \(self.departureDate ?? "")\nDeparture Time: \(self.departureTime ?? "")"
        let aircraftInfo = "\nAircraft Type: \(self.aircraftType ?? "")\nTail Number: \(self.tailNumber ?? "")"
        let passengersInfo = "\nPassengers: \(self.passengers ?? "")"
        let fuelInfo = "\nFuel Type: \(self.fuelType ?? "")\nFuel Units: \(self.fuelUnits ?? "")"
        return registrationInfo + departureInfo + aircraftInfo + passengersInfo + fuelInfo
    }
    
    func departureServicesSummary() -> String {
        
        let departingDeIceString: String
        let departingBaggageCartsString: String
        let departingGPUCartsString: String
        let departingMarshallingString: String
        let departingLavatoryServiceString: String
        let departingCateringString: String
        let departingCrewCarString: String
        let departingHotelString: String
        
        if departingDeIce == true {
            let departingDeIceString = "\nDeIcing: Yes"
            return departingDeIceString
        } else if departingDeIce == false {
            let departingDeIceString = "\nDeIcing: No"
            return departingDeIceString
        } else {
            let departingDeIceString = "\nDeIcing: No"
            return departingDeIceString
        }
        
        if departingBaggageCarts == true {
            let departingBaggageCartsString = "\nBaggage Cart: Yes"
            return departingBaggageCartsString
        } else if departingBaggageCarts == false {
            let departingBaggageCartsString = "\nBaggage Cart: No"
            return departingBaggageCartsString
        }
        
        if departingGPUCarts == true {
            let departingGPUCartsString = "\nGPU Cart: Yes"
            return departingGPUCartsString
        } else if departingGPUCarts == false {
            let departingGPUCartsString = "\nGPU Cart: No"
            return departingGPUCartsString
        }
        
        if departingMarshalling == true {
            let departingMarshallingString = "\nMarshalling: Yes"
            return departingMarshallingString
        } else if departingMarshalling == false {
            let departingMarshallingString = "\nMarshalling: No"
            return departingMarshallingString
        }
        
        if departingLavatoryService == true {
            let departingLavatoryServiceString = "\nLavatory Service: Yes"
            return departingLavatoryServiceString
        } else if departingLavatoryService == false {
            let departingLavatoryServiceString = "\nLavatory Service: No"
            return departingLavatoryServiceString
        }
        
        if departingCatering == true {
            let departingCateringString = "\nCatering: Yes"
            return departingCateringString
        } else if departingCatering == false {
            let departingCateringString = "\nCatering: No"
            return departingCateringString
        }
        
        if departingCrewCar == true {
            let departingCrewCarString = "\nCrew Car: Yes"
            return departingCrewCarString
        } else if departingCrewCar == false {
            let departingCrewCarString = "\nCrew Car: No"
            return departingCrewCarString
        }
        
        if departingHotel == true {
            let departingHotelString = "\nHotel: Yes"
            return departingHotelString
        } else if departingHotel == false {
            let departingHotelString = "\nHotel: No"
            return departingHotelString
        }
        
        return departingDeIceString + departingBaggageCartsString + departingGPUCartsString + departingMarshallingString + departingLavatoryServiceString + departingCateringString + departingCrewCarString + departingHotelString
    }
}