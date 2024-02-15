// UIViewController+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

extension UIViewController {
    func makeCustomLabel(
        text: String,
        textColor: UIColor,
        font: String,
        fontSize: CGFloat,
        alignment: NSTextAlignment
    ) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.textAlignment = alignment
        label.font = UIFont(name: font, size: fontSize)
        label.textColor = textColor
        return label
    }

    func makeCustomImageView(image: String, tintColor: UIColor) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: image)
        imageView.tintColor = tintColor
        return imageView
    }
}
