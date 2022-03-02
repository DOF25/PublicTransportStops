//
//  MapViewIO.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 28.02.2022.
//

import Foundation
import MapKit
import FloatingPanel

protocol MapViewOutput: AnyObject {
    func addPin() -> MKPointAnnotation
    func createDetailController() -> DetailController
}
