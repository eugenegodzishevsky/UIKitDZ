// NewReminderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью контроллер для добавления нового напоминания
final class NewReminderViewController: UIViewController {
    // MARK: - Private Properties

    private var dateOfBirthField: UITextField?
    private var ageField: UITextField?
    private var agePicker: UIPickerView?
    private var genderField: UITextField?
    private var genderPicker: UIPickerView?
    private let genders = ["Male", "Female"]
    private var telegramField: UITextField?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addCancelButton()
        addNewBirthdayButton()
        addPhotoPic()
        addChangePhotoButton()
        addNames()
        addTextfields()
        setupLines()

        telegramField?.delegate = self
    }

    // MARK: - Private Methods

    private func addCancelButton() {
        let cancelButton = UIButton(frame: CGRect(x: 20, y: 20, width: 50, height: 20))
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        cancelButton.setTitleColor(.systemBlue, for: .normal)
        view.addSubview(cancelButton)
    }

    private func addNewBirthdayButton() {
        let addButton = UIButton(frame: CGRect(x: 315, y: 20, width: 50, height: 20))
        addButton.setTitle("Add", for: .normal)
        addButton.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        addButton.setTitleColor(.systemBlue, for: .normal)
        view.addSubview(addButton)
    }

    private func addPhotoPic() {
        let photoPic = UIImageView(frame: CGRect(x: 125, y: 134, width: 125, height: 125))
        photoPic.image = UIImage(named: "photoPic")
        view.addSubview(photoPic)
    }

    private func addChangePhotoButton() {
        let changePhotoButton = UIButton(frame: CGRect(x: 125, y: 267, width: 125, height: 20))
        changePhotoButton.setTitle("Change photo", for: .normal)
        changePhotoButton.titleLabel?.font = UIFont(name: "Verdana", size: 14)
        changePhotoButton.setTitleColor(.systemBlue, for: .normal)
        view.addSubview(changePhotoButton)
    }

    // методы для установки заголовков
    private func addHeaderLabel(yCoordinate: CGFloat, text: String) {
        let nameLabel = UILabel(frame: CGRect(x: 20, y: yCoordinate, width: 175, height: 19))
        nameLabel.text = text
        nameLabel.font = UIFont(name: "Verdana", size: 16)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(nameLabel)
    }

    private func addNames() {
        addHeaderLabel(yCoordinate: 307, text: "Name Surname")
        addHeaderLabel(yCoordinate: 382, text: "Birthday")
        addHeaderLabel(yCoordinate: 457, text: "Age")
        addHeaderLabel(yCoordinate: 530, text: "Gender")
        addHeaderLabel(yCoordinate: 605, text: "Telegram")
    }

    // методы для установки текстфилдов
    private func addTextFieldLabel(yCoordinate: CGFloat, placeholder: String) -> UITextField {
        let textFieldLabel = UITextField(frame: CGRect(x: 20, y: yCoordinate, width: 175, height: 19))
        textFieldLabel.placeholder = placeholder
        textFieldLabel.font = UIFont(name: "Verdana", size: 14)
        // textFieldLabel.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(textFieldLabel)
        return textFieldLabel
    }

    // методы для создания нижних подчеркиваний
    private func setupUnderLine(yCoordinate: CGFloat) -> UILabel {
        let line = UILabel(frame: CGRect(x: 20, y: yCoordinate, width: 335, height: 1))
        line.backgroundColor = .lightGray
        view.addSubview(line)
        return line
    }

    private func setupLines() {
        _ = setupUnderLine(yCoordinate: 361)
        _ = setupUnderLine(yCoordinate: 436)
        _ = setupUnderLine(yCoordinate: 511)
        _ = setupUnderLine(yCoordinate: 584)
        _ = setupUnderLine(yCoordinate: 659)
    }

    private func addTextfields() {
        _ = addTextFieldLabel(yCoordinate: 336, placeholder: "Typing Name Surname")
        dateOfBirthField = addTextFieldLabel(yCoordinate: 411, placeholder: "Typing Date of Birth")
        // датапикер дня рождения
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.backgroundColor = .white
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        dateOfBirthField?.inputView = datePicker

        let birthDayToolbar = UIToolbar()
        birthDayToolbar.sizeToFit()

        let birthDayDoneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(donePressed)
        )
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        birthDayToolbar.setItems([flexSpace, birthDayDoneButton], animated: true)
        dateOfBirthField?.inputAccessoryView = birthDayToolbar

        ageField = addTextFieldLabel(yCoordinate: 486, placeholder: "Typing age")
        // пикер количества лет
        agePicker = UIPickerView()
        agePicker?.backgroundColor = .white
        agePicker?.delegate = self
        agePicker?.dataSource = self
        ageField?.inputView = agePicker

        let ageToolbar = UIToolbar()
        ageToolbar.sizeToFit()

        let ageDoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ageDonePressed))
        ageToolbar.setItems([flexSpace, ageDoneButton], animated: true)
        ageField?.inputAccessoryView = ageToolbar

        genderField = addTextFieldLabel(yCoordinate: 559, placeholder: "Indicate Gender")
        // пикер пола
        genderPicker = UIPickerView()
        genderPicker?.backgroundColor = .white
        genderPicker?.delegate = self
        genderPicker?.dataSource = self
        genderField?.inputView = genderPicker

        let genderToolbar = UIToolbar()
        genderToolbar.sizeToFit()

        let genderDoneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(genderDonePressed)
        )
        // let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        genderToolbar.setItems([flexSpace, genderDoneButton], animated: true)
        genderField?.inputAccessoryView = genderToolbar

        telegramField = addTextFieldLabel(yCoordinate: 634, placeholder: "Typing Telegram")
    }

    @objc private func dateChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateOfBirthField?.text = dateFormatter.string(from: sender.date)
    }

    @objc private func donePressed() {
        view.endEditing(true)
    }

    @objc private func ageDonePressed() {
        let selectedRow = agePicker?.selectedRow(inComponent: 0) ?? 0
        ageField?.text = "\(selectedRow)"
        view.endEditing(true)
    }

    @objc private func genderDonePressed() {
        let selectedRow = genderPicker?.selectedRow(inComponent: 0) ?? 0
        genderField?.text = genders[selectedRow]
        view.endEditing(true)
    }
}

// MARK: - UIPickerViewDataSource

extension NewReminderViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == agePicker {
            return 100
        } else if pickerView == genderPicker {
            return genders.count
        }
        return 0
    }
}

// MARK: - UIPickerViewDelegate

extension NewReminderViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == agePicker {
            return "\(row)"
        } else if pickerView == genderPicker {
            return genders[row]
        }
        return nil
    }
}

// MARK: - UITextFieldDelegate

extension NewReminderViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing called")

        if textField == telegramField {
            let alertController = UIAlertController(
                title: "Please enter Telegram",
                message: nil,
                preferredStyle: .alert
            )
            alertController.addTextField { textField in
                textField.placeholder = "Typing Telegram "
            }
            let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
                let id = alertController.textFields?[0].text
                self.telegramField?.text = id
            }
            alertController.addAction(okAction)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)
            present(alertController, animated: true, completion: nil)
        }
    }
}
