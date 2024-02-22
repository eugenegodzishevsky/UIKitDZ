// PostsCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ячейка посты
class PostsCell: UITableViewCell {
    private enum Constants {
        static let postCell = "PostsCell"
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
        static let avatar = "avatar"
        static let imageNature = "imagenature"
        static let tour = "tur_v_dagestan"
        static let likes201 = "Нравится: 201"
        static let options = "options"
        static let like = "like"
        static let message = "message_circle"
        static let papperPlane = "papper_plane"
        static let tourMessage =
            "tur_v_dagestan Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!"
    }

    static let identifier = Constants.postCell
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
        imageView.image = UIImage(named: Constants.avatar)
        return imageView
    }()

    private var natureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Constants.imageNature)
        return imageView
    }()

    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.tour
        label.font = UIFont(name: Constants.verdanaBold, size: 12)
        return label
    }()

    private let likeCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.likes201
        label.font = UIFont(name: Constants.verdanaBold, size: 10)

        return label
    }()

    private let optionsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.options), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.like), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let messageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.message), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let sendButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.papperPlane), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let saveButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.papperPlane), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let smallUsernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: Constants.verdana, size: 10)

        label.text = Constants.tourMessage
        let attributedText = NSMutableAttributedString(string: label.text ?? "")
        if let range = label.text?.range(of: Constants.tour) {
            let nsRange = NSRange(range, in: label.text ?? "")
            attributedText.addAttribute(
                .font,
                value: UIFont(name: Constants.verdanaBold, size: 10) ?? UIFont.systemFont(ofSize: 10, weight: .bold),
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
        label.font = UIFont(name: Constants.verdana, size: 10)
        label.textColor = .gray

        return label
    }()

    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10 минут назад ..."
        label.font = UIFont(name: Constants.verdana, size: 10)
        label.textColor = .gray

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
