// PostsCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ячейка посты
class PostsCell: UITableViewCell {
    static let identifier = "PostsCell"
    let rmLinkStorage = RMLinkStorage()

    private var newPostView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "avatar")
        return imageView
    }()

    private var natureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "imagenature")
        return imageView
    }()

    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "tur_v_dagestan"
        label.font = UIFont(name: "Verdana-bold", size: 12)
        return label
    }()

    private let likeCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Нравится: 201"
        label.font = UIFont(name: "Verdana-bold", size: 10)

        return label
    }()

    private let optionsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "options"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "like"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let messageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "message_circle"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let sendButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "papper_plane"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let saveButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "papper_plane"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let smallUsernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Verdana", size: 10)

        label.text = "tur_v_dagestan Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!"
        let attributedText = NSMutableAttributedString(string: label.text ?? "")
        if let range = label.text?.range(of: "tur_v_dagestan") {
            let nsRange = NSRange(range, in: label.text ?? "")
            attributedText.addAttribute(
                .font,
                value: UIFont(name: "Verdana-bold", size: 10) ?? UIFont.systemFont(ofSize: 10, weight: .bold),
                range: nsRange
            )
        }
        label.attributedText = attributedText
        label.numberOfLines = 0
        return label
    }()

    private var smallAvatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "smallAvatar")
        return imageView
    }()

    private let comentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Комментировать ..."
        label.font = UIFont(name: "Verdana", size: 10)
        label.textColor = .gray

        return label
    }()

    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10 минут назад ..."
        label.font = UIFont(name: "Verdana", size: 10)
        label.textColor = .gray

        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell() {
        contentView.addSubview(newPostView)
        newPostView.addSubview(natureImageView)
        newPostView.addSubview(usernameLabel)
        newPostView.addSubview(likeCountLabel)
        newPostView.addSubview(avatarImageView)
        newPostView.addSubview(optionsButton)
        newPostView.addSubview(likeButton)
        newPostView.addSubview(messageButton)
        newPostView.addSubview(sendButton)
        newPostView.addSubview(saveButton)
        newPostView.addSubview(smallUsernameLabel)
        newPostView.addSubview(smallAvatarImageView)
        newPostView.addSubview(comentLabel)
        newPostView.addSubview(timeLabel)

        NSLayoutConstraint.activate([
            newPostView.topAnchor.constraint(equalTo: topAnchor),
            newPostView.leadingAnchor.constraint(equalTo: leadingAnchor),
            newPostView.trailingAnchor.constraint(equalTo: trailingAnchor),
            newPostView.bottomAnchor.constraint(equalTo: bottomAnchor),

            natureImageView.topAnchor.constraint(equalTo: newPostView.topAnchor, constant: 60),
            natureImageView.leadingAnchor.constraint(equalTo: newPostView.leadingAnchor),
            // natureImageView.trailingAnchor.constraint(equalTo: newPostView.leadingAnchor),
            natureImageView.heightAnchor.constraint(equalToConstant: 209),
            // natureImageView.bottomAnchor.constraint(equalTo: newPostView.bottomAnchor, constant: 152),

            avatarImageView.topAnchor.constraint(equalTo: newPostView.topAnchor, constant: 20),
            avatarImageView.leadingAnchor.constraint(equalTo: newPostView.leadingAnchor, constant: 12),

            usernameLabel.topAnchor.constraint(equalTo: newPostView.topAnchor, constant: 20),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 42),
            usernameLabel.widthAnchor.constraint(equalToConstant: 107),
            usernameLabel.heightAnchor.constraint(equalToConstant: 30),

            likeCountLabel.topAnchor.constraint(equalTo: natureImageView.bottomAnchor, constant: 38),
            likeCountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            // likeCountLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),

            optionsButton.topAnchor.constraint(equalTo: newPostView.topAnchor, constant: 20),
            optionsButton.trailingAnchor.constraint(equalTo: newPostView.trailingAnchor, constant: -14),

            likeButton.topAnchor.constraint(equalTo: natureImageView.bottomAnchor, constant: 12),
            likeButton.leadingAnchor.constraint(equalTo: newPostView.leadingAnchor, constant: 13),

            messageButton.topAnchor.constraint(equalTo: natureImageView.bottomAnchor, constant: 12),
            messageButton.leadingAnchor.constraint(equalTo: newPostView.leadingAnchor, constant: 45),

            sendButton.topAnchor.constraint(equalTo: natureImageView.bottomAnchor, constant: 12),
            sendButton.leadingAnchor.constraint(equalTo: newPostView.leadingAnchor, constant: 77.58),

            saveButton.topAnchor.constraint(equalTo: natureImageView.bottomAnchor, constant: 12),
            saveButton.trailingAnchor.constraint(equalTo: newPostView.trailingAnchor, constant: -14),

            smallUsernameLabel.topAnchor.constraint(equalTo: natureImageView.bottomAnchor, constant: 59),
            smallUsernameLabel.leadingAnchor.constraint(equalTo: newPostView.leadingAnchor, constant: 12),
            smallUsernameLabel.widthAnchor.constraint(equalToConstant: 361),

            smallAvatarImageView.topAnchor.constraint(equalTo: natureImageView.bottomAnchor, constant: 93),
            smallAvatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),

            comentLabel.topAnchor.constraint(equalTo: natureImageView.bottomAnchor, constant: 95),
            comentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),

            timeLabel.topAnchor.constraint(equalTo: natureImageView.bottomAnchor, constant: 117),
            timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),

        ])
    }
}

// MARK: - Private Methods

func setupCell(posts: Post) {}
