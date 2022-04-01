//
//  CharacterDetailViewModel.swift
//  RickAndMortyApp
//
//  Created by Cem Kazım Genel on 01/04/2022.
//

import Foundation

class CharacterDetailViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    private var characterResult: CharacterResult?
    private var episodeList: [String] = []
    
    // MARK: - Initializers
    
    init(characterResult: CharacterResult? = nil) {
        self.characterResult = characterResult
    }
    
    // MARK: - Methods
    
    func getData() {
        guard let episodeList = characterResult?.episode else { return }
        DataProvider.shared.getEpisodeDetail(stringURLList: episodeList) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                self.showErrorAlertViewCallback?(error)
            case .success(let data):
                self.handleCharacterList(with: data)
                self.listenDataCallback?()
            }
        }
    }
    
    private func handleCharacterList(with model: EpisodeDetailModel) {
        let episode = "\(model.name ?? "") - \(model.episode ?? "")"
        episodeList.append(episode)
    }
    
    func getEpisodeList() -> [String] {
        return episodeList
    }
    
    func getCharacterResult() -> CharacterResult? {
        return characterResult
    }
}
