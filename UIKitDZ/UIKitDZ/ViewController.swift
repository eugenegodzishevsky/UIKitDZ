// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// MARK: - Life Cycle

/// класс
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupButtons()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupNameLabel()
    }

    // метод для калькулятора
    @objc func calcPressed(sender: UIButton) {
        presentCalculatorAlert()
    }

    // метод для угадай_число
    @objc func guessPressed(sender: UIButton) {
        presentGuessAlert()
    }

    // MARK: - Private Methods

    private func setupBackground() {
        // бэкграунд
        if let image = UIImage(named: "background") {
            let imageView = UIImageView(frame: view.bounds)
            imageView.contentMode = .scaleAspectFill
            imageView.image = image
            imageView.clipsToBounds = true
            view.backgroundColor = .white
            view.addSubview(imageView)
            view.sendSubviewToBack(imageView)
        } else {
            view.backgroundColor = UIColor(patternImage: UIImage.actions)
        }
    }

    private func setupButtons() {
        // кнопки
        let calcButton = createButton(
            frame: CGRect(x: 152, y: 507, width: 200, height: 200),
            title: "Калькулятор",
            color: UIColor(red: 100.0 / 255.0, green: 181.0 / 255.0, blue: 130.0 / 255.0, alpha: 1.0),
            action: #selector(calcPressed)
        )
        view.addSubview(calcButton)

        let guessButton = createButton(
            frame: CGRect(x: 82, y: 301, width: 150, height: 150),
            title: "Угадай число",
            color: UIColor(red: 155.0 / 255.0, green: 127.0 / 255.0, blue: 181.0 / 255.0, alpha: 1.0),
            action: #selector(guessPressed)
        )
        view.addSubview(guessButton)
    }

    private func setupNameLabel() {
        // алерт для ввода имени
        let alert = UIAlertController(title: "Пожалуйста, представьтесь", message: nil, preferredStyle: .alert)
        alert.addTextField()
        alert.textFields?.first?.placeholder = "Введите ваше имя"

        let action = UIAlertAction(title: "готово", style: .cancel) { _ in
            let text = alert.textFields?.first?.text
            self.showNameLabel(text: text)
        }

        alert.addAction(action)
        present(alert, animated: true)
    }

    private func createButton(frame: CGRect, title: String, color: UIColor, action: Selector) -> UIButton {
        let button = UIButton(frame: frame)
        button.backgroundColor = color
        button.setTitle(title, for: .normal)
        button.layer.cornerRadius = 30
        button.layer.borderWidth = 3.0
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }

    private func showNameLabel(text: String?) {
        let nameLable = UILabel(frame: CGRect(x: 0, y: 37, width: 375, height: 82))
        nameLable.center.x = view.center.x
        nameLable.backgroundColor = .systemCyan
        nameLable.layer.borderWidth = 3.0
        nameLable.clipsToBounds = true
        nameLable.text = "Приветствую, \n\(text ?? "имя")!"
        nameLable.font = UIFont.boldSystemFont(ofSize: 30)
        nameLable.textColor = .white
        nameLable.textAlignment = .center
        nameLable.numberOfLines = 0
        view.addSubview(nameLable)
    }

    private func presentCalculatorAlert() {
        let alert = UIAlertController(title: "Введите ваши числа", message: nil, preferredStyle: .alert)

        alert.addTextField { textField in
            textField.placeholder = "Введите первое число"
        }

        alert.addTextField { textField in
            textField.placeholder = "Введите второе число"
        }

        let sumAction = UIAlertAction(title: "Сложить", style: .default) { _ in
            if let num1 = Int(alert.textFields?[0].text ?? ""), let num2 = Int(alert.textFields?[1].text ?? "") {
                let sum = num1 + num2
                self.showResult(sum)
            }
        }

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        alert.addAction(sumAction)
        alert.addAction(cancelAction)

        present(alert, animated: true)
    }

    private func presentGuessAlert() {
        let guessAllert = UIAlertController(title: "Угадай число от 1 до 10", message: nil, preferredStyle: .alert)

        guessAllert.addTextField { textField in
            textField.placeholder = "Введите число"

            let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
            let okAction = UIAlertAction(title: "Ок", style: .default) { _ in
                let guessNumber = Int.random(in: 1 ... 10)
                print(guessNumber)
                let myNumber = Int(guessAllert.textFields?.first?.text ?? "")
                if myNumber == guessNumber {
                    self.showCorrectAnswerAlert()
                } else {
                    self.showIncorrectAnswerAlert()
                }
            }

            guessAllert.addAction(cancelAction)
            guessAllert.addAction(okAction)

            self.present(guessAllert, animated: true)
        }
    }

    private func showResult(_ result: Int) {
        let resultAlert = UIAlertController(
            title: "Результат",
            message: "Результат: \(result)",
            preferredStyle: .alert
        )

        let okAction = UIAlertAction(title: "Ок", style: .default)
        resultAlert.addAction(okAction)

        present(resultAlert, animated: true)
    }

    private func showCorrectAnswerAlert() {
        let correctAnswerAllert = UIAlertController(
            title: "Поздравляю!",
            message: "Вы угадали",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .default)

        correctAnswerAllert.addAction(okAction)
        present(correctAnswerAllert, animated: true)
    }

    private func showIncorrectAnswerAlert() {
        let incorrectAnswerAllert = UIAlertController(
            title: "Упс",
            message: "Это неверный",
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .default)

        incorrectAnswerAllert.addAction(okAction)
        present(incorrectAnswerAllert, animated: true)
    }
}
