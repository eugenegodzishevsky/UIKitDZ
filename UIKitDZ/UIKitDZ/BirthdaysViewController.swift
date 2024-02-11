// BirthdaysViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью контроллер со списком людей и их днями рождения
final class BirthdaysViewController: UIViewController {
    // MARK: - Private Properties
    
    private var addButton: UIBarButtonItem!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addButton = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTapped)
        )
        navigationItem.rightBarButtonItem = addButton
        
        setupBirthdayReminderLabel()
        addPics()
        addNames()
        addBirthDays()
        addCakePic()
        addDaysCount()
    }
    
    // MARK: - Private Methods
    
    private func setupBirthdayReminderLabel() {
        let birthdayReminderLabel = UILabel(frame: CGRect(x: 86, y: 50, width: 209, height: 20))
        birthdayReminderLabel.text = "Birthday Reminder"
        birthdayReminderLabel.center.x = view.center.x
        birthdayReminderLabel.textAlignment = .center
        view.addSubview(birthdayReminderLabel)
    }
    
    // Методы для установки юзерпиков
    private func addUserPic(yCoordinate: CGFloat, image: UIImage) {
        let userPic = UIImageView(frame: CGRect(x: 19, y: yCoordinate, width: 75, height: 75))
        userPic.image = image
        userPic.layer.cornerRadius = 50
        view.addSubview(userPic)
    }
    
    private func addPics() {
        addUserPic(yCoordinate: 105, image: UIImage(named: "pic1") ?? .add)
        addUserPic(yCoordinate: 200, image: UIImage(named: "pic2") ?? .add)
        addUserPic(yCoordinate: 295, image: UIImage(named: "pic3") ?? .add)
        addUserPic(yCoordinate: 390, image: UIImage(named: "pic4") ?? .add)
    }
    
    // методы для установки имен
    private func addNameLabel(yCoordinate: CGFloat, text: String) {
        let nameLabel = UILabel(frame: CGRect(x: 102, y: yCoordinate, width: 209, height: 20))
        nameLabel.text = text
        nameLabel.font = UIFont(name: "Verdana", size: 16)
        nameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        view.addSubview(nameLabel)
    }
    
    private func addNames() {
        addNameLabel(yCoordinate: 119, text: "Helena Link")
        addNameLabel(yCoordinate: 214, text: "Verona Tusk")
        addNameLabel(yCoordinate: 309, text: "Alex Smith")
        addNameLabel(yCoordinate: 404, text: "Tom Johnson")
    }
    
    // методы для установки дат
    private func addBirthDayLabel(yCoordinate: CGFloat, text: String) {
        let birthDay = UILabel(frame: CGRect(x: 102, y: yCoordinate, width: 209, height: 20))
        birthDay.text = text
        birthDay.font = UIFont(name: "Verdana", size: 14)
        view.addSubview(birthDay)
    }
    
    private func addBirthDays() {
        addBirthDayLabel(yCoordinate: 147, text: "10.03 - turns 25!")
        addBirthDayLabel(yCoordinate: 242, text: "20.03 - turns 39")
        addBirthDayLabel(yCoordinate: 337, text: "21.04 - turns 51")
        addBirthDayLabel(yCoordinate: 432, text: "05.06 - turns 18")
    }
    
    // метод для добавления торт пика
    private func addCakePic() {
        let cakePic = UIImageView(frame: CGRect(x: 314, y: 119, width: 44, height: 44))
        cakePic.image = UIImage(named: "cakePic")
        view.addSubview(cakePic)
    }
    
    // метод для добавления счетчика дней до др
    private func addDaysCountLabel(yCoordinate: CGFloat, text: String) {
        let daysCountLabel = UILabel(frame: CGRect(x: 315, y: yCoordinate, width: 42, height: 44))
        daysCountLabel.text = text
        daysCountLabel.numberOfLines = 0
        daysCountLabel.textAlignment = .center
        daysCountLabel.font = UIFont(name: "Verdana", size: 16)
        daysCountLabel.textColor = UIColor(red: 90.0 / 255.0, green: 67.0 / 255.0, blue: 148.0 / 255.0, alpha: 1)
        view.addSubview(daysCountLabel)
    }
    
    private func addDaysCount() {
        addDaysCountLabel(yCoordinate: 214, text: "10\ndays")
        addDaysCountLabel(yCoordinate: 309, text: "42\ndays")
        addDaysCountLabel(yCoordinate: 404, text: "87\ndays")
    }
    
    @objc func addTapped() {
        let newReminderVC = NewReminderViewController()
        navigationController?.present(newReminderVC, animated: true)
    }
}
