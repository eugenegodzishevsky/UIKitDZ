// WordModel.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Структура со свойством, разворачивающим введенную строку
struct Word {
    var text: String
    var reversed: String {
        String(text.reversed())
    }
}
