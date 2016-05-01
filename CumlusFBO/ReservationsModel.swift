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
    var contact: String?
    var home_base: String?
    var operated_under: String?
    
    var departure_airport: String?
    var departure_date: String?
    var departure_time: String?
    
    var arrival_airport: String?
    var arrival_departure: String?
    var arrival_time: String?
    
    var aircraft_type: String?
    var tail_number: String?
    var fuel_type: FuelType?
    var fuel_units: FuelUnits?
    var passengers: Int?
    
    var departing_de_ice: Bool = false
    var departing_baggage_carts: Bool = false
    var departing_gpu_cart: Bool = false
    var departing_marshaller: Bool = false
    var departing_lavatory_service: Bool = false
    var departing_catering: Bool = false
    var departing_crew_cars: Bool = false
    var departing_rental_cars: Bool = false
    
    var arriving_de_ice: Bool = false
    var arriving_baggage_carts: Bool = false
    var arriving_gpu_cart: Bool = false
    var arriving_marshaller: Bool = false
    var arriving_lavatory_service: Bool = false
    var arriving_catering: Bool = false
    var arriving_crew_cars: Bool = false
    var arriving_rental_cars: Bool = false
}