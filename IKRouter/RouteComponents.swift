//
//  RouteComponents.swift
//  IKRouter
//
//  Created by Ian Keen on 29/10/2015.
//  Copyright © 2015 Mustard. All rights reserved.
//

import Foundation

struct RouteComponents {
    let scheme: String
    let path: [String]
    let query: [String: String]
    
    init(url: NSURL) {
        self.init(url: url.absoluteString)
    }
    init(url: String) {
        let urlComponents = url.componentsSeparatedByString("://")
        self.scheme = urlComponents.first!
        
        var path = [String]()
        var query = [String: String]()
        
        if let pathComponents = urlComponents.last?.componentsSeparatedByString("?") {
            if let pathSegments = pathComponents.first?.componentsSeparatedByString("/") {
                path = pathSegments
            }
            
            if let queryPairs = pathComponents.last?.componentsSeparatedByString("&") where pathComponents.count > 1 {
                for pair in queryPairs {
                    let pairComponents = pair.componentsSeparatedByString("=")
                    query[pairComponents.first!] = pairComponents.last!
                }
            }
        }
        
        self.path = path
        self.query = query
    }
}