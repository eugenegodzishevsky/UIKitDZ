// ConstraintsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран на констраинтах
final class ConstraintsViewController: UIViewController {
    // MARK: - Visual Components

    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 50
        return view
    }()

    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 50
        return view
    }()

    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 50
        return view
    }()

    private let blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Lyfe Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(blackView)
        blackView.addSubview(redView)
        blackView.addSubview(yellowView)
        blackView.addSubview(greenView)

        NSLayoutConstraint.activate([
            NSLayoutConstraint(
                item: yellowView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerX,
                multiplier: 1,
                constant: 0
            ),

            .init(
                item: yellowView,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerY,
                multiplier: 1,
                constant: 0
            ),

            .init(
                item: yellowView,
                attribute: .width,
                relatedBy: .equal,
                toItem: .none,
                attribute: .width,
                multiplier: 1,
                constant: 100
            ),

            .init(
                item: yellowView,
                attribute: .height,
                relatedBy: .equal,
                toItem: .none,
                attribute: .height,
                multiplier: 1,
                constant: 100
            ),

            .init(
                item: redView,
                attribute: .height,
                relatedBy: .equal,
                toItem: .none,
                attribute: .height,
                multiplier: 1,
                constant: 100
            ),

            .init(
                item: redView,
                attribute: .width,
                relatedBy: .equal,
                toItem: .none,
                attribute: .width,
                multiplier: 1,
                constant: 100
            ),

            .init(
                item: redView,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .top,
                multiplier: 1,
                constant: -10
            ),

            .init(
                item: redView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerX,
                multiplier: 1,
                constant: 0
            ),

            .init(
                item: greenView,
                attribute: .height,
                relatedBy: .equal,
                toItem: .none,
                attribute: .height,
                multiplier: 1,
                constant: 100
            ),

            .init(
                item: greenView,
                attribute: .width,
                relatedBy: .equal,
                toItem: .none,
                attribute: .width,
                multiplier: 1,
                constant: 100
            ),

            .init(
                item: greenView,
                attribute: .top,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .bottom,
                multiplier: 1,
                constant: 10
            ),

            .init(
                item: greenView,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerX,
                multiplier: 1,
                constant: 0
            ),

            .init(
                item: blackView,
                attribute: .top,
                relatedBy: .equal,
                toItem: redView,
                attribute: .top,
                multiplier: 1,
                constant: -10
            ),

            .init(
                item: blackView,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: greenView,
                attribute: .bottom,
                multiplier: 1,
                constant: 10
            ),

            .init(
                item: blackView,
                attribute: .leading,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .leading,
                multiplier: 1,
                constant: -10
            ),

            .init(
                item: blackView,
                attribute: .trailing,
                relatedBy: .equal,
                toItem: yellowView,
                attribute: .trailing,
                multiplier: 1,
                constant: 10
            )
        ])
    }
}
