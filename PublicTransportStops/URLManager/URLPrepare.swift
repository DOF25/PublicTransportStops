//
//  URLPrepare.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 14.03.2022.
//

import Foundation

enum URLPrepare: String {

    case stopList = "https://api.mosgorpass.ru/v8.2/stop"

    static func prepareStopListURL() -> URL? {
        let url = URL(string: stopList.rawValue)
        return url
    }
    static func prepareDetailURL(id: String) -> URL? {
        let url = URL(string: "https://api.mosgorpass.ru/v8.2/stop/\(id)")
        return url
    }
}
