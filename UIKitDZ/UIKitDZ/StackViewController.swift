// StackViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// второй экран со стаквью

// MARK: - Visual Components

final class StackViewController: UIViewController {
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

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("to Ancors", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [redView, yellowView, greenView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10.0
        stack.distribution = .fillEqually
        stack.axis = .vertical
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    // MARK: - Private methods

    private func setupUI() {
        view.addSubview(blackView)
        blackView.addSubview(stackView)
        view.addSubview(button)

        NSLayoutConstraint.activate([
            blackView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: -10),
            blackView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            blackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -10),
            blackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 10),

            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),

            button.topAnchor.constraint(equalTo: blackView.topAnchor, constant: 30),
            button.leadingAnchor.constraint(equalTo: blackView.trailingAnchor, constant: 20)
        ])
    }

    @objc private func buttonTapped() {
        present(AncorsViewController(), animated: true)
    }
}
