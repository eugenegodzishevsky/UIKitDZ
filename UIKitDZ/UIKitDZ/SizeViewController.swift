// SizeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol SizeViewControllerDelegate: AnyObject {
    func didSelectSize(size: String)
}

final class SizeViewController: UIViewController {
    weak var delegate: SizeViewControllerDelegate?

    private var sizeLabels: [UILabel] = []
    let sizes = ["35 EU", "36 EU", "37 EU", "38 EU", "39 EU"]

    private lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeTapped), for: .touchUpInside)
        return button
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Выберите размер"
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSizeViews(sizes: sizes)
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(cancelButton)

        setupTitleLabel()
        setupCancelButton()
    }

    private func setupTitleLabel() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func setupCancelButton() {
        NSLayoutConstraint.activate([
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            cancelButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            cancelButton.widthAnchor.constraint(equalToConstant: 24),
            cancelButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    private func setupSizeViews(sizes: [String]) {
        var previousLabel: UILabel?

        for size in sizes {
            let label = UILabel()
            label.text = size
            label.textAlignment = .left
            label.translatesAutoresizingMaskIntoConstraints = false
            label.isUserInteractionEnabled = true

            view.addSubview(label)
            sizeLabels.append(label)

            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
            label.addGestureRecognizer(tapGestureRecognizer)

            let underline = UIView()
            underline.backgroundColor = .black
            underline.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(underline)

            NSLayoutConstraint.activate([
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                label.widthAnchor.constraint(equalToConstant: 335),
                underline.leadingAnchor.constraint(equalTo: label.leadingAnchor),
                underline.trailingAnchor.constraint(equalTo: label.trailingAnchor),
                underline.heightAnchor.constraint(equalToConstant: 1),
                underline.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 5)
            ])

            if let previousLabel = previousLabel {
                label.topAnchor.constraint(equalTo: previousLabel.bottomAnchor, constant: 20).isActive = true
            } else {
                label.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
            }

            previousLabel = label
        }
    }

    @objc private func labelTapped(_ sender: UITapGestureRecognizer) {
        if let label = sender.view as? UILabel, let size = label.text {
            print("label tapped")
            delegate?.didSelectSize(size: size)
            dismiss(animated: true)
        }
    }

    @objc private func closeTapped() {
        dismiss(animated: true)
    }
}
