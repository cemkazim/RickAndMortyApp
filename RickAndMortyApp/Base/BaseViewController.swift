//
//  BaseViewController.swift
//  RickAndMortyApp
//
//  Created by Cem Kazım Genel on 31/03/2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    var viewModel: BaseViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        // you can add any subviews to your view controller.
    }
    
    func setupConstraints() {
        // you can configure the constraints of your views.
    }
    
    func bindViewModel() {
        // binding view model
    }
}
