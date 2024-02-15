// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Профиль пользователя
class ProfileViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        enum CardElement {
            static let cornerRadius: CGFloat = 20
            static let shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            static let shadowOffset = CGSize(width: 0, height: 4)
            static let shadowOpacity: Float = 1.0
            static let cardPercentText = "15%"
            static let cardNumber = "1000 0001 0102"
        }

        static let userDataImageName = "userDataImage"
        static let inviteFriendImageName = "inviteFriendImage"
        static let feedbackImageName = "feedbackImage"
        static let personalData = "Личные данные"
        static let userDataField = "Мои данные"
        static let inviteFriendField = "Приведи друга"
        static let feedBackField = "Обратная связь"
        static let blackColor = "myBlack"
        static let userCardImageName = "logoR"
        static let qrCodeImageName = "qrcode"
        static let infoImageName = "infoImage"
        static let roundedFigureValue: CGFloat = 15
        static let roundedFigureColor = UIColor(red: 41 / 255, green: 41 / 255, blue: 41 / 255, alpha: 1.0)
    }

    // MARK: - Visual Components

    private lazy var userCardView: UIView = {
        let cardView = UIView()
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.backgroundColor = UIColor(named: Constants.blackColor)
        cardView.layer.cornerRadius = Constants.CardElement.cornerRadius
        cardView.layer.shadowColor = Constants.CardElement.shadowColor
        cardView.layer.shadowOffset = Constants.CardElement.shadowOffset
        cardView.layer.shadowOpacity = Constants.CardElement.shadowOpacity
        return cardView
    }()

    private lazy var userCardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: Constants.userCardImageName)
        return imageView
    }()

    private lazy var qrCodeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: Constants.qrCodeImageName), for: .normal)
        button.layer.cornerRadius = Constants.roundedFigureValue
        button.backgroundColor = Constants.roundedFigureColor
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.tintColor = .white
        return button
    }()

    private lazy var infoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Constants.infoImageName), for: .normal)
        button.layer.cornerRadius = Constants.roundedFigureValue
        button.backgroundColor = Constants.roundedFigureColor
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.tintColor = .black
        return button
    }()

    private lazy var cardPercentLabel = self.makeCustomLabel(
        text: Constants.CardElement.cardPercentText,
        textColor: .white,
        font: MainTabBarController.Constants.verdanaBold,
        fontSize: 16,
        alignment: .left
    )

    private lazy var cardNumberLabel = self.makeCustomLabel(
        text: Constants.CardElement.cardNumber,
        textColor: .white,
        font: MainTabBarController.Constants.verdana,
        fontSize: 14,
        alignment: .left
    )

    private lazy var personalDataLabel = makeCustomLabel(
        text: Constants.personalData,
        textColor: .black,
        font: MainTabBarController.Constants.verdanaBold,
        fontSize: 16,
        alignment: .left
    )

    private lazy var myDataLabel = makeCustomLabel(
        text: Constants.userDataField,
        textColor: .black,
        font: MainTabBarController.Constants.verdana,
        fontSize: 16,
        alignment: .left
    )

    private lazy var friendInvitationLabel = makeCustomLabel(
        text: Constants.inviteFriendField,
        textColor: .black,
        font: MainTabBarController.Constants.verdana,
        fontSize: 16,
        alignment: .left
    )

    private lazy var feedBackLabel = makeCustomLabel(
        text: Constants.feedBackField,
        textColor: .black,
        font: MainTabBarController.Constants.verdana,
        fontSize: 16,
        alignment: .left
    )

    private lazy var myDataImageView = self.makeCustomImageView(image: Constants.userDataImageName, tintColor: .black)
    private lazy var friendInvitationImageView = self.makeCustomImageView(
        image: Constants.inviteFriendImageName,
        tintColor: .black
    )
    private lazy var feedBackImageView = self.makeCustomImageView(image: Constants.feedbackImageName, tintColor: .black)

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAnchors()
    }

    // MARK: - Private Methods

    private func setupUI() {
        title = MainTabBarController.Constants.profileTabBarName
        view.backgroundColor = .white
        view.addSubview(userCardView)
        userCardView.addSubview(userCardImageView)
        userCardView.addSubview(qrCodeButton)
        userCardView.addSubview(infoButton)
        userCardView.addSubview(cardPercentLabel)
        userCardView.addSubview(cardNumberLabel)
        view.addSubview(personalDataLabel)
        view.addSubview(myDataLabel)
        myDataLabel.setUnderLine()
        view.addSubview(friendInvitationLabel)
        friendInvitationLabel.setUnderLine()
        view.addSubview(feedBackLabel)
        feedBackLabel.setUnderLine()
        view.addSubview(myDataImageView)
        view.addSubview(friendInvitationImageView)
        view.addSubview(feedBackImageView)
    }

    private func setupTapRecognizer() {
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(navigateToMyDataVC))
        myDataLabel.addGestureRecognizer(tapRecognizer)
    }

    private func setupAnchors() {
        userCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        userCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        userCardView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        userCardView.widthAnchor.constraint(equalToConstant: 335).isActive = true
        userCardView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        userCardImageView.leadingAnchor.constraint(equalTo: userCardView.leadingAnchor, constant: 8).isActive = true
        userCardImageView.trailingAnchor.constraint(equalTo: userCardView.trailingAnchor, constant: -247)
            .isActive = true
        userCardImageView.topAnchor.constraint(equalTo: userCardView.topAnchor, constant: 16).isActive = true
        userCardImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        userCardImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        qrCodeButton.leadingAnchor.constraint(equalTo: userCardView.leadingAnchor, constant: 292).isActive = true
        qrCodeButton.trailingAnchor.constraint(equalTo: userCardView.trailingAnchor, constant: -13).isActive = true
        qrCodeButton.topAnchor.constraint(equalTo: userCardView.topAnchor, constant: 13).isActive = true
        qrCodeButton.imageView?.widthAnchor.constraint(equalToConstant: 15.28).isActive = true
        qrCodeButton.imageView?.heightAnchor.constraint(equalToConstant: 15.28).isActive = true
        qrCodeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        qrCodeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        infoButton.leadingAnchor.constraint(equalTo: userCardView.leadingAnchor, constant: 291).isActive = true
        infoButton.trailingAnchor.constraint(equalTo: userCardView.trailingAnchor, constant: -13).isActive = true
        infoButton.topAnchor.constraint(equalTo: userCardView.topAnchor, constant: 130).isActive = true
        infoButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        infoButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        infoButton.imageView?.widthAnchor.constraint(equalToConstant: 15.28).isActive = true
        infoButton.imageView?.heightAnchor.constraint(equalToConstant: 15.28).isActive = true
        cardPercentLabel.leadingAnchor.constraint(equalTo: userCardView.leadingAnchor, constant: 14).isActive = true
        cardPercentLabel.trailingAnchor.constraint(equalTo: userCardView.trailingAnchor, constant: 277).isActive = true
        cardPercentLabel.bottomAnchor.constraint(equalTo: userCardView.bottomAnchor, constant: -45).isActive = true
        cardNumberLabel.leadingAnchor.constraint(equalTo: userCardView.leadingAnchor, constant: 14).isActive = true
        cardNumberLabel.trailingAnchor.constraint(equalTo: userCardView.trailingAnchor, constant: 203).isActive = true
        cardNumberLabel.bottomAnchor.constraint(equalTo: userCardView.bottomAnchor, constant: -21).isActive = true
        personalDataLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        personalDataLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 192).isActive = true
        personalDataLabel.topAnchor.constraint(equalTo: userCardView.bottomAnchor, constant: 28).isActive = true
        myDataLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 57).isActive = true
        myDataLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -155).isActive = true
        myDataLabel.topAnchor.constraint(equalTo: userCardView.bottomAnchor, constant: 72).isActive = true
        friendInvitationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 57).isActive = true
        friendInvitationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -155).isActive = true
        friendInvitationLabel.topAnchor.constraint(equalTo: userCardView.bottomAnchor, constant: 124).isActive = true
        feedBackLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 57).isActive = true
        feedBackLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -155).isActive = true
        feedBackLabel.topAnchor.constraint(equalTo: userCardView.bottomAnchor, constant: 176).isActive = true
        myDataImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23).isActive = true
        myDataImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -334).isActive = true
        myDataImageView.topAnchor.constraint(equalTo: personalDataLabel.bottomAnchor, constant: 24).isActive = true
        myDataImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        myDataImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        friendInvitationImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23).isActive = true
        friendInvitationImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -334)
            .isActive = true
        friendInvitationImageView.topAnchor.constraint(equalTo: personalDataLabel.bottomAnchor, constant: 77)
            .isActive = true
        friendInvitationImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        friendInvitationImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        feedBackImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23).isActive = true
        feedBackImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -334).isActive = true
        feedBackImageView.topAnchor.constraint(equalTo: personalDataLabel.bottomAnchor, constant: 129).isActive = true
        feedBackImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        feedBackImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }

    @objc func navigateToMyDataVC() {}
}
