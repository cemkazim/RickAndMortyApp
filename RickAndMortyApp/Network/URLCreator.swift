//
//  URLCreator.swift
//  RickAndMortyApp
//
//  Created by Cem Kazım Genel on 01/04/2022.
//

import Foundation

class URLCreator {
    
    // MARK: - Properties
    
    public static let shared = URLCreator()
    
    private var baseURLComponents: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "rickandmortyapi.com"
        return components
    }()
    
    // MARK: - Initializers
    
    private init() {}
    
    // MARK: - Methods
    
    func getAllCharactersURL(pageNumber: Int) -> URL? {
        baseURLComponents.path = "/api/character"
        baseURLComponents.queryItems = [URLQueryItem(name: "page", value: String(pageNumber))]
        return baseURLComponents.url
    }
}
