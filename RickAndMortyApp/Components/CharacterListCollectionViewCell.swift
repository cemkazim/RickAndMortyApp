//
//  CharacterListCollectionViewCell.swift
//  RickAndMortyApp
//
//  Created by Cem Kazım Genel on 31/03/2022.
//

import UIKit
import SDWebImage

class CharacterListCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private var characterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
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
            make.width.equalTo(157)
            make.height.equalTo(180)
        }
        characterNameLabel.snp.makeConstraints { make in
            make.top.equalTo(characterImageView.snp.bottom).offset(10)
            make.width.equalTo(157)
            make.height.equalTo(21)
        }
    }
}

// MARK: - CharacterListCollectionViewCell
extension CharacterListCollectionViewCell {
    
    func updateCell(with result: CharacterResult?) {
        guard let result = result else { return }
        characterImageView.sd_setImage(with: URL(string: result.image ?? ""))
        characterNameLabel.text = result.name
    }
}
