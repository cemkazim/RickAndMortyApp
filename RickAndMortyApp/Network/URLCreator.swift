//
//  URLCreator.swift
//  RickAndMortyApp
//
//  Created by Cem Kazım Genel on 01/04/2022.
//

import Foundation

class URLCreator {
    
    public static let shared = URLCreator()
    
    private var baseURLComponents: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "rickandmortyapi.com"
        return components
    }()
    
    private init() {}
    
    func getAllCharactersURL(pageNumber: Int) -> URL? {
        baseURLComponents.path = "/api/character"
        baseURLComponents.queryItems = [URLQueryItem(name: "page", value: String(pageNumber))]
        return baseURLComponents.url
    }
}
