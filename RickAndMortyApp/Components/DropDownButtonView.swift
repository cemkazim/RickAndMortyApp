//
//  DropDownButtonView.swift
//  RickAndMortyApp
//
//  Created by Cem Kazım Genel on 01/04/2022.
//

import UIKit

// MARK: - DropDownButtonViewDelegate

protocol DropDownButtonViewDelegate: AnyObject {
    func dropDownButtonTouches()
}

class DropDownButtonView: UIView {
    
    // MARK: - Properties
    
    private var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.DropDownButton.backgroundColor
        return view
    }()
    
    private var dropDownTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = .zero
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private var arrowImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 20))
        imageView.image = UIImage(imageLiteralResourceName: Constants.DropDownButton.dropDownMenuClosedArrowImage)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private var isDropDownOpened = false
    
    private weak var delegate: DropDownButtonViewDelegate?
    
    // MARK: - Initializers
    
    init(frame: CGRect, delegate: DropDownButtonViewDelegate?, dropDownTitleText: String) {
        super.init(frame: frame)
        self.delegate = delegate
        self.dropDownTitleLabel.text = dropDownTitleText
        addSubviews()
        setupConstraints()
        let dropDownTapped = UITapGestureRecognizer(target: self, action: #selector(dropDownTapped))
        containerView.addGestureRecognizer(dropDownTapped)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func addSubviews() {
        addSubview(containerView)
        containerView.addSubview(dropDownTitleLabel)
        containerView.addSubview(arrowImageView)
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        dropDownTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(22)
            make.left.equalTo(containerView.snp.left).offset(18)
            make.width.equalTo(100)
        }
        arrowImageView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(25)
            make.right.equalTo(containerView.snp.right).offset(-18)
        }
    }
    
    // MARK: - Actions
    
    @objc private func dropDownTapped() {
        isDropDownOpened.toggle()
        arrowImageView.image = isDropDownOpened ? UIImage(imageLiteralResourceName: Constants.DropDownButton.dropDownMenuOpenedArrowImage) : UIImage(imageLiteralResourceName: Constants.DropDownButton.dropDownMenuClosedArrowImage)
        delegate?.dropDownButtonTouches()
    }
}
