// NewPostCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ячейка новый пост
class NewPostCell: UITableViewCell {
    static let identifier = Constants.newPostIdentifier
    let scrollView = UIScrollView()
    let pageControl = UIPageControl()
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
        imageView.image = UIImage(named: Constants.avatarImageView)
        return imageView
    }()

    private var natureImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Constants.natureImageView)
        return imageView
    }()

    private var natureImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Constants.natureImageView1)
        return imageView
    }()

    private var natureImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Constants.natureImageView)
        return imageView
    }()

    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.usernameLabel
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
        button.setImage(UIImage(named: Constants.optionsButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let likeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.likeButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let messageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.messageButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let sendButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.sendButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let saveButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.saveButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let smallUsernameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: Constants.verdana, size: 10)

        label.text = Constants.tourMessage
        let attributedText = NSMutableAttributedString(string: label.text ?? "")
        if let range = label.text?.range(of: Constants.usernameLabel) {
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
        imageView.image = UIImage(named: Constants.smallAvatar)
        return imageView
    }()

    private let comentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.comment
        label.font = UIFont(name: Constants.verdana, size: 10)
        label.textColor = .gray

        return label
    }()

    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.tenMinutes
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

    func setupCell(with items: Post) {
        let images: [UIImageView] = [natureImageView, natureImageView1, natureImageView2]
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        pageControl.numberOfPages = images.count
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .gray

        contentView.addSubview(newPostView)
        newPostView.addSubview(scrollView)
        newPostView.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(natureImageView)
        scrollView.addSubview(natureImageView1)
        scrollView.addSubview(natureImageView2)

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

            scrollView.topAnchor.constraint(equalTo: newPostView.topAnchor, constant: 60),
            scrollView.leadingAnchor.constraint(equalTo: newPostView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: newPostView.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 239),
            scrollView.bottomAnchor.constraint(equalTo: newPostView.bottomAnchor, constant: -152),

            natureImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            natureImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            // natureImageView.trailingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            natureImageView.heightAnchor.constraint(equalToConstant: 239),
            natureImageView.widthAnchor.constraint(equalToConstant: 375),
            natureImageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            natureImageView1.topAnchor.constraint(equalTo: scrollView.topAnchor),
            natureImageView1.leadingAnchor.constraint(equalTo: natureImageView.trailingAnchor),
            // natureImageView1.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            natureImageView1.heightAnchor.constraint(equalToConstant: 239),
            natureImageView1.widthAnchor.constraint(equalToConstant: 375),
            natureImageView1.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            natureImageView2.topAnchor.constraint(equalTo: scrollView.topAnchor),
            natureImageView2.leadingAnchor.constraint(equalTo: natureImageView1.trailingAnchor),
            natureImageView2.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            natureImageView2.heightAnchor.constraint(equalToConstant: 239),
            natureImageView2.widthAnchor.constraint(equalToConstant: 375),
            natureImageView2.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            avatarImageView.topAnchor.constraint(equalTo: newPostView.topAnchor, constant: 20),
            avatarImageView.leadingAnchor.constraint(equalTo: newPostView.leadingAnchor, constant: 12),

            usernameLabel.topAnchor.constraint(equalTo: newPostView.topAnchor, constant: 20),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: 42),
            usernameLabel.widthAnchor.constraint(equalToConstant: 107),
            usernameLabel.heightAnchor.constraint(equalToConstant: 30),

            likeCountLabel.topAnchor.constraint(equalTo: newPostView.bottomAnchor, constant: -110),
            likeCountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),

            optionsButton.topAnchor.constraint(equalTo: newPostView.topAnchor, constant: 20),
            optionsButton.trailingAnchor.constraint(equalTo: newPostView.trailingAnchor, constant: -14),

            likeButton.topAnchor.constraint(equalTo: newPostView.bottomAnchor, constant: -140),
            likeButton.leadingAnchor.constraint(equalTo: newPostView.leadingAnchor, constant: 13),

            messageButton.topAnchor.constraint(equalTo: newPostView.bottomAnchor, constant: -140),
            messageButton.leadingAnchor.constraint(equalTo: newPostView.leadingAnchor, constant: 45),

            sendButton.topAnchor.constraint(equalTo: newPostView.bottomAnchor, constant: -140),
            sendButton.leadingAnchor.constraint(equalTo: newPostView.leadingAnchor, constant: 77.58),

            saveButton.topAnchor.constraint(equalTo: newPostView.bottomAnchor, constant: -140),
            saveButton.trailingAnchor.constraint(equalTo: newPostView.trailingAnchor, constant: -14),

            smallUsernameLabel.topAnchor.constraint(equalTo: newPostView.bottomAnchor, constant: -90),
            smallUsernameLabel.leadingAnchor.constraint(equalTo: newPostView.leadingAnchor, constant: 12),
            smallUsernameLabel.widthAnchor.constraint(equalToConstant: 361),

            smallAvatarImageView.topAnchor.constraint(equalTo: newPostView.bottomAnchor, constant: -53),
            smallAvatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),

            comentLabel.topAnchor.constraint(equalTo: newPostView.bottomAnchor, constant: -50),
            comentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),

            timeLabel.topAnchor.constraint(equalTo: newPostView.bottomAnchor, constant: -25),
            timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),

            pageControl.topAnchor.constraint(equalTo: newPostView.bottomAnchor, constant: -145.6),
            pageControl.leadingAnchor.constraint(equalTo: newPostView.leadingAnchor, constant: 130),
            // pageControl.widthAnchor.constraint(equalToConstant: 18)

        ])
    }
}

extension NewPostCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}
