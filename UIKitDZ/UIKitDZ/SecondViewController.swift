// SecondViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// VC второго экрана
final class SecondViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var nameTextfield: UITextField!
    @IBOutlet var numberOfGuestsTextField: UITextField!
    @IBOutlet var numberOfTheTableTextField: UITextField!
    @IBOutlet var checkButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        checkButton.isEnabled = false

        nameTextfield.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        numberOfGuestsTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        numberOfTheTableTextField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }

    // MARK: - Public Methods

    @IBAction func editingChanged(_ textField: UITextField) {
        guard let name = nameTextfield.text,
              !name.isEmpty,
              let numberOfGuests = numberOfGuestsTextField.text,
              !numberOfGuests.isEmpty,
              let numberOfTheTable = numberOfTheTableTextField.text,
              !numberOfTheTable.isEmpty
        else {
            checkButton.isEnabled = false
            checkButton.backgroundColor = .systemMint
            return
        }
        checkButton.isEnabled = true
        checkButton.backgroundColor = .systemTeal
    }

    @IBAction func checkButtonAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Выставить чек?", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        let checkAction = UIAlertAction(title: "Чек", style: .default) { _ in
            self.performSegue(withIdentifier: "checkVC", sender: self)
        }

        alertController.addAction(cancelAction)
        alertController.addAction(checkAction)
        present(alertController, animated: true)
    }
}
