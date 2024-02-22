// Model.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Константы
enum Constants {
    static let firstAvatarName = "story1"
    static let secondAvatarName = "story2"
    static let firstNameLabel = "Ваша история"
    static let secondNameLabel = "Lavanda123"
    static let addStoryLabel = "addStory"
    static let homeTabBarName = "Лента"
    static let notificationsTabBarName = "Уведомления"
    static let profileTabBarName = "Профиль"
    static let homeTabBarImage = "home"
    static let notificationsTabBarImage = "notifications"
    static let profileTabBarImage = "profile"
    static let blueColor = "myBlue"
    static let verdana = "Verdana"
    static let verdanaBold = "Verdana-Bold"
    static let errorMessage = "init(coder:) has not been implemented"
    static let plusLabel = "+"
    static let storiesIdentifier = "StoriesCell"
    static let newPostIdentifier = "NewPostCell"
    static let avatarImageView = "avatar"
    static let natureImageView = "imagenature"
    static let natureImageView1 = "imagenature2"
    static let usernameLabel = "tur_v_dagestan"
    static let likes201 = "Нравится: 201"
    static let optionsButton = "options"
    static let likeButton = "like"
    static let messageButton = "message_circle"
    static let sendButton = "papper_plane"
    static let saveButton = "save_button"
    static let tourMessage =
        "tur_v_dagestan Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!"
    static let smallAvatar = "smallAvatar"
    static let comment = "Комментировать ..."
    static let tenMinutes = "10 минут назад ..."
}

/// типы строк с постами
enum CountRows {
    case stories
    case firstPost
    case recommended
    case posts
}

/// модель поста
struct Post {
    let avatarImageName: String
    let nameTitle: String
    let postImages: [String]
    let likesCount: String
    let descriptionPost: String
    let time: String
}

/// модель историй
struct Stories {
    let avatarImageName: String
    let nameLabel: String
    let addImageName: String?
}

/// модель
struct RMLinkStorage {
    let stories: [Stories] = [
        .init(
            avatarImageName: Constants.firstAvatarName,
            nameLabel: Constants.firstNameLabel,
            addImageName: Constants.addStoryLabel
        ),
        .init(avatarImageName: Constants.secondAvatarName, nameLabel: Constants.secondNameLabel, addImageName: nil),
        .init(avatarImageName: Constants.secondAvatarName, nameLabel: Constants.secondNameLabel, addImageName: nil),
        .init(avatarImageName: Constants.secondAvatarName, nameLabel: Constants.secondNameLabel, addImageName: nil),
        .init(avatarImageName: Constants.secondAvatarName, nameLabel: Constants.secondNameLabel, addImageName: nil),
        .init(avatarImageName: Constants.secondAvatarName, nameLabel: Constants.secondNameLabel, addImageName: nil),
        .init(avatarImageName: Constants.secondAvatarName, nameLabel: Constants.secondNameLabel, addImageName: nil),
        .init(avatarImageName: Constants.secondAvatarName, nameLabel: Constants.secondNameLabel, addImageName: nil),
        .init(avatarImageName: Constants.secondAvatarName, nameLabel: Constants.secondNameLabel, addImageName: nil),
    ]

    let posts: [Post] = [.init(
        avatarImageName: Constants.firstAvatarName,
        nameTitle: Constants.usernameLabel,
        postImages: [Constants.natureImageView, Constants.natureImageView1],
        likesCount: Constants.likes201,
        descriptionPost: Constants.tourMessage,
        time: Constants.tenMinutes
    )]
}
