//
//  PilotInformationModel.swift
//  CumulusFBO
//
//  Created by Courtney Osborne on 10/26/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import Foundation

class PilotInformationModel: NSObject {
    
    var firstName: String!
    var lastName: String!
    var company: String!
    var phoneNumber: String!
    var tailNumber: String!
    var aircraftType: String!
    var homeAirport: String!

func generateSummary() -> String {
    let pilotInfo = "First Name: \(self.firstName ?? "")\nLast Name: \(self.lastName ?? "")\nCompany: \(self.company ?? "")\nPhone Number: \(self.phoneNumber ?? "")\nTail Number: \(self.tailNumber ?? "")\nAircraftType: \(self.aircraftType ?? "")\nHome Airport: \(self.homeAirport ?? "")"
    
    return pilotInfo
    }
}

