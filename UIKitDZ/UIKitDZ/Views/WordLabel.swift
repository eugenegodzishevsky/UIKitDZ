// WordLabel.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс
class WordLabel: UILabel {
    func configure(with word: Word) {
        text = word.text
    }
}
