//
//  DetailViewIO.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 28.02.2022.
//

import Foundation

protocol DetailViewInput: AnyObject {
    var stopDetails: StopDetails? { get set }
    func reloadData()
    func configureNameLabel()
}
