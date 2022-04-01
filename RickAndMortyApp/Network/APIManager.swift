//
//  APIManager.swift
//  RickAndMortyApp
//
//  Created by Cem Kazım Genel on 31/03/2022.
//

import Foundation

class APIManager {
    
    // MARK: - Properties
    
    static let shared = APIManager()
    
    // MARK: - Initializers
    
    private init() {}
    
    // MARK: - Methods
    
    /// Description: Request the API data with parameters (T is a decodable model).
    /// - Parameters:
    ///   - url: Formatted url for API data
    ///   - requestMethod: Any HTTPMethod
    ///   - onComplete: Pass the data with completion
    func request<T: Decodable>(url: URL?, requestMethod: HTTPMethods, onComplete: @escaping RequestCompletion<T>) {
        guard let url = url else { return }
        var request = URLRequest(url: url)
        request.httpMethod = requestMethod.rawValue
        let task = URLSession.shared
        task.dataTask(with: request) { (data, response, error) in
            guard let remoteData = data else { return }
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: remoteData)
                onComplete(.success(decodedData))
            } catch {
                onComplete(.failure(error))
            }
        }.resume()
    }
}
