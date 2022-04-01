//
//  CharacterDetailViewController.swift
//  RickAndMortyApp
//
//  Created by Cem Kazım Genel on 01/04/2022.
//

import UIKit
import SDWebImage

class CharacterDetailViewController: BaseViewController {
    
    // MARK: - Properties
    
    private var doneButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.CharacterDetail.doneButtonTitle, for: UIControl.State.normal)
        button.setTitleColor(Constants.CharacterDetail.doneButtonColor, for: .normal)
        button.titleLabel?.numberOfLines = .zero
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(doneButtonTapped) , for: .touchUpInside)
        return button
    }()
    
    private var characterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.sizeToFit()
        return label
    }()
    
    private var characterImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = imageView.frame.width / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private var characterStatusAndSpeciesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.sizeToFit()
        return label
    }()
    
    private var characterGenderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.sizeToFit()
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [characterStatusAndSpeciesLabel, characterGenderLabel])
        stackView.spacing = 14
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    private var dropDownButtonView: DropDownButtonView!
    
    private var episodeTableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    private var isTableViewVisible = false

    var viewModel = CharacterDetailViewModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        dropDownButtonView = DropDownButtonView(frame: .zero, delegate: self, dropDownTitleText: Constants.CharacterDetail.dropDownTitleText)
        addSubviews()
        setupConstraints()
        updateUI()
        setupTableView()
        reloadTableView()
        setupErrorHandling()
    }
    
    // MARK: - Methods
    
    private func addSubviews() {
        view.addSubview(doneButton)
        view.addSubview(characterNameLabel)
        view.addSubview(characterImageView)
        view.addSubview(labelStackView)
        view.addSubview(dropDownButtonView)
        view.addSubview(episodeTableView)
    }
    
    private func setupConstraints() {
        doneButton.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(20)
            make.left.equalTo(view.snp.left).offset(20)
        }
        characterNameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(80)
            make.left.equalTo(view.snp.left).offset(20)
            make.width.equalTo(250)
        }
        characterImageView.snp.makeConstraints { make in
            make.top.equalTo(characterNameLabel.snp.bottom).offset(20)
            make.left.equalTo(view.snp.left).offset(20)
            make.width.equalTo(90)
            make.height.equalTo(90)
        }
        characterStatusAndSpeciesLabel.snp.makeConstraints { make in
            make.width.equalTo(200)
        }
        labelStackView.snp.makeConstraints { make in
            make.top.equalTo(characterNameLabel.snp.bottom).offset(43)
            make.left.equalTo(characterImageView.snp.right).offset(18)
        }
        dropDownButtonView.snp.makeConstraints { make in
            make.top.equalTo(labelStackView.snp.bottom).offset(43)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.height.equalTo(60)
        }
        episodeTableView.snp.makeConstraints { make in
            make.top.equalTo(dropDownButtonView.snp.bottom)
            make.left.equalTo(view.snp.left).offset(20)
            make.right.equalTo(view.snp.right).offset(-20)
            make.height.equalTo(0)
        }
    }
    
    private func updateUI() {
        guard let characterResult = viewModel.getCharacterResult() else { return }
        characterNameLabel.text = characterResult.name
        characterImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        characterImageView.sd_setImage(with: URL(string: characterResult.image ?? ""), placeholderImage: UIImage(imageLiteralResourceName: Constants.PlaceholderImage.name))
        characterStatusAndSpeciesLabel.text = "\(characterResult.status ?? Status.unknown.rawValue), \(characterResult.species ?? Status.unknown.rawValue)"
        characterGenderLabel.text = characterResult.gender
    }
    
    private func setupTableView() {
        episodeTableView.backgroundColor = .clear
        episodeTableView.delegate = self
        episodeTableView.dataSource = self
        episodeTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.CharacterDetail.tableViewCellId)
    }
    
    private func reloadTableView() {
        viewModel.getData()
        loaderView.startAnimating()
        viewModel.listenDataCallback = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.episodeTableView.reloadData()
                self.loaderView.stopAnimating()
            }
        }
    }
    
    private func setupErrorHandling() {
        viewModel.showErrorAlertViewCallback = { [weak self] error in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.showAlertView(title: Constants.AlertView.title,
                              message: error.localizedDescription,
                              dismissButtonTitle: Constants.AlertView.dismissButtonTitle,
                              dismissButtonCallback: nil)
            }
        }
    }
    
    // MARK: - Actions
    
    @objc private func doneButtonTapped() {
        dismiss(animated: true)
    }
}

extension CharacterDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getEpisodeList().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = episodeTableView.dequeueReusableCell(withIdentifier: Constants.CharacterDetail.tableViewCellId) else {
            return UITableViewCell()
        }
        cell.textLabel?.text = viewModel.getEpisodeList()[indexPath.row]
        cell.textLabel?.textColor = .white
        cell.backgroundColor = Constants.DropDownButton.backgroundColor
        return cell
    }
    
    func getTableViewCellHeight() -> Int {
        return 44
    }
}

// MARK: - DropDownButtonViewDelegate

extension CharacterDetailViewController: DropDownButtonViewDelegate {
    
    func dropDownButtonTouches() {
        UIView.animate(withDuration: 0.4) {
            if self.isTableViewVisible {
                self.episodeTableView.snp.updateConstraints { make in
                    make.height.equalTo(0)
                }
                self.isTableViewVisible = false
            } else {
                self.episodeTableView.snp.updateConstraints { make in
                    let tableViewHeight = self.getTableViewCellHeight() * 5
                    make.height.equalTo(tableViewHeight)
                }
                self.isTableViewVisible = true
            }
            self.view.layoutIfNeeded()
        }
    }
}
