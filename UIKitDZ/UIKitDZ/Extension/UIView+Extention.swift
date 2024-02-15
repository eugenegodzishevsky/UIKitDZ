// UIView+Extention.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Позволяет создавать линии под любыми ui-наследниками
extension UIView {
    enum Constants {
        static let leadingAnchor: CGFloat = -40
        static let topAnchor: CGFloat = 7
        static let width: CGFloat = 335
        static let height: CGFloat = 1
        static let backgroundColor = UIColor(red: 236 / 255, green: 235 / 255, blue: 235 / 255, alpha: 1.0)
    }

    /// создает линию
    func setUnderLine() {
        let bottomLine = UIView()
        addSubview(bottomLine)
        bottomLine.translatesAutoresizingMaskIntoConstraints = false
        bottomLine.backgroundColor = Constants.backgroundColor
        bottomLine.widthAnchor.constraint(equalToConstant: Constants.width).isActive = true
        bottomLine.heightAnchor.constraint(equalToConstant: Constants.height).isActive = true
        bottomLine.topAnchor.constraint(equalTo: bottomAnchor, constant: Constants.topAnchor).isActive = true
        bottomLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.leadingAnchor).isActive = true
    }
}
