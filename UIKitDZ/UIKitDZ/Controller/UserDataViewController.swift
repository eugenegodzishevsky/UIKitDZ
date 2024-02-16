// UserDataViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Данные о пользователе
class UserDataViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let title = "Мои данные"
        static let nameField = "Имя"
        static let surnameField = "Фамилия"
        static let numberField = "Номер телефона"
        static let footSizeField = "Размер ноги"
        static let dateOfBirthField = "Дата Рождения"
        static let mailField = "Почта"
        static let backButtonImageName = "chevron.backward"
        static let xMarkImageName = "xmark"
        static let maxNumberCount = 11
        static let saveText = "Cохранить"
    }

    // MARK: - Visual Components

    private lazy var saveButton = makeCustomButton(text: Constants.saveText)
    private lazy var nameTextField = makeCustomTextField(yAnchor: 16)
    private lazy var surnameTextField = makeCustomTextField(yAnchor: 70)
    private lazy var phoneNumberTextField = makeCustomTextField(yAnchor: 124)
    private lazy var footSizeTextField = makeCustomTextField(yAnchor: 178)
    private lazy var dateOfBirthTextField = makeCustomTextField(yAnchor: 232)
    private lazy var mailTextField = makeCustomTextField(yAnchor: 286)
    private lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .inline
        picker.addTarget(self, action: #selector(dateTapped), for: .valueChanged)
        return picker
    }()

    private lazy var footSizePicker: UIPickerView = {
        let picker = UIPickerView()
        let toolBar = UIToolbar()
        let xButton = UIBarButtonItem(
            image: UIImage(systemName: Constants.xMarkImageName),
            style: .plain,
            target: self,
            action: #selector(xMarkTapped)
        )
        xButton.tintColor = .black
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spacer, xButton], animated: false)
        toolBar.sizeToFit()
        footSizeTextField.inputAccessoryView = toolBar
        return picker
    }()

    // MARK: - Private Properties

    private let size = FootSize()
    private lazy var phoneNumberRegex: NSRegularExpression = {
        var regex = NSRegularExpression()
        do {
            try regex = NSRegularExpression(pattern: "[\\+\\s-\\(\\)]", options: .caseInsensitive)
        } catch {
            print("there was a mistake initializing Regular Expression")
        }
        return regex
    }()

    private var isAnyTextFieldChanged = false {
        didSet {
            saveButton.isHidden = isAnyTextFieldChanged ? false : true
        }
    }

    private var isTabBarNeededToHide = false {
        didSet {
            tabBarController?.tabBar.isHidden = isTabBarNeededToHide ? true : false
        }
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBackButton()
        setupDelegates()
        setupTextFieldsTargets()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        isTabBarNeededToHide = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        isTabBarNeededToHide = false
    }

    // MARK: - Private Methods

    private func setupTextFieldsTargets() {
        nameTextField.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: .editingChanged)
        surnameTextField.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: .editingChanged)
        phoneNumberTextField.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: .editingChanged)
        footSizeTextField.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: .editingChanged)
        dateOfBirthTextField.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: .editingChanged)
        mailTextField.addTarget(self, action: #selector(textFieldDidChange(sender:)), for: .editingChanged)
    }

    private func setupDelegates() {
        nameTextField.delegate = self
        surnameTextField.delegate = self
        phoneNumberTextField.delegate = self
        footSizeTextField.delegate = self
        dateOfBirthTextField.delegate = self
        mailTextField.delegate = self
        footSizePicker.delegate = self
    }

    private func setupUI() {
        title = Constants.title
        view.backgroundColor = .white
        nameTextField.placeholder = Constants.nameField
        surnameTextField.placeholder = Constants.surnameField
        phoneNumberTextField.placeholder = Constants.numberField
        footSizeTextField.placeholder = Constants.footSizeField
        dateOfBirthTextField.placeholder = Constants.dateOfBirthField
        mailTextField.placeholder = Constants.mailField
        dateOfBirthTextField.inputView = datePicker
        footSizeTextField.inputView = footSizePicker
        phoneNumberTextField.keyboardType = .numberPad
        mailTextField.keyboardType = .emailAddress
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        saveButton.isHidden = true
    }

    private func setupNavigationBackButton() {
        let backButtonimage = UIImage(systemName: Constants.backButtonImageName)
        let backButtonBarItem = UIBarButtonItem(
            image: backButtonimage,
            style: .plain,
            target: self,
            action: #selector(returnToVC)
        )
        backButtonBarItem.tintColor = .black
        navigationItem.hidesBackButton = true
        navigationItem.leftItemsSupplementBackButton = true
        navigationItem.leftBarButtonItem = backButtonBarItem
    }

    private func format(phoneNumber: String, shouldRemoveLastDigit: Bool) -> String {
        let range = NSString(string: phoneNumber).range(of: phoneNumber)
        var number = phoneNumberRegex.stringByReplacingMatches(in: phoneNumber, range: range, withTemplate: "")
        if number.count > Constants.maxNumberCount {
            let maxIndex = number.index(number.startIndex, offsetBy: Constants.maxNumberCount)
            number = String(number[number.startIndex ..< maxIndex])
        }
        if shouldRemoveLastDigit {
            let maxIndex = number.index(number.startIndex, offsetBy: number.count - 1)
            number = String(number[number.startIndex ..< maxIndex])
        }
        let maxIndex = number.index(number.startIndex, offsetBy: number.count)
        let regRange = number.startIndex ..< maxIndex
        if number.count < 7 {
            let pattern = "(\\d)(\\d{3})(\\d+)"
            number = number.replacingOccurrences(
                of: pattern,
                with: "$1 ($2) $3",
                options: .regularExpression,
                range: regRange
            )
        } else {
            let pattern = "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
            number = number.replacingOccurrences(
                of: pattern,
                with: "$1 ($2) $3-$4-$5",
                options: .regularExpression,
                range: regRange
            )
        }
        return "+" + number
    }

    private func isValidEmailAddress(emailAddressString: String) -> Bool {
        let alertController = UIAlertController(
            title: "Ошибка",
            message: "Эта почта недействительна",
            preferredStyle: .alert
        )
        alertController.addAction(UIAlertAction(title: "ОК", style: .cancel))
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"

        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))

            if results.count == 0 {
                returnValue = false
                present(alertController, animated: true)
            }

        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
            present(alertController, animated: true)
        }

        return returnValue
    }

    @objc private func dateTapped(sender: UIDatePicker) {
        let date = sender.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        let stringDate = dateFormatter.string(from: date)
        dateOfBirthTextField.text = stringDate
        dateOfBirthTextField.resignFirstResponder()
        mailTextField.becomeFirstResponder()
    }

    @objc private func xMarkTapped() {
        footSizeTextField.resignFirstResponder()
        dateOfBirthTextField.becomeFirstResponder()
    }

    @objc private func textFieldDidChange(sender: UITextField) {
        guard let text = sender.text else { return }
        isAnyTextFieldChanged = !text.isEmpty && !text.contains(" ") ? true : false
    }

    @objc private func saveButtonTapped() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func returnToVC() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITextFieldDelegate

extension UserDataViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            surnameTextField.becomeFirstResponder()
        case surnameTextField:
            phoneNumberTextField.becomeFirstResponder()
        case mailTextField:
            textField.resignFirstResponder()
        default:
            break
        }
        return true
    }

    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        if textField == phoneNumberTextField {
            let fullString = (textField.text ?? "") + string
            textField.text = format(phoneNumber: fullString, shouldRemoveLastDigit: range.length == 1)
            return false
        }
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        guard let text = textField.text,
              !text.isEmpty,
              textField == mailTextField else { return true }
        return isValidEmailAddress(emailAddressString: text)
    }
}

// MARK: - UIPickerVIewDataSource

extension UserDataViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        size.footSizes.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        footSizeTextField.text = String(size.footSizes[row])
    }
}

// MARK: - UIPickerViewDelegate

extension UserDataViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        String(size.footSizes[row])
    }
}
