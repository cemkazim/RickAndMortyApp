//
//  DataProvider.swift
//  RickAndMortyApp
//
//  Created by Cem Kazım Genel on 31/03/2022.
//

import Foundation

class DataProvider {
    
    static let shared = DataProvider()
    
    private init() {}
    
    func getAllCharacters(pageNumber: Int, completionHandler: @escaping CharacterListCompletion) {
        let url = URLCreator.shared.getAllCharactersURL(pageNumber: pageNumber)
        APIManager.shared.request(url: url, requestMethod: .get) { (result: Result<CharacterListModel, Error>) in
            completionHandler(result)
        }
    }
    
    func getEpisodeDetail(stringURLList: [String], completionHandler: @escaping EpisodeDetailCompletion) {
        for stringURL in stringURLList {
            guard let url = URL(string: stringURL) else { return }
            APIManager.shared.request(url: url, requestMethod: .get) { (result: Result<EpisodeDetailModel, Error>) in
                completionHandler(result)
            }
        }
    }
}
