// AncorsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран с констрейнтами на якорях
final class AncorsViewController: UIViewController {
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

    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("to Constraints", for: .normal)
        button.backgroundColor = .blue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
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
        view.addSubview(button)
        blackView.addSubview(redView)
        blackView.addSubview(yellowView)
        blackView.addSubview(greenView)

        NSLayoutConstraint.activate([
            yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            yellowView.widthAnchor.constraint(equalToConstant: 100),
            yellowView.heightAnchor.constraint(equalTo: yellowView.widthAnchor),

            redView.widthAnchor.constraint(equalToConstant: 100),
            redView.heightAnchor.constraint(equalTo: redView.widthAnchor),
            redView.bottomAnchor.constraint(equalTo: yellowView.topAnchor, constant: -10),
            redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            greenView.widthAnchor.constraint(equalToConstant: 100),
            greenView.heightAnchor.constraint(equalTo: greenView.widthAnchor),
            greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 10),
            greenView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            blackView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -10),
            blackView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 10),
            blackView.leadingAnchor.constraint(equalTo: yellowView.leadingAnchor, constant: -10),
            blackView.trailingAnchor.constraint(equalTo: yellowView.trailingAnchor, constant: 10),

            button.topAnchor.constraint(equalTo: blackView.topAnchor, constant: 30),
            button.leadingAnchor.constraint(equalTo: blackView.trailingAnchor, constant: 10)

        ])
    }

    @objc private func buttonTapped() {
        present(ConstraintsViewController(), animated: true)
    }
}
