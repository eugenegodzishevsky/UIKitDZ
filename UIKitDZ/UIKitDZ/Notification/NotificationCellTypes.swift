// NotificationCellTypes.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// коментарий или предложка подписаться
enum CellNotificationType {
    /// комент без кнопки
    case comment([CommentItemCell])
    /// комент с кнопкой
    case subscribe([SubscribeItemCell])
}
