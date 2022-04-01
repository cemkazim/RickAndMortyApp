//
//  CharacterListViewModel.swift
//  RickAndMortyApp
//
//  Created by Cem Kazım Genel on 31/03/2022.
//

import Foundation

class CharacterListViewModel {
    
    private var characterResultList: [CharacterResult] = []
    private var pageCount = 1
    private var pageItemLimit = 20
    var showErrorAlertViewCallback: ((Error) -> Void)?
    var listenCharacterResultCallback: (() -> Void)?
    
    func getData() {
        DataProvider.shared.getAllCharacters(pageNumber: pageCount) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                self.showErrorAlertViewCallback?(error)
            case .success(let data):
                self.handleCharacterList(with: data)
                self.listenCharacterResultCallback?()
            }
        }
    }
    
    private func handleCharacterList(with model: CharacterListModel) {
        guard let results = model.results else { return }
        for result in results {
            let characterResult = CharacterResult(id: result.id, name: result.name, status: result.status,
                                        species: result.species, type: result.type, gender: result.gender,
                                        origin: result.origin, location: result.location, image: result.image,
                                        episode: result.episode, url: result.url, created: result.created)
            characterResultList.append(characterResult)
        }
    }
    
    func increasePageCount() {
        pageCount += 1
    }
    
    func getPageCount() -> Int {
        return pageCount
    }
    
    func getPageItemLimit() -> Int {
        return pageItemLimit
    }
    
    func getCharacterResultList() -> [CharacterResult] {
        return characterResultList
    }
}
