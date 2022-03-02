//
//  MapController.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 28.02.2022.
//

import MapKit
import FloatingPanel

final class MapController: UIViewController, MapViewInput {

    private var mapView: MapView {
        return self.view as! MapView
    }
    var stop: Stop!

    var output: MapViewOutput!
    //MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        self.view = MapView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        showStop()
        showDetails()
    }
    //MARK: - MapViewInput
    func showStop() {
        self.mapView.map.showAnnotations([self.output.addPin()], animated: true)
    }
    func showDetails() {
        self.mapView.detailFloatingPanel.delegate = self
        self.mapView.detailFloatingPanel.set(contentViewController: self.output.createDetailController())
        self.mapView.detailFloatingPanel.addPanel(toParent: self)
    }
}
//MARK: - FloatingPanelControllerDelegate
extension MapController: FloatingPanelControllerDelegate {}
