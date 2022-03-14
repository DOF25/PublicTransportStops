//
//  DetailPresenter.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 28.02.2022.
//

import UIKit

final class DetailPresenter: DetailViewOutput {

    private let networkManager: NetworkManager
    var stop: Stop!
    weak var view: (DetailViewInput & UIViewController)!

    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    //MARK: - DetailViewOutput
    func requestStopDetails() {
        let url = URLPrepare.prepareDetailURL(id: stop.id)
        networkManager.requestData(url: url){ [weak self] (result: Result<StopDetails, Error>) in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                print(error)
            case .success(let details):
                self.view.stopDetails = details
                DispatchQueue.main.async {
                    self.view.reloadData()
                }
            }
        }
    }
    func getStopName() -> String {
        return stop.name
    }
}
