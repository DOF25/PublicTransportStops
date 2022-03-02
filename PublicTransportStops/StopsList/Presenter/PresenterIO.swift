//
//  PresenterIO.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 27.02.2022.
//

import Foundation

protocol StopsListOutput: AnyObject {
    func requestStopsList()
    func didSelectStop(_ stop: Stop)
}
