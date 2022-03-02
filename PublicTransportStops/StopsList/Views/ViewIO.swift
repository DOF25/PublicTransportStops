//
//  ViewIO.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 27.02.2022.
//

import Foundation

protocol StopsListInput: AnyObject {
    var stops: [Stop] {get set}
    func reloadData()
}
