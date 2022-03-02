//
//  MapViewIO.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 28.02.2022.
//

import Foundation
import MapKit

protocol MapViewInput: AnyObject {
    var stop: Stop! {get set}
    func showStop()
    func showDetails()
}
