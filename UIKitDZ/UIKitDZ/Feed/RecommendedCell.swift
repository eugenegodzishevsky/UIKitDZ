// RecommendedCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ячейка рекомендованное
final class RecommendedCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let xOffset = 20
        static let increaseXOffset = 210
        static let fontVerdana = "Verdana"
        static let fontVerdanaBold = "Verdana-Bold"
        static let recomindationLabelText = "Рекомендуем вам"
        static let buttonTitle = "Все"
        static let subscribeButton = "Подписаться"
    }

    // MARK: - Visual Components

    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor(red: 210 / 255, green: 223 / 255, blue: 238 / 255, alpha: 1.0)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let recomindationLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.recomindationLabelText
        label.textColor = .black
        label.font = UIFont(name: Constants.fontVerdanaBold, size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let recomindationButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.buttonTitle, for: .normal)
        button.setTitleColor(UIColor(red: 0 / 255, green: 122 / 255, blue: 255 / 255, alpha: 1.0), for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdanaBold, size: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addViews()
        setupConstraints()
    }

    // MARK: - Private Methods

    private func addViews() {
        contentView.addSubview(scrollView)
        contentView.addSubview(recomindationLabel)
        contentView.addSubview(recomindationButton)
    }

    private func setupConstraints() {
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        recomindationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12)
            .isActive = true
        recomindationLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9).isActive = true

        recomindationButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2).isActive = true
        recomindationButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
            .isActive = true
    }

    // MARK: - Public Methods

    func configure(with items: [Recommended]) {
        var xOffset = CGFloat(Constants.xOffset)

        for item in items {
            let uiView = UIView()
            uiView.backgroundColor = .white
            uiView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(uiView)

            let imageview = UIImageView()
            imageview.image = UIImage(named: item.imageName)
            imageview.contentMode = .scaleAspectFill
            imageview.clipsToBounds = true
            imageview.layer.cornerRadius = 57.5
            imageview.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(imageview)

            let label = UILabel()
            label.text = item.label
            label.textColor = .black
            label.font = UIFont(name: Constants.fontVerdana, size: 10)
            label.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(label)

            let button = UIButton()
            button.setTitle(Constants.subscribeButton, for: .normal)
            button.backgroundColor = UIColor(red: 0 / 255, green: 122 / 255, blue: 255 / 255, alpha: 1.0)
            button.layer.cornerRadius = 8
            button.titleLabel?.font = UIFont(name: Constants.fontVerdanaBold, size: 10)
            button.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(button)

            uiView.widthAnchor.constraint(equalToConstant: 185).isActive = true
            uiView.heightAnchor.constraint(equalToConstant: 200).isActive = true
            uiView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: xOffset).isActive = true
            uiView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 45).isActive = true

            imageview.widthAnchor.constraint(equalToConstant: 115).isActive = true
            imageview.heightAnchor.constraint(equalToConstant: 115).isActive = true
            imageview.topAnchor.constraint(equalTo: uiView.topAnchor, constant: 15).isActive = true
            imageview.centerXAnchor.constraint(equalTo: uiView.centerXAnchor).isActive = true

            label.topAnchor.constraint(equalTo: imageview.bottomAnchor, constant: 5).isActive = true
            label.centerXAnchor.constraint(equalTo: uiView.centerXAnchor).isActive = true

            button.bottomAnchor.constraint(equalTo: uiView.bottomAnchor, constant: -15).isActive = true
            button.centerXAnchor.constraint(equalTo: uiView.centerXAnchor).isActive = true
            button.widthAnchor.constraint(equalToConstant: 165).isActive = true

            xOffset += CGFloat(Constants.increaseXOffset)
        }
        scrollView.contentSize = CGSize(width: xOffset, height: 100)
    }
}
