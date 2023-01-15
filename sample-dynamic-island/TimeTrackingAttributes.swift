//
//  TimeTrackingAttributes.swift
//  sample-dynamic-island
//
//  Created by Ruben Torres on 15/01/23.
//

import ActivityKit
import Foundation

struct TimeTrackingAttributes: ActivityAttributes {
    public typealias TimeTrackingStatus = ContentState
    
    public struct ContentState: Codable, Hashable {
        var startTime: Date
        
    }
}
