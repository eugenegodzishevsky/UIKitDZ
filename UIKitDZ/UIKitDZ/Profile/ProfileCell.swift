// ProfileCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ячейка профиля
class ProfileCell: UITableViewCell {}

// MARK: - Constants

private enum Constants {
    static let verdana = "Verdana"
    static let verdanaBold = "Verdana-Bold"
    static let plus = "plus"
    static let change = "Изменить"
    static let share = "Поделиться профилем"
    static let addPeople = "addPeople"
    static let publications = "67"
    static let publicationsLabel = "Публикации"
    static let subscribers = "458"
    static let subscribersLabel = "Подписчики"
    static let subscribe = "120"
    static let subscribeLabel = "Подписки"
}

// MARK: - Private Properties

private let userImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
}()

private let addButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 13
    button.clipsToBounds = true
    button.setImage(UIImage(systemName: Constants.plus), for: .normal)
    button.tintColor = .white
    button.backgroundColor = UIColor(red: 233 / 255, green: 70 / 255, blue: 94 / 255, alpha: 1.0)
    return button
}()

private let namePerson: UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.font = UIFont(name: Constants.verdanaBold, size: 14)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
}()

// MARK: - Initializers
