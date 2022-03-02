//
//  NetworkManager.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 27.02.2022.
//

import Foundation

final class NetworkManager {

    private let decoder = JSONDecoder()

    public func requestStopsList(completion: @escaping(Result<[Stop], Error>) -> Void) {

        guard let url = URL(string: "https://api.mosgorpass.ru/v8.2/stop") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else {
                completion(.success([]))
                return
            }
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                print(json)
                let result = try self.decoder.decode(ServerResponse.self, from: data)
                let stops = result.data
                completion(.success(stops))
            } catch {
                print(error)
            }
        }.resume()
    }
    public func requestDetail(for id: String, completion: @escaping(Result<StopDetails, Error>) -> Void) {

        guard let url = URL(string: "https://api.mosgorpass.ru/v8.2/stop/\(id)") else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else { return }
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else { return }
            do {
                let result = try self.decoder.decode(StopDetails.self, from: data)
                completion(.success(result))
            } catch {
                print(error)
            }
        }.resume()
    }
}
