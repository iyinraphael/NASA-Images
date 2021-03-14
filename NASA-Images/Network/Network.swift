//
//  Network.swift
//  NASA-Images
//
//  Created by Iyin Raphael on 3/13/21.
//

import Foundation

enum NetWorkError: Error {
    case otherError
    case noData
    case failedDecode
}

class Network {
    
    // MARK: - Property
    private let baseUrl = URL(string: "https://images-api.nasa.gov/search")!
    typealias CompletionHandler = (Result<[ItemAsset], NetWorkError>) -> Void
    
    // MARK: - Method
    func getNasaAssets(completion: @escaping CompletionHandler = {_ in}) {
        var urlComponent = URLComponents(url: baseUrl, resolvingAgainstBaseURL: true)
        urlComponent?.queryItems = [URLQueryItem(name: "q", value: "apollo 11"),
                                    URLQueryItem(name: "description", value: "moon landing"),
                                    URLQueryItem(name: "media_type", value: "image")]
        guard let url = urlComponent?.url else { return }
        
        URLSession.shared.dataTask(with: url) { data, _,  error in
            if let error = error {
                NSLog("Error occured getting request: \(error)")
                completion(.failure(.otherError))
                return
            }
            
            guard let data = data else {
                NSLog("Error occured no data from  server")
                completion(.failure(.noData))
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let collection = try jsonDecoder.decode(NasaAssets.self, from: data)
                let items = collection.collection.items
                completion(.success(items))
            } catch {
                NSLog("Error occured decoding data: \(error)")
                completion(.failure(.failedDecode))
            }
        }.resume()
    }
    
    
}
