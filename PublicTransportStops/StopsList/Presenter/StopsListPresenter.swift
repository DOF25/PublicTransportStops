//
//  StopsListPresetner.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 27.02.2022.
//

import UIKit

final class StopsListPresenter: StopsListOutput {

    weak var view: (StopsListInput & UIViewController)!
    let networkManager: NetworkManager

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }

    //MARK: - StopsListOutput
    func requestStopsList() {
        let url = URLPrepare.prepareStopListURL()
        self.networkManager.requestData(url: url) { [weak self] (result: Result<ServerResponse, Error>) in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                print(error)
            case .success(let response):
                self.view.stops = response.data
                DispatchQueue.main.async {
                    self.view.reloadData()
                }
            }
        }
    }

    func didSelectStop(_ stop: Stop) {
        let MapVC = Builder.buildMapController(stop)
        self.view.navigationController?.pushViewController(MapVC, animated: true)
    }
}
