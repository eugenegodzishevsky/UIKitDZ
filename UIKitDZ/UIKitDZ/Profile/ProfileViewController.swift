// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран профиля
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let verdanaBold = "Verdana-Bold"
        static let profileCellIdentifire = "ProfileCell"
        static let profileHighlightsCellIdentifire = "ProfileHighlightsCell"
        static let profilePhotosCellIdentifire = "ProfilePhotosCell"
    }

    // MARK: - Private Properties

    private let tableView = UITableView()
    let navigationBar = UINavigationBar()

    private let items: [ProfileCellTypes] = [
        .profile(Profile(
            userImageName: "story1",
            accountName: "Мария Иванова",
            accountLabel: "Консультат",
            link: "www.spacex.com"
        )),
        .highlights([
            Highlights(imageName: "space", text: "Запуск"),
            Highlights(imageName: "space1", text: "Луна"),
            Highlights(imageName: "space2", text: "Космана..."),
            Highlights(imageName: "space3", text: "Космос"),
            Highlights(imageName: "space", text: "Запуск"),
            Highlights(imageName: "space1", text: "Луна")
        ]),
        .photos
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        setupRefreshControl()
        setupNavigationItems()
    }

    // MARK: - Private Methods

    private func setupNavigationItems() {
        let optionButton = UIBarButtonItem(
            image: UIImage(named: "optionButton"),
            style: .plain,
            target: self,
            action: nil
        )
        optionButton.tintColor = .black
        let plusButton = UIBarButtonItem(
            image: UIImage(named: "plusButton"),
            style: .plain,
            target: self,
            action: nil
        )
        plusButton.tintColor = .black
        navigationItem.rightBarButtonItems = [optionButton, plusButton]

        let lockButton = UIButton(type: .custom)
        lockButton.tintColor = .black
        lockButton.setImage(UIImage(named: "lock"), for: .normal)
        lockButton.setTitle("  mary_rmLink", for: .normal)
        lockButton.setTitleColor(.black, for: .normal)
        lockButton.titleLabel?.font = UIFont(name: Constants.verdanaBold, size: 18)
        lockButton.titleLabel?.textAlignment = .center
        lockButton.sizeToFit()

        let barButtonLeft = UIBarButtonItem(customView: lockButton)
        navigationItem.leftBarButtonItem = barButtonLeft
    }

    private func setupRefreshControl() {
        let refreshControl: UIRefreshControl = {
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
            return refreshControl
        }()
        tableView.refreshControl = refreshControl
    }

    @objc private func refresh(sender: UIRefreshControl) {
        sender.endRefreshing()
    }

    private func setupTableView() {
        tableView.register(ProfileCell.self, forCellReuseIdentifier: Constants.profileCellIdentifire)
        tableView.register(
            ProfileHighlightsCell.self,
            forCellReuseIdentifier: Constants.profileHighlightsCellIdentifire
        )
        tableView.register(ProfilePhotosCell.self, forCellReuseIdentifier: Constants.profilePhotosCellIdentifire)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = .clear

        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func showWkWebViewController() {
        let webViewController = WKWebViewController()
        present(webViewController, animated: true)
    }
}

extension ProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case let .profile(info):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.profileCellIdentifire,
                for: indexPath
            ) as? ProfileCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.configure(with: info)
            cell.present = { [weak self] in
                self?.showWkWebViewController()
            }
            return cell
        case let .highlights(info):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.profileHighlightsCellIdentifire,
                for: indexPath
            ) as? ProfileHighlightsCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.setupCell(with: info)
            return cell
        case .photos:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: Constants.profilePhotosCellIdentifire,
                for: indexPath
            ) as? ProfilePhotosCell else { return UITableViewCell() }
            return cell
        }
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = items[indexPath.row]
        switch cell {
        case .profile:
            return CGFloat(230)
        case .highlights:
            return CGFloat(100)
        case .photos:
            return CGFloat(380)
        }
    }
}
