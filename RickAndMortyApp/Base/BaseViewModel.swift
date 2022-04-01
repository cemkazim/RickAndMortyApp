//
//  BaseViewModel.swift
//  RickAndMortyApp
//
//  Created by Cem Kazım Genel on 02/04/2022.
//

import Foundation

class BaseViewModel {
    
    // MARK: - Properties
    
    var showErrorAlertViewCallback: ((Error) -> Void)?
    var listenDataCallback: (() -> Void)?
}
