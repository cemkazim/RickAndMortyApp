//
//  CharacterListViewController.swift
//  RickAndMortyApp
//
//  Created by Cem Kazım Genel on 31/03/2022.
//

import UIKit
import SnapKit

class CharacterListViewController: BaseViewController {
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.bold)
        label.numberOfLines = .zero
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Characters"
        return label
    }()
    
    private var characterListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 157, height: 211)
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setCollectionViewLayout(layout, animated: true)
        view.backgroundColor = .clear
        view.backgroundView = UIView.init(frame: .zero)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationController?.navigationBar.barTintColor = .black
        setupCollectionView()
    }
    
    override func bindViewModel() {
        viewModel = CharacterListViewModel()
    }
    
    override func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(characterListCollectionView)
    }
    
    override func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(65)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(29)
            make.width.equalTo(135)
        }
        characterListCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(117)
            make.left.equalToSuperview().offset(20)
        }
    }
    
    private func setupCollectionView() {
        characterListCollectionView.delegate = self
        characterListCollectionView.dataSource = self
        characterListCollectionView.register(CharacterListCollectionViewCell.self, forCellWithReuseIdentifier: Constants.characterListViewControllerCellId)
    }
}

// MARK: - CharacterListViewController: UICollectionViewDelegate, UICollectionViewDataSource
extension CharacterListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.characterListViewControllerCellId, for: indexPath) as? CharacterListCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setCharactersData(indexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
