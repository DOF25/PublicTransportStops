//
//  MapView.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 28.02.2022.
//

import MapKit
import FloatingPanel

final class MapView: UIView {
    //MARK: - Properties
    let map: MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    let detailFloatingPanel: FloatingPanelController = {
        let floatingPanelController = FloatingPanelController()
        floatingPanelController.contentMode = .fitToBounds
        floatingPanelController.layout = DetailFloatingPanelLayout()
        return floatingPanelController
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Private Methods
    private func setConstraints() {
        self.addSubview(map)
        let safeArea = self.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            self.map.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.map.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.map.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.map.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
    }
}

