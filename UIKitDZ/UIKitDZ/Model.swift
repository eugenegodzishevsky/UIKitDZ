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
}

/// модель
struct Post {
    let avatarImageName: String
    let nameTitle: String
    let postImages: [String]
    let likesCount: String
    let descriptionPost: String
    let isLikePressed: Bool
}

/// модель
///
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
        .init(avatarImageName: Constants.secondAvatarName, nameLabel: Constants.secondNameLabel, addImageName: nil)
    ]

//    let posts: [Post] = [.init(
//        avatarImageName: "story1",
//        nameTitle: "tur_v_dagestan",
//        postImages: ["story1", "story2"],
//        likesCount: "42",
//        descriptionPost: "eeeeeeeewwwwwwwqqqqq",
//        isLikePressed: true
//    )]
}
