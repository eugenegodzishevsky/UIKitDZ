// CellTypes.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

// типы строк с постами
enum CellTypes {
    // истории
    case stories([Stories])
    // пост
    case post([Post])
    // рекомендации
    case recommended([Recommended])
}
