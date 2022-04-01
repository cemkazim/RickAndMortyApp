//
//  BaseViewController.swift
//  RickAndMortyApp
//
//  Created by Cem Kazım Genel on 02/04/2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    
    var loaderView = UIActivityIndicatorView(style: .whiteLarge)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoaderView()
    }
    
    // MARK: - Methods
    
    func setupLoaderView() {
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loaderView)
        loaderView.snp.makeConstraints { (make) in
            make.centerX.centerY.equalTo(view)
        }
    }
    
    func showAlertView(title: String,
                      message: String,
                      dismissButtonTitle: String,
                      dismissButtonCallback: ((UIAlertAction) -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let dismissButton = UIAlertAction(title: dismissButtonTitle, style: .default, handler: dismissButtonCallback)
        alertController.addAction(dismissButton)
        present(alertController, animated: true)
    }
}
