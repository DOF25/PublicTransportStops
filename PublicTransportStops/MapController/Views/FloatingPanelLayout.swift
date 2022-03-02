//
//  FloatingPanelLayout.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 01.03.2022.
//

import Foundation
import FloatingPanel

//MARK: - FloatingPanelLayout
final class DetailFloatingPanelLayout: FloatingPanelLayout {
    let position: FloatingPanelPosition = .bottom
    let initialState: FloatingPanelState = .tip
    var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
        return [
            .full: FloatingPanelLayoutAnchor(absoluteInset: 16.0, edge: .top, referenceGuide: .safeArea),
            .half: FloatingPanelLayoutAnchor(fractionalInset: 0.5, edge: .bottom, referenceGuide: .safeArea),
            .tip: FloatingPanelLayoutAnchor(absoluteInset: 57.0, edge: .bottom, referenceGuide: .safeArea),
        ]
    }
}
