// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контроллер экрана авторизации
final class ViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var mailTextField: UITextField!
    @IBOutlet private var passwordTextField: UITextField!
    @IBOutlet private var enterButton: UIButton!
    @IBOutlet private var eyeButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        enterButton.isEnabled = false
        mailTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }

    // MARK: - Private Methods

    @objc private func editingChanged(_ textField: UITextField) {
        guard let email = mailTextField.text,
              !email.isEmpty,
              let password = passwordTextField.text,
              !password.isEmpty
        else {
            enterButton.isEnabled = false
            enterButton.backgroundColor = .systemMint
            return
        }
        enterButton.isEnabled = true
        enterButton.backgroundColor = .systemTeal
    }
}
