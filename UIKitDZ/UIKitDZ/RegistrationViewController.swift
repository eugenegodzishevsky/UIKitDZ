// RegistrationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// вью контроллер страницы регистрации
final class RegistrationViewController: UIViewController {
    // MARK: - Private Properties
    
    private var emailTextField: UITextField!
    private var passwordTextField: UITextField!
    private var loginButton: UIButton!
    private var faceIDLabel: UILabel!
    private var faceIDSwitch: UISwitch!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCakeImage()
        setupReminderLabel()
        setupSignInLabel()
        setupEmailLabel()
        setupPasswordlLabel()
        setupEmailTextField()
        setupPasswordTextField()
        setupLines()
        setupLoginButton()
        setupEyeImage()
        setupFaceIDLabel()
        setupFaceIDSwitch()
        
        emailTextField?.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        passwordTextField?.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        loginButton?.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
    }
    
    // MARK: - Private Methods
    
    private func setupCakeImage() {
        let image = UIImageView(frame: CGRect(x: 125, y: 70, width: 125, height: 125))
        image.image = .init(named: "cake")
        view.addSubview(image)
    }
    
    private func setupReminderLabel() {
        let label = UILabel(frame: CGRect(x: 100, y: 200, width: 175, height: 44))
        label.text = "Birthday\nReminder"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 18)
        label.textColor = UIColor(
            red: 90.0 / 255.0,
            green: 67.0 / 255.0,
            blue: 148.0 / 255.0,
            alpha: 1
        )
        view.addSubview(label)
    }
    
    private func setupSignInLabel() {
        let label = UILabel(frame: CGRect(x: 20, y: 256, width: 195, height: 51))
        label.text = "Sign in"
        label.font = UIFont(name: "Verdana", size: 26)
        label.textColor = UIColor(
            red: 233.0 / 255.0,
            green: 79.0 / 255.0,
            blue: 94.0 / 255.0,
            alpha: 1
        )
        view.addSubview(label)
    }
    
    private func setupEmailLabel() {
        let label = UILabel(frame: CGRect(x: 20, y: 318, width: 175, height: 19))
        label.text = "Email"
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = UIColor(
            red: 233.0 / 255.0,
            green: 79.0 / 255.0,
            blue: 94.0 / 255.0,
            alpha: 1
        )
        view.addSubview(label)
    }
    
    private func setupPasswordlLabel() {
        let label = UILabel(frame: CGRect(x: 20, y: 393, width: 175, height: 19))
        label.text = "Password"
        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = UIColor(
            red: 233.0 / 255.0,
            green: 79.0 / 255.0,
            blue: 94.0 / 255.0,
            alpha: 1
        )
        view.addSubview(label)
    }
    
    private func setupEmailTextField() {
        emailTextField = UITextField(frame: CGRect(x: 20, y: 347, width: 175, height: 17))
        emailTextField.placeholder = "Typing email"
        view.addSubview(emailTextField)
    }
    
    private func setupPasswordTextField() {
        passwordTextField = UITextField(frame: CGRect(x: 20, y: 422, width: 129, height: 17))
        passwordTextField.placeholder = "Typing password"
        view.addSubview(passwordTextField)
    }
    
    private func setupUnderLine(yCoordinate: CGFloat) -> UILabel {
        let line = UILabel(frame: CGRect(x: 20, y: yCoordinate, width: 335, height: 1))
        line.backgroundColor = .lightGray
        view.addSubview(line)
        return line
    }
    
    private func setupLines() {
        _ = setupUnderLine(yCoordinate: 372)
        _ = setupUnderLine(yCoordinate: 448)
    }
    
    private func setupLoginButton() {
        loginButton = UIButton(frame: CGRect(x: 20, y: 671, width: 335, height: 44))
        loginButton.backgroundColor = UIColor(red: 233.0 / 255.0, green: 70.0 / 255.0, blue: 94.0 / 255.0, alpha: 0.4)
        loginButton.setTitle("Login", for: .normal)
        loginButton.isEnabled = false
        loginButton.layer.cornerRadius = 12
        view.addSubview(loginButton)
    }
    
    private func setupEyeImage() {
        let image = UIImageView(frame: CGRect(x: 331, y: 416, width: 24, height: 24))
        image.image = .init(named: "eye")
        view.addSubview(image)
    }
    
    private func setupFaceIDLabel() {
        faceIDLabel = UILabel(frame: CGRect(x: 86, y: 544, width: 150, height: 35))
        faceIDLabel.text = "Use FaceID"
        faceIDLabel.font = UIFont(name: "Verdana", size: 16)
        faceIDLabel.isHidden = true
        view.addSubview(faceIDLabel)
    }
    
    private func setupFaceIDSwitch() {
        faceIDSwitch = UISwitch(frame: CGRect(x: 248, y: 544, width: 54, height: 35))
        faceIDSwitch.isHidden = true
        view.addSubview(faceIDSwitch)
    }
    
    @objc private func editingChanged(_ textField: UITextField) {
        guard let email = emailTextField.text,
              !email.isEmpty,
              let password = passwordTextField.text,
              !password.isEmpty
        else {
            loginButton.isEnabled = false
            loginButton.backgroundColor = UIColor(
                red: 233.0 / 255.0,
                green: 70.0 / 255.0,
                blue: 94.0 / 255.0,
                alpha: 0.4
            )
            return
        }
        loginButton.isEnabled = true
        loginButton.backgroundColor = UIColor(red: 233.0 / 255.0, green: 70.0 / 255.0, blue: 94.0 / 255.0, alpha: 1)
        faceIDLabel.isHidden = false
        faceIDSwitch.isHidden = false
    }
    
    @objc private func loginTapped() {
        let birthdaysVC = BirthdaysViewController()
        birthdaysVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(birthdaysVC, animated: true)
    }
}
