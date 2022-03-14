//
//  NetworkManager.swift
//  PublicTransportStops
//
//  Created by Крылов Данила  on 27.02.2022.
//

import Foundation

final class NetworkManager {

    private let decoder = JSONDecoder()

    public func requestData<DataType: Decodable>(url: URL?,
                                                      completion: @escaping(Result<DataType, Error>) -> Void) {

        guard let url = url else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self else {
                return
            }
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data)
                print(json)
                let result = try self.decoder.decode(DataType.self, from: data)
                completion(.success(result))
            } catch {
                print(error)
            }
        }.resume()
    }
}
