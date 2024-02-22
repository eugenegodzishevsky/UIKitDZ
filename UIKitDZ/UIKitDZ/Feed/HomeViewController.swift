// HomeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран ленты
class HomeViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let storiesIdentifire = "StoriesCell"
        static let postsIdentifire = "NewPostCell"
        static let recomendationsIdentifire = "RecommendedCell"
        static let storiesHeightCell = 100
        static let postsHeightCell = 450
        static let recomendationsHeightCell = 270
    }

    // MARK: - Visual Components

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: Private Properties

    private var items: [CellTypes] = [
        .stories([
            Stories(imageName: "story1", name: "Ваша история", addButton: true),
            Stories(imageName: "story2", name: "lavanda123", addButton: false),
            Stories(imageName: "story2", name: "lavanda123", addButton: false),
            Stories(imageName: "story2", name: "lavanda123", addButton: false),
            Stories(imageName: "story2", name: "lavanda123", addButton: false),
            Stories(imageName: "story2", name: "lavanda123", addButton: false),
            Stories(imageName: "story2", name: "lavanda123", addButton: false)
        ]),
        .post([
            Post(
                imageUserName: "avatar",
                username: "tur_v_dagestan",
                postImageName: ["imagenature", "imagenature2", "imagenature", "imagenature2"],
                numberLikes: "Нравится: 201",
                userComent: """
                tur_v_dagestan Насладитесь красотой природы.
                Забронировать тур в Дагестан можно уже сейчас!
                """,
                time: "10 минут назад"
            )
        ]),
        .recommended([
            Recommended(imageName: "account", label: "cremea_082"),
            Recommended(imageName: "account1", label: "mary_pol"),
            Recommended(imageName: "account1", label: "mary_pol")
        ]),
        .post([
            Post(
                imageUserName: "avatar",
                username: "tur_v_dagestan",
                postImageName: ["imagenature"],
                numberLikes: "Нравится: 201",
                userComent: """
                tur_v_dagestan Насладитесь красотой природы.
                Забронировать тур в Дагестан можно уже сейчас!
                """,
                time: "10 минут назад"
            ),
            Post(
                imageUserName: "avatar",
                username: "tur_v_dagestan",
                postImageName: ["imagenature", "imagenature2"],
                numberLikes: "Нравится: 201",
                userComent: """
                tur_v_dagestan Насладитесь красотой природы.
                Забронировать тур в Дагестан можно уже сейчас!
                """,
                time: "10 минут назад"
            ),
            Post(
                imageUserName: "avatar",
                username: "tur_v_dagestan",
                postImageName: ["imagenature"],
                numberLikes: "Нравится: 201",
                userComent: """
                tur_v_dagestan Насладитесь красотой природы.
                Забронировать тур в Дагестан можно уже сейчас!
                """,
                time: "10 минут назад"
            ),
            Post(
                imageUserName: "avatar",
                username: "tur_v_dagestan",
                postImageName: ["imagenature"],
                numberLikes: "Нравится: 201",
                userComent: """
                tur_v_dagestan Насладитесь красотой природы.
                Забронировать тур в Дагестан можно уже сейчас!
                """,
                time: "10 минут назад"
            ),
            Post(
                imageUserName: "avatar",
                username: "tur_v_dagestan",
                postImageName: ["imagenature", "imagenature"],
                numberLikes: "Нравится: 201",
                userComent: """
                tur_v_dagestan Насладитесь красотой природы.
                Забронировать тур в Дагестан можно уже сейчас!
                """,
                time: "10 минут назад"
            )
        ])
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupBarItems()
    }

    // MARK: - Private Methods

    private func setupBarItems() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "logo")?.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: nil
        )

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "massages")?.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: nil
        )
    }

    private func setupTableView() {
        tableView.register(StoriesCell.self, forCellReuseIdentifier: Constants.storiesIdentifire)
        tableView.register(NewPostCell.self, forCellReuseIdentifier: Constants.postsIdentifire)
        tableView.register(RecommendedCell.self, forCellReuseIdentifier: Constants.recomendationsIdentifire)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .clear
        view.addSubview(tableView)

        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

// MARK: - NotificationsViewController + UITableViewDelegate

extension HomeViewController: UITableViewDelegate {}

// MARK: - NotificationsViewController + UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        print(items.count)
        return items.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cell = items[section]
        switch cell {
        case .stories:
            return 1
        case let .post(posts):
            return posts.count
        case .recommended:
            return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]

        switch item {
        case let .stories(info):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.storiesIdentifire,
                for: indexPath
            ) as? StoriesCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.setupCell(with: info)
            return cell
        case let .post(info):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.postsIdentifire,
                for: indexPath
            ) as? NewPostCell
            else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.configure(with: info[indexPath.row])
            return cell
        case let .recommended(info):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.recomendationsIdentifire,
                for: indexPath
            ) as? RecommendedCell
            else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.configure(with: info)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = items[indexPath.section]
        switch cell {
        case .stories:
            return CGFloat(Constants.storiesHeightCell)
        case .post:
            return CGFloat(Constants.postsHeightCell)
        case .recommended:
            return CGFloat(Constants.recomendationsHeightCell)
        }
    }
}
