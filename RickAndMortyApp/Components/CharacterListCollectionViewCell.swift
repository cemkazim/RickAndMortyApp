//
//  CharacterListCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Cem Kazım Genel on 31/03/2022.
//

import UIKit

class CharacterListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
//        imageView.layer.cornerRadius = 180 / 16
        return imageView
    }()
    
    private lazy var characterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.bold)
        label.numberOfLines = .zero
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func addSubviews() {
        addSubview(characterImageView)
        addSubview(characterNameLabel)
    }
    
    private func setupConstraints() {
        characterImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(180)
        }
        characterNameLabel.snp.makeConstraints { make in
            make.top.equalTo(characterImageView).offset(10)
            make.width.equalToSuperview()
        }
    }
}

// MARK: - CharacterListCollectionViewCell
extension CharacterListCollectionViewCell {
    
    func setCharactersData(indexPath: IndexPath) {
        characterImageView.image = UIImage()
        characterNameLabel.text = "Cem Kazım"
    }
}
