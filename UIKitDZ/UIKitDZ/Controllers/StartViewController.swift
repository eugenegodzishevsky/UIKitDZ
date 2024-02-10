// StartViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Стартовый вью контроллер с окном ввода слова
final class StartViewController: UIViewController {
    // MARK: - Public Properties

    var isButtonMoved = false
    var word: Word? {
        didSet {
            if let word = word {
                wordLabel.configure(with: word)
                newWord.configure(with: word)
            }
        }
    }

    // MARK: - Constants

    let wordLabel = WordLabel(frame: CGRect(x: 163, y: 163, width: 275, height: 57))
    let newWord = WordLabel(frame: CGRect(x: 163, y: 339, width: 275, height: 57))
    let youArePrintLabel = UILabel(frame: CGRect(x: 50, y: 106, width: 275, height: 57))
    let whatYouGet = UILabel(frame: CGRect(x: 163, y: 282, width: 275, height: 57))

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        addStartButton()
        addYouArePrint()
        addWordLabel()
        addWhatYouGet()
        addNewWord()
    }

    // MARK: - Private Methods

    private func addStartButton() {
        let startButton = UIButton(frame: CGRect(x: 20, y: 406, width: 335, height: 44))
        startButton.backgroundColor = UIColor(red: 76.0 / 255.0, green: 216.0 / 255.0, blue: 102.0 / 255.0, alpha: 1.0)
        startButton.layer.cornerRadius = 12
        startButton.setTitle("Начать", for: .normal)
        startButton.center.x = view.center.x
        view.addSubview(startButton)

        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
    }

    private func addYouArePrint() {
        youArePrintLabel.text = "Вы ввели слово"
        youArePrintLabel.textAlignment = .center
        youArePrintLabel.font = UIFont(name: "Verdana", size: 16)
        youArePrintLabel.center.x = view.center.x
        youArePrintLabel.isHidden = true
        view.addSubview(youArePrintLabel)
    }

    private func addWordLabel() {
        wordLabel.text = " "
        wordLabel.textAlignment = .center
        wordLabel.font = UIFont(name: "Verdana", size: 16)
        wordLabel.textColor = .gray
        wordLabel.center.x = view.center.x
        view.addSubview(wordLabel)
    }

    private func addWhatYouGet() {
        whatYouGet.text = "А вот что получится, если читать справо налево"
        whatYouGet.textAlignment = .center
        whatYouGet.numberOfLines = 0
        whatYouGet.font = UIFont(name: "Verdana", size: 16)
        whatYouGet.center.x = view.center.x
        whatYouGet.isHidden = true
        view.addSubview(whatYouGet)
    }

    private func addNewWord() {
        newWord.text = " "
        newWord.textAlignment = .center
        newWord.font = UIFont(name: "Verdana", size: 16)
        newWord.textColor = .gray
        newWord.center.x = view.center.x
        view.addSubview(newWord)
    }

    @objc private func startButtonPressed(sender: UIButton) {
        let enterWordAlert = UIAlertController(title: "Введите ваше слово", message: nil, preferredStyle: .alert)
        enterWordAlert.addTextField()
        enterWordAlert.textFields?.first?.placeholder = "Введите слово"
        if !isButtonMoved {
            let offset: CGFloat = 200
            sender.frame.origin.y += offset
            isButtonMoved = true
        }

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        let okAction = UIAlertAction(title: "Ок", style: .default) { _ in
            if let word = enterWordAlert.textFields?.first?.text {
                self.wordLabel.text = word
                self.newWord.text = String(word.reversed())
                self.youArePrintLabel.isHidden = false
                self.whatYouGet.isHidden = false
            }
        }

        enterWordAlert.addAction(cancelAction)
        enterWordAlert.addAction(okAction)
        present(enterWordAlert, animated: true)
    }
}
