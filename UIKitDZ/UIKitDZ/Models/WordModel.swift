// WordModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Структура
struct Word {
    var text: String
    var reversed: String {
        String(text.reversed())
    }
}
