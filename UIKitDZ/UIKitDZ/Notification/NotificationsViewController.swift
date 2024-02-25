// NotificationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран уведомлений
final class NotificationsViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let avatarImageName = ["ava1", "ava2", "ava3", "ava4"]
        static let commentLabel = [
            "lavanda123 понравился ваш комментарий: \"Очень красиво!\" 12ч",
            "lavanda123 упомянул(-а) вас в комментарии: @rm Спасибо! 12ч",
            "lavanda123 понравился ваш комментарий: \"Это где?\" 3д.",
            "12miho появился(-ась) в RMLink. Вы можете быть знакомы 3д.",
            "lavanda123 подписался(-ась) на ваши новости 5д.",
            "lavanda123 понравился ваш комментарий: \"Ты вернулась?\" 7д.",
            "markS появился(-ась) в RMLink. Вы можете быть знакомы 8д.",
            "sv_neit появился(-ась) в RMLink. Вы можете быть знакомы 8д."
        ]

        static let navigationItemText = "Уведомления"
        static let picName = "pic"
        static let picNameSecond = "pic2"
        static let buttonName = ["grayButton", "blueButton"]
        static let identifierComments = "CommentCell"
        static let identifierSubscribe = "SubscribeCell"
        static let todayTitle = "Сегодня"
        static let onWeekTitle = "На этой неделе"
    }

    let navigationBar = UINavigationBar()
    private let tableView = UITableView()

    /// массивы объектов
    private var today: [CellNotificationType] = [
        .comment([
            CommentItemCell(
                userImageName: Constants.avatarImageName[0],
                userText: Constants.commentLabel[0],
                imageName: Constants.picName
            )
        ]),
        .comment([
            CommentItemCell(
                userImageName: Constants.avatarImageName[0],
                userText: Constants.commentLabel[1],
                imageName: Constants.picName
            )
        ])
    ]

    private var onWeek: [CellNotificationType] = [
        .comment([
            CommentItemCell(
                userImageName: Constants.avatarImageName[0],
                userText: Constants.commentLabel[2],
                imageName: Constants.picNameSecond
            )
        ]),

        .subscribe([
            SubscribeItemCell(
                imageUserName: Constants.avatarImageName[1],
                userComment: Constants.commentLabel[3]
            )
        ]),
        .subscribe([
            SubscribeItemCell(
                imageUserName: Constants.avatarImageName[0],
                userComment: Constants.commentLabel[4]
            )
        ]),

        .comment([
            CommentItemCell(
                userImageName: Constants.avatarImageName[0],
                userText: Constants.commentLabel[5],
                imageName: Constants.picNameSecond
            )
        ]),

        .subscribe([
            SubscribeItemCell(
                imageUserName: Constants.avatarImageName[2],
                userComment: Constants.commentLabel[6]
            )
        ]),
        .subscribe([
            SubscribeItemCell(
                imageUserName: Constants.avatarImageName[3],
                userComment: Constants.commentLabel[7]
            )
        ])
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        navigationItem.title = Constants.navigationItemText
        navigationController?.navigationBar.prefersLargeTitles = true
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.register(CommentCell.self, forCellReuseIdentifier: Constants.identifierComments)
        tableView.register(
            SubscribeCell.self,
            forCellReuseIdentifier: Constants.identifierSubscribe
        )

        tableView.frame = view.bounds
        view.addSubview(tableView)
        view.backgroundColor = .white
    }
}

// MARK: - TableView DataSource Methods

extension NotificationsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return today.count
        case 1:
            return onWeek.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let item = today[indexPath.row]
            switch item {
            case let .comment(comments):
                guard let commentCell = tableView.dequeueReusableCell(
                    withIdentifier: Constants.identifierComments,
                    for: indexPath
                ) as? CommentCell,
                    let comment = comments.first else { fatalError() }
                commentCell.configure(with: comment)
                return commentCell

            case let .subscribe(subscribe):
                guard let commentCell = tableView.dequeueReusableCell(
                    withIdentifier: Constants.identifierSubscribe,
                    for: indexPath
                ) as? SubscribeCell, let subscribeItem = subscribe.first else { return UITableViewCell() }
                commentCell.configure(with: subscribeItem)
                return commentCell
            }

        case 1:
            let item = onWeek[indexPath.row]
            switch item {
            case let .comment(comments):
                guard let subscribeCell = tableView.dequeueReusableCell(
                    withIdentifier: Constants.identifierComments,
                    for: indexPath
                ) as? CommentCell, let comment = comments.first else { return UITableViewCell() }
                subscribeCell.configure(with: comment)
                return subscribeCell

            case let .subscribe(subscribe):
                guard let subscribeCell = tableView.dequeueReusableCell(
                    withIdentifier: Constants.identifierSubscribe,
                    for: indexPath
                ) as? SubscribeCell, let subscribeItem = subscribe.first else { return UITableViewCell() }
                subscribeCell.configure(with: subscribeItem)
                return subscribeCell
            }
        default:
            return UITableViewCell()
        }
    }

    private func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = section == 0 ? Constants.todayTitle : Constants.onWeekTitle
        return label
    }
}
