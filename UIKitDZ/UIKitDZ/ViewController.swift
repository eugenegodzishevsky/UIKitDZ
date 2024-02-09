// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Это VC для первого экрана
final class ViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var mailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var enterButton: UIButton!
    @IBOutlet var eyeButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        enterButton.isEnabled = false
        mailTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }

    // MARK: - Public Methods

    @objc func editingChanged(_ textField: UITextField) {
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

    // MARK: - IBOutlets

    @IBAction func enterButton(_ sender: Any) {}
    @IBAction func eyeButton(_ sender: Any) {}
}
