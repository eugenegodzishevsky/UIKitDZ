// PostType.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// модель поста
struct Post {
    // аватар
    let imageUserName: String
    // имя аккаунта
    let username: String
    // картинка
    let postImageName: [String]
    // количество лайков
    let numberLikes: String
    // комент
    let userComent: String
    // время поста
    let time: String
}
