// HomeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран ленты
class HomeViewController: UIViewController {
    private lazy var logoItem: UIBarButtonItem = {
        let item = UIBarButtonItem(
            image: UIImage(named: "logo")
        )
        item.tintColor = .black
        return item
    }()

    private lazy var messageItem: UIBarButtonItem = {
        let item = UIBarButtonItem(
            image: UIImage(named: "notifications")
        )
        item.tintColor = .black
        return item
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        print("ViewDidLoadHome")

        navigationItem.leftBarButtonItem = logoItem
        navigationItem.rightBarButtonItem = messageItem
        // view.addSubview(logoItem)
    }
}
