//
//  MapViewPresenter.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 28.02.2022.
//

import MapKit
import UIKit
import FloatingPanel

final class MapViewPresenter: MapViewOutput {

    weak var view: (MapViewInput & UIViewController)!

    //MARK: - MapViewOutput
    func addPin() -> MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: self.view.stop.lat, longitude: self.view.stop.lon)
        return annotation
    }
    func createDetailController() -> DetailController {
        Builder.buildDetailController(self.view.stop)
    }
}
