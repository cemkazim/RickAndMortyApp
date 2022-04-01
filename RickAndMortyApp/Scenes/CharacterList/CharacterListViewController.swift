//
//  CharacterListViewController.swift
//  RickAndMortyApp
//
//  Created by Cem Kazım Genel on 31/03/2022.
//

import UIKit
import SnapKit

class CharacterListViewController: UIViewController {
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.numberOfLines = .zero
        label.textColor = .white
        label.textAlignment = .left
        label.text = "Characters"
        return label
    }()
    
    private var characterListCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setCollectionViewLayout(layout, animated: true)
        view.backgroundColor = .clear
        view.backgroundView = UIView.init(frame: .zero)
        return view
    }()
    
    var viewModel: CharacterListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        viewModel = CharacterListViewModel()
        addSubviews()
        setupConstraints()
        setupCollectionView()
        reloadCollectionView()
    }
    
    private func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(characterListCollectionView)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(65)
            make.left.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.height.equalTo(29)
            make.width.equalTo(2 * view.frame.width / 3)
        }
        characterListCollectionView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-20)
        }
    }
    
    private func setupCollectionView() {
        characterListCollectionView.delegate = self
        characterListCollectionView.dataSource = self
        characterListCollectionView.register(CharacterListCollectionViewCell.self, forCellWithReuseIdentifier: Constants.characterListViewControllerCellId)
    }
    
    private func reloadCollectionView() {
        viewModel?.getData()
        viewModel?.listenCharacterResultCallback = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.characterListCollectionView.reloadData()
            }
        }
    }
}

// MARK: - CharacterListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension CharacterListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.getCharacterResultList().count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.characterListViewControllerCellId, for: indexPath) as? CharacterListCollectionViewCell else {
            return UICollectionViewCell()
        }
        let characterResult = viewModel?.getCharacterResultList()[indexPath.row]
        cell.updateCell(with: characterResult)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard let viewModel = viewModel else { return }
        if viewModel.getCharacterResultList().count == viewModel.getPageItemLimit() * viewModel.getPageCount() {
            if indexPath.row == viewModel.getCharacterResultList().count - 1 {
                viewModel.increasePageCount()
                reloadCollectionView()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 157, height: 211)
    }
}
