//
//  FlightAwareAPI.swift
//  CumulusFBO
//
//  Created by Dan Patey on 7/15/16.
//  Copyright © 2016 Dan Patey. All rights reserved.
//

import Foundation

enum Method: String {
    case InFlightInfo = "InFlightInfo?ident=AAL1726"
}

struct FlightAwareAPI {
    static let baseURLString = "https://danpatey:267d3e98c57a47c3b35dce1b17ce649da42ae225@flightxml.flightaware.com/json/FlightXML2"
    private static let username = "danpatey"
    private static let apiKey = "267d3e98c57a47c3b35dce1b17ce649da42ae225"
    
    private static func flightAwareURL(method method: Method, parameters: [String:String]?) -> NSURL {
        let components = NSURLComponents(string: baseURLString)!
        var queryItems = [NSURLQueryItem]()
        
        let baseParams = ["method": method.rawValue, "format": "json", "nojsoncallback": "1", "api_key": apiKey]
        
        for (key, value) in baseParams {
            let item = NSURLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParams = parameters {
            for (key, value) in additionalParams {
                let item = NSURLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        components.queryItems = queryItems
        
        return components.URL!
    }
    
    static func inFlightInfoURL() -> NSURL {
        return flightAwareURL(method: .InFlightInfo, parameters: ["extras": "url_h,date_taken"])
    }
}