// ThirdViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// VC третьего экрана
final class ThirdViewController: UIViewController {
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        print("")
    }

    // MARK: - IBAction

    @IBAction private func payButtonAction(_ sender: Any) {
        let alertController = UIAlertController(title: "Вы хотите оплатить счет?", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        let yesAction = UIAlertAction(title: "Да", style: .default) { _ in
            self.performSegue(withIdentifier: "thanksVC", sender: self)
        }

        alertController.addAction(cancelAction)
        alertController.addAction(yesAction)
        present(alertController, animated: true)
    }
}
