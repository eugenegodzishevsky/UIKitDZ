// CommentCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка комментария
final class CommentCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let fontVerdana = "Verdana"
    }

    // MARK: - Visual Components

    private let commentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont(name: Constants.fontVerdana, size: 12)
        return label
    }()

    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()

    private let commentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addViews()
        setupConstraints()
    }

    // MARK: - Public Methods

    func configure(with info: CommentItemCell) {
        commentLabel.text = info.userText
        userImageView.image = UIImage(named: info.userImageName)
        commentImageView.image = UIImage(named: info.imageName)
    }

    // MARK: - Private Methods

    private func addViews() {
        contentView.addSubview(commentLabel)
        contentView.addSubview(userImageView)
        contentView.addSubview(commentImageView)
    }

    private func setupConstraints() {
        userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        userImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        userImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true

        commentLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        commentLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
        commentLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 10).isActive = true
        commentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        commentImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        commentImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        commentImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        commentImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
    }
}
