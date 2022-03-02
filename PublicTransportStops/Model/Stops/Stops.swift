//
//  Stops.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 27.02.2022.
//

import Foundation

struct ServerResponse: Decodable {
    let data: [Stop]
}

struct Stop: Decodable {
    let name: String
    let id: String
    let lat: Double
    let lon: Double
}
