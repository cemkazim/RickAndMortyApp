//
//  AlertView.swift
//  RickAndMortyApp
//
//  Created by Cem Kazım Genel on 01/04/2022.
//

import UIKit

class AlertView {
    
    static let shared = AlertView()
    
    func getAlertView(title: String,
                      message: String,
                      dismissButtonTitle: String,
                      dismissButtonCallback: ((UIAlertAction) -> Void)?) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissButton = UIAlertAction(title: dismissButtonTitle, style: .default, handler: dismissButtonCallback)
        alertController.addAction(dismissButton)
        return alertController
    }
}
