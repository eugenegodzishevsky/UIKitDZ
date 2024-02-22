// HomeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран ленты
class HomeViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let logoImageName = "logo"
        static let messagesImageName = "notifications"
    }

    // MARK: - Private Properties

    // MARK: - Visual Components

    private let tableView = UITableView()
    let rmLinkStorage = RMLinkStorage()

    private let cellsType: [CountRows] = [
        .stories,
        .firstPost,
        .recommended,
        .posts
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavButtons()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(StoriesCell.self, forCellReuseIdentifier: StoriesCell.identifier)
        tableView.register(NewPostCell.self, forCellReuseIdentifier: NewPostCell.identifier)
        tableView.register(RecommendedCell.self, forCellReuseIdentifier: RecommendedCell.identifier)
        tableView.register(PostsCell.self, forCellReuseIdentifier: PostsCell.identifier)

        tableView.frame = view.bounds
        view.addSubview(tableView)
        view.backgroundColor = .white
    }

    private func setupNavButtons() {
        lazy var logoItem: UIBarButtonItem = {
            let item = UIBarButtonItem(
                image: UIImage(named: Constants.logoImageName)
            )
            item.tintColor = .black
            return item
        }()

        lazy var messageItem: UIBarButtonItem = {
            let item = UIBarButtonItem(
                image: UIImage(named: Constants.messagesImageName)
            )
            item.tintColor = .black
            return item
        }()

        navigationItem.leftBarButtonItem = logoItem
        navigationItem.rightBarButtonItem = messageItem
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        cellsType.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cellType = cellsType[section]
        switch cellType {
        case .stories, .firstPost, .recommended:
            return 1
        case .posts:
            return 6
            // return rmLinkStorage.posts.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cells = cellsType[indexPath.section]
        switch cells {
        case .stories:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: StoriesCell.identifier,
                for: indexPath
            ) as? StoriesCell
            else { return UITableViewCell() }
            cell.setupCell(with: rmLinkStorage.stories)
            return cell
        case .firstPost:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: NewPostCell.identifier,
                for: indexPath
            ) as? NewPostCell
            else { return UITableViewCell() }
            cell.setupCell(with: rmLinkStorage.posts[indexPath.row])
            return cell
        case .recommended:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: RecommendedCell.identifier,
                for: indexPath
            ) as? RecommendedCell
            else { return UITableViewCell() }
            cell.setupCell()
            return cell
        case .posts:
            guard let cell = tableView
                .dequeueReusableCell(withIdentifier: PostsCell.identifier, for: indexPath) as? PostsCell
            else { return UITableViewCell() }
            cell.setupCell()
            // cell.setupCell(posts: rmLinkStorage.posts[indexPath.row])
            return cell
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellType = cellsType[indexPath.section]
        switch cellType {
        case .stories:
            return 100
        case .firstPost:
            return 450
        case .recommended:
            return 270
        case .posts:
            return 400
        }
    }
}
