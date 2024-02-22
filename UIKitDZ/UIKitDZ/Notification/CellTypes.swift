// CellTypes.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// коментарий или предложка подписаться
enum CellNotificationType {
    case comment([CommentItemCell])
    case subscribe([SubscribeItemCell])
}

/// комент с кнопкой
struct SubscribeItemCell {
    let imageUserName: String
    let userComment: String
}

/// комент простой
struct CommentItemCell {
    var userImageName: String
    var userText: String
    var imageName: String
}
