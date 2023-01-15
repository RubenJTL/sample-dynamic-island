//
//  OrderStatusAttributes.swift
//  sample-dynamic-island
//
//  Created by Ruben Torres on 15/01/23.
//

import ActivityKit

struct OrderStatusAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var status: String
        var deliveryDriverName: String
        var arrivalTime: String
    }
}
