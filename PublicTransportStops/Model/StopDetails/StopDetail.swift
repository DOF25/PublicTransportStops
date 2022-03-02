//
//  StopDetail.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 28.02.2022.
//

import Foundation

struct StopDetails: Decodable {
    let name: String
    let routePath: [RoutePath]
}
struct RoutePath: Decodable {
    let type: String
    let number: String
    let timeArrival: [String]
}


