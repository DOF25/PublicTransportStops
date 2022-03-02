//
//  Builder.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 27.02.2022.
//

import UIKit

final class Builder {

    static func buildStopsList() -> UINavigationController {
        let view = StopsList()
        let navVC = UINavigationController(rootViewController: view)
        let presenter = StopsListPresenter(networkManager: NetworkManager())
        view.output = presenter
        presenter.view = view
        return navVC
    }
    static func buildMapController(_ stop: Stop) -> MapController {
        let view = MapController()
        let presenter = MapViewPresenter()
        view.stop = stop
        view.output = presenter
        presenter.view = view
        return view
    }
    static func buildDetailController(_ stop: Stop) -> DetailController {
        let detailController = DetailController()
        let presenter = DetailPresenter(networkManager: NetworkManager())
        detailController.output = presenter
        presenter.view = detailController
        presenter.stop = stop
        return detailController
    }
}
