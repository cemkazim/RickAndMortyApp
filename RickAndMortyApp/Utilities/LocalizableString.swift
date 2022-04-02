//
//  LocalizableString.swift
//  RickAndMortyApp
//
//  Created by Cem Kazım Genel on 02/04/2022.
//

import Foundation

extension String {
    
    func localized() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
