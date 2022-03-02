//
//  DetailViewOutput.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 28.02.2022.
//

import Foundation

protocol DetailViewOutput: AnyObject {
    var stop: Stop! {get set}
    func requestStopDetails()
    func getStopName() -> String
}
