// RecommendedCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ячейка рекомендованное
class RecommendedCell: UITableViewCell {
    private enum Constants {
        static let recommendedCell = "RecommendedCell"
        static let myLightBlue = "myLightBlue"
        static let recommended = "Рекомендуем вам"
        static let all = "Все"
        static let account = "account"
        static let verdanaBold = "Verdana-bold"
        static let verdana = "Verdana"
        static let close = "close"
        static let crimea = "сrimea_082"
        static let subscribe = "subscribe"
        static let subscribeRus = "Подписаться"
        static let accountFirst = "account1"
        static let accountMary = "mary_pol"
        static let errorMessage = "init(coder:) has not been implemented"
    }

    static let identifier = Constants.recommendedCell
    let scrollView = UIScrollView()

    private var recommendedView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: Constants.myLightBlue)
        return view
    }()

    private let recommendationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.recommended
        label.font = UIFont(name: Constants.verdanaBold, size: 10)
        return label
    }()

    private let allRecommendationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.all
        label.textAlignment = .right
        label.textColor = .systemBlue
        label.font = UIFont(name: Constants.verdanaBold, size: 10)
        return label
    }()

    // вью нового аакаунта
    private var accountView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private var accountImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: Constants.account)
        return image
    }()

    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.close), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.crimea
        label.textAlignment = .center
        label.font = UIFont(name: Constants.verdana, size: 10)
        return label
    }()

    private let subscribeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.subscribe), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let subscribeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.subscribeRus
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: Constants.verdanaBold, size: 10)
        return label
    }()

    // вторая вью
    private var accountView1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private var accountImageView1: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: Constants.accountFirst)
        return image
    }()

    private let closeButton1: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.close), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let nameLabel1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.accountMary
        label.textAlignment = .center
        label.font = UIFont(name: Constants.verdana, size: 10)
        return label
    }()

    private let subscribeButton1: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.subscribe), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let subscribeLabel1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.subscribeRus
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: Constants.verdanaBold, size: 10)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.errorMessage)
    }

    func setupCell() {
        contentView.addSubview(recommendedView)
        recommendedView.addSubview(recommendationLabel)
        recommendedView.addSubview(allRecommendationLabel)
        recommendedView.addSubview(scrollView)
        // пкрвая вью в предложке
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        // scrollView.backgroundColor = .red
        scrollView.addSubview(accountView)
        accountView.addSubview(accountImageView)
        accountView.addSubview(closeButton)
        accountView.addSubview(nameLabel)
        accountView.addSubview(subscribeButton)
        accountView.addSubview(subscribeLabel)
        // вторая вью в предложке
        scrollView.addSubview(accountView1)
        accountView1.addSubview(accountImageView1)
        accountView1.addSubview(closeButton1)
        accountView1.addSubview(nameLabel1)
        accountView1.addSubview(subscribeButton1)
        accountView1.addSubview(subscribeLabel1)

        NSLayoutConstraint.activate([
            recommendedView.topAnchor.constraint(equalTo: topAnchor),
            recommendedView.leadingAnchor.constraint(equalTo: leadingAnchor),
            recommendedView.trailingAnchor.constraint(equalTo: trailingAnchor),
            recommendedView.bottomAnchor.constraint(equalTo: bottomAnchor),

            scrollView.topAnchor.constraint(equalTo: recommendedView.topAnchor, constant: 45),
            scrollView.leadingAnchor.constraint(equalTo: recommendedView.leadingAnchor, constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: recommendedView.trailingAnchor, constant: 16),
            scrollView.bottomAnchor.constraint(equalTo: recommendedView.bottomAnchor, constant: -25),

            recommendationLabel.topAnchor.constraint(equalTo: recommendedView.topAnchor, constant: 9),
            recommendationLabel.leadingAnchor.constraint(equalTo: recommendedView.leadingAnchor, constant: 12),

            allRecommendationLabel.topAnchor.constraint(equalTo: recommendedView.topAnchor, constant: 9),
            allRecommendationLabel.leadingAnchor.constraint(equalTo: recommendedView.leadingAnchor, constant: 258),
            allRecommendationLabel.widthAnchor.constraint(equalToConstant: 107),
            // первая лайба контакта
            accountView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            accountView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            accountView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            accountView.widthAnchor.constraint(equalToConstant: 185),
            accountView.heightAnchor.constraint(equalToConstant: 200),

            accountImageView.topAnchor.constraint(equalTo: accountView.topAnchor, constant: 15),
            accountImageView.leadingAnchor.constraint(equalTo: accountView.leadingAnchor, constant: 35),
            accountImageView.widthAnchor.constraint(equalToConstant: 115),
            accountImageView.heightAnchor.constraint(equalToConstant: 115),

            closeButton.topAnchor.constraint(equalTo: accountView.topAnchor, constant: 6),
            closeButton.leadingAnchor.constraint(equalTo: accountView.leadingAnchor, constant: 167),

            nameLabel.topAnchor.constraint(equalTo: accountImageView.bottomAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: accountView.leadingAnchor, constant: 42),
            nameLabel.widthAnchor.constraint(equalToConstant: 100),

            subscribeButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 9),
            subscribeButton.leadingAnchor.constraint(equalTo: accountView.leadingAnchor, constant: 10),
            subscribeButton.widthAnchor.constraint(equalToConstant: 165),

            subscribeLabel.topAnchor.constraint(equalTo: subscribeButton.topAnchor, constant: 9),
            subscribeLabel.leadingAnchor.constraint(equalTo: subscribeButton.leadingAnchor, constant: 45),
            subscribeLabel.widthAnchor.constraint(equalToConstant: 74),
            // вторая лайба контакта

            accountView1.topAnchor.constraint(equalTo: scrollView.topAnchor),
            accountView1.leadingAnchor.constraint(equalTo: accountView.trailingAnchor, constant: 20),
            accountView1.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            accountView1.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            accountView1.widthAnchor.constraint(equalToConstant: 185),
            accountView1.heightAnchor.constraint(equalToConstant: 200),

            accountImageView1.topAnchor.constraint(equalTo: accountView1.topAnchor, constant: 15),
            accountImageView1.leadingAnchor.constraint(equalTo: accountView1.leadingAnchor, constant: 35),
            accountImageView1.widthAnchor.constraint(equalToConstant: 115),
            accountImageView1.heightAnchor.constraint(equalToConstant: 115),

            closeButton1.topAnchor.constraint(equalTo: accountView1.topAnchor, constant: 6),
            closeButton1.leadingAnchor.constraint(equalTo: accountView1.leadingAnchor, constant: 167),

            nameLabel1.topAnchor.constraint(equalTo: accountImageView1.bottomAnchor, constant: 5),
            nameLabel1.leadingAnchor.constraint(equalTo: accountView1.leadingAnchor, constant: 42),
            nameLabel1.widthAnchor.constraint(equalToConstant: 100),

            subscribeButton1.topAnchor.constraint(equalTo: nameLabel1.bottomAnchor, constant: 9),
            subscribeButton1.leadingAnchor.constraint(equalTo: accountView1.leadingAnchor, constant: 10),
            subscribeButton1.widthAnchor.constraint(equalToConstant: 165),

            subscribeLabel1.topAnchor.constraint(equalTo: subscribeButton1.topAnchor, constant: 9),
            subscribeLabel1.leadingAnchor.constraint(equalTo: subscribeButton1.leadingAnchor, constant: 45),
            subscribeLabel1.widthAnchor.constraint(equalToConstant: 74),

        ])
    }
}
