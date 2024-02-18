// UIViewController+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

extension UIViewController {
    enum Constants {
        static let backgroundColor = UIColor(red: 248 / 255, green: 248 / 255, blue: 248 / 255, alpha: 1.0)
        static let buttonBackgroundColor = UIColor(named: "myPink")
        static let cornerRadius: CGFloat = 12
        static let shadowOffset = CGSize(width: 0, height: 4)
        static let shadowOpaciry: Float = 0.3
        static let verdana = "Verdana"
        static let verdanaBold = "Verdana-Bold"
    }

    /// создает кастомный label
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

    /// создает кастомный imageview
    func makeCustomImageView(image: String, tintColor: UIColor) -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: image)
        imageView.tintColor = tintColor
        return imageView
    }

    /// создает кастомный textfield
    func makeCustomTextField(yAnchor: CGFloat) -> UITextField {
        let textField = UITextField()
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: yAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 335).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: textField.frame.height))
        textField.layer.cornerRadius = 12
        textField.backgroundColor = Constants.backgroundColor
        return textField
    }

    /// создает кастомную кнопку
    func makeCustomButton(text: String) -> UIButton {
        let button = UIButton()
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont(name: Constants.verdanaBold, size: 16)
        button.titleLabel?.textColor = .white
        button.setTitle(text, for: .normal)
        button.backgroundColor = .systemPink
        button.titleLabel?.textAlignment = .center
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 557).isActive = true
        button.widthAnchor.constraint(equalToConstant: 335).isActive = true
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.layer.cornerRadius = Constants.cornerRadius
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = Constants.shadowOffset
        button.layer.shadowOpacity = Constants.shadowOpaciry
        return button
    }
}
