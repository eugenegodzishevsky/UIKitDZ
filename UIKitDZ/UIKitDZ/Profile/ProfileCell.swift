// ProfileCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ячейка профиля
class ProfileCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let verdana = "Verdana"
        static let verdanaBold = "Verdana-Bold"
        static let plus = "plus"
        static let skrepka = "skrepka"
        static let change = "Изменить"
        static let share = "Поделиться профилем"
        static let addPeople = "addPeople"
        static let publications = "67"
        static let publicationsLabel = "Публикации"
        static let subscribers = "458"
        static let subscribersLabel = "Подписчики"
        static let subscribe = "120"
        static let subscribeLabel = "Подписки"
    }

    // MARK: - Private Properties

    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 13
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: Constants.plus), for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor(red: 233 / 255, green: 70 / 255, blue: 94 / 255, alpha: 1.0)
        return button
    }()

    private let accountName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Constants.verdanaBold, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let accountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont(name: Constants.verdana, size: 14)
        return label
    }()

    private let clipImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Constants.skrepka)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var link: UIButton = {
        let label = UIButton()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.titleLabel?.font = UIFont(name: Constants.verdana, size: 14)
        label.setTitleColor(UIColor(red: 4 / 255, green: 104 / 255, blue: 181 / 255, alpha: 1.0), for: .normal)
        label.addTarget(self, action: #selector(linkButtonTapped), for: .touchUpInside)
        return label
    }()

    private let changeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.change, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 239 / 255, green: 239 / 255, blue: 239 / 255, alpha: 1.0)
        button.titleLabel?.font = UIFont(name: Constants.verdanaBold, size: 10)
        button.layer.cornerRadius = 8
        return button
    }()

    private let shareProfileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.share, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 239 / 255, green: 239 / 255, blue: 239 / 255, alpha: 1.0)
        button.titleLabel?.font = UIFont(name: Constants.verdanaBold, size: 10)
        button.layer.cornerRadius = 8
        return button
    }()

    private let addPeopleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Constants.addPeople), for: .normal)
        button.backgroundColor = UIColor(red: 239 / 255, green: 239 / 255, blue: 239 / 255, alpha: 1.0)
        button.layer.cornerRadius = 8
        return button
    }()

    private let publications: UILabel = {
        let label = UILabel()
        label.text = Constants.publications
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: Constants.verdanaBold, size: 14)
        return label
    }()

    private let publicationsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.publicationsLabel
        label.textAlignment = .center
        label.font = UIFont(name: Constants.verdana, size: 10)
        return label
    }()

    private let subscribers: UILabel = {
        let label = UILabel()
        label.text = Constants.subscribers
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: Constants.verdanaBold, size: 14)
        return label
    }()

    private let subscribersLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.subscribersLabel
        label.textAlignment = .center
        label.font = UIFont(name: Constants.verdana, size: 10)
        return label
    }()

    private let subscribe: UILabel = {
        let label = UILabel()
        label.text = Constants.subscribe
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: Constants.verdanaBold, size: 14)
        return label
    }()

    private let subscribeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.subscribeLabel
        label.textAlignment = .center
        label.font = UIFont(name: Constants.verdana, size: 10)
        return label
    }()

    @objc var present: (() -> ())?

    // MARK: - Initializers

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    // MARK: - Public Methods

    func configure(with: Profile) {
        userImageView.image = UIImage(named: with.userImageName)
        accountName.text = with.accountName
        accountLabel.text = with.accountLabel
        link.setTitle(with.link, for: .normal)
    }

    // MARK: - Private Methods

    private func setupUI() {
        contentView.addSubview(userImageView)
        contentView.addSubview(addButton)
        contentView.addSubview(accountName)
        contentView.addSubview(accountLabel)
        contentView.addSubview(link)
        contentView.addSubview(clipImageView)
        contentView.addSubview(changeButton)
        contentView.addSubview(shareProfileButton)
        contentView.addSubview(addPeopleButton)
        contentView.addSubview(publicationsLabel)
        contentView.addSubview(publications)
        contentView.addSubview(subscribersLabel)
        contentView.addSubview(subscribers)
        contentView.addSubview(subscribeLabel)
        contentView.addSubview(subscribe)

        NSLayoutConstraint.activate([
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            userImageView.widthAnchor.constraint(equalToConstant: 80),
            userImageView.heightAnchor.constraint(equalToConstant: 80),
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),

            addButton.heightAnchor.constraint(equalToConstant: 26),
            addButton.widthAnchor.constraint(equalToConstant: 26),
            addButton.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: -22),
            addButton.bottomAnchor.constraint(equalTo: userImageView.bottomAnchor),

            accountName.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 10),
            accountName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),

            accountLabel.topAnchor.constraint(equalTo: accountName.bottomAnchor, constant: 11),
            accountLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),

            clipImageView.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 20),
            clipImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),

            link.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 11),
            link.leadingAnchor.constraint(equalTo: clipImageView.trailingAnchor, constant: 5),

            changeButton.topAnchor.constraint(equalTo: link.bottomAnchor, constant: 15),
            changeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            changeButton.widthAnchor.constraint(equalToConstant: 155),
            changeButton.heightAnchor.constraint(equalToConstant: 27),

            shareProfileButton.leadingAnchor.constraint(equalTo: changeButton.trailingAnchor, constant: 5),
            shareProfileButton.topAnchor.constraint(equalTo: link.bottomAnchor, constant: 15),
            shareProfileButton.widthAnchor.constraint(equalToConstant: 155),
            shareProfileButton.heightAnchor.constraint(equalToConstant: 27),

            addPeopleButton.leadingAnchor.constraint(equalTo: shareProfileButton.trailingAnchor, constant: 5),
            addPeopleButton.topAnchor.constraint(equalTo: link.bottomAnchor, constant: 15),
            addPeopleButton.widthAnchor.constraint(equalToConstant: 25),
            addPeopleButton.heightAnchor.constraint(equalToConstant: 28),

            publications.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 68),
            publications.topAnchor.constraint(equalTo: userImageView.topAnchor, constant: 10),

            publicationsLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 46),
            publicationsLabel.topAnchor.constraint(equalTo: publications.bottomAnchor, constant: 2),

            subscribers.leadingAnchor.constraint(equalTo: publications.trailingAnchor, constant: 50),
            subscribers.topAnchor.constraint(equalTo: userImageView.topAnchor, constant: 10),

            subscribersLabel.leadingAnchor.constraint(equalTo: publicationsLabel.trailingAnchor, constant: 10),
            subscribersLabel.topAnchor.constraint(equalTo: subscribers.bottomAnchor, constant: 2),

            subscribe.leadingAnchor.constraint(equalTo: subscribers.trailingAnchor, constant: 35),

            subscribe.topAnchor.constraint(equalTo: userImageView.topAnchor, constant: 10),

            subscribeLabel.leadingAnchor.constraint(equalTo: subscribersLabel.trailingAnchor, constant: 10),
            subscribeLabel.topAnchor.constraint(equalTo: subscribe.bottomAnchor, constant: 2),
        ])
    }

    @objc private func linkButtonTapped() {
        present?()
    }
}
