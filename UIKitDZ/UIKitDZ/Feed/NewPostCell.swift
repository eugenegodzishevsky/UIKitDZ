// NewPostCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ячейка новый пост
final class NewPostCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let boldString = "tur_v_dagestan"
        static let xOffset = 0
        static let fontVerdanaBold = "Verdana-Bold"
        static let fontVerdana = "Verdana"
        static let nameShareButton = "options"
        static let nameHearthImage = "like"
        static let nameCommentImage = "message_circle"
        static let nameShareImage = "papper_plane"
        static let nameSaveImage = "save_button"
        static let nameContentImage = "smallAvatar"
        static let placeholder = "Комментировать ..."
    }

    // MARK: - Visual Components

    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 15
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdanaBold, size: 12)
        label.textColor = .black
        return label
    }()

    private let shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.nameShareButton), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        scroll.isPagingEnabled = true
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()

    private let pageControll: UIPageControl = {
        let pageControll = UIPageControl()
        pageControll.translatesAutoresizingMaskIntoConstraints = false
        pageControll.pageIndicatorTintColor = .lightGray
        pageControll.currentPageIndicatorTintColor = .black
        return pageControll
    }()

    private let hearthButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.nameHearthImage), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let commentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.nameCommentImage), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let telegramButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.nameShareImage), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let saveButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.nameSaveImage), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let likesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: Constants.fontVerdanaBold, size: 10)
        return label
    }()

    private let comentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: Constants.fontVerdana, size: 10)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let imageComment: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.nameContentImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let commentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = Constants.placeholder
        textField.font = UIFont(name: Constants.fontVerdana, size: 10)
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont(name: Constants.fontVerdana, size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setupCell()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Public Methods

    func configure(with items: Post) {
        userImageView.image = UIImage(named: items.imageUserName)
        userNameLabel.text = items.username
        scrollView.contentSize = CGSize(
            width: Int(UIScreen.main.bounds.width) * items.postImageName.count,
            height: 240
        )

        setImageOnScrollView(items: items)
        likesLabel.text = items.numberLikes
        timeLabel.text = items.time
        let text = items.userComent
        let attributedString = NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: Constants.boldString)
        attributedString.addAttribute(
            .font,
            value: UIFont(name: Constants.fontVerdanaBold, size: 10) ?? "",
            range: range
        )
        comentLabel.attributedText = attributedString
    }

    // MARK: - Private Methods

    private func addViews() {
        contentView.addSubview(shareButton)
        contentView.addSubview(userImageView)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(hearthButton)
        contentView.addSubview(commentButton)
        contentView.addSubview(telegramButton)
        contentView.addSubview(saveButton)
        contentView.addSubview(likesLabel)
        contentView.addSubview(comentLabel)
        contentView.addSubview(imageComment)
        contentView.addSubview(commentTextField)
        contentView.addSubview(timeLabel)
        contentView.addSubview(pageControll)
        contentView.addSubview(scrollView)
        scrollView.delegate = self
    }

    private func setupCell() {
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        userImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true

        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 8).isActive = true
        userNameLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor).isActive = true

        shareButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14).isActive = true
        shareButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14).isActive = true

        scrollView.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 10).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalToConstant: 240).isActive = true

        hearthButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 12).isActive = true
        hearthButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 13).isActive = true
        hearthButton.widthAnchor.constraint(equalToConstant: 18).isActive = true
        hearthButton.heightAnchor.constraint(equalToConstant: 18).isActive = true

        commentButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 12).isActive = true
        commentButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 42).isActive = true
        commentButton.widthAnchor.constraint(equalToConstant: 18).isActive = true
        commentButton.heightAnchor.constraint(equalToConstant: 18).isActive = true

        telegramButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 14).isActive = true
        telegramButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 74).isActive = true
        telegramButton.widthAnchor.constraint(equalToConstant: 18).isActive = true
        telegramButton.heightAnchor.constraint(equalToConstant: 18).isActive = true

        saveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14).isActive = true
        saveButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 11).isActive = true

        likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        likesLabel.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 40).isActive = true

        comentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        comentLabel.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 60).isActive = true
        comentLabel.widthAnchor.constraint(equalToConstant: 355).isActive = true

        imageComment.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        imageComment.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 94).isActive = true
        imageComment.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageComment.heightAnchor.constraint(equalToConstant: 20).isActive = true

        commentTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35).isActive = true
        commentTextField.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 98).isActive = true
        commentTextField.widthAnchor.constraint(equalToConstant: 150).isActive = true

        timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        timeLabel.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 117).isActive = true

        pageControll.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 10).isActive = true
        pageControll.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }

    private func setImageOnScrollView(items: Post) {
        var xOffSet = Constants.xOffset

        for image in items.postImageName {
            if items.postImageName.count <= 1 {
                pageControll.isHidden = true
                let imageView = UIImageView()
                imageView.image = UIImage(named: image)
                imageView.frame = CGRect(x: xOffSet, y: 0, width: Int(UIScreen.main.bounds.width), height: 240)
                scrollView.addSubview(imageView)
            } else {
                pageControll.numberOfPages = items.postImageName.count
                let imageView = UIImageView()
                imageView.image = UIImage(named: image)
                imageView.frame = CGRect(x: xOffSet, y: 0, width: Int(UIScreen.main.bounds.width), height: 240)
                scrollView.addSubview(imageView)

                xOffSet += Int(UIScreen.main.bounds.width)
            }
        }
    }
}

//MARK: - Extension UIScrollViewDelegate

extension NewPostCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControll.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}
