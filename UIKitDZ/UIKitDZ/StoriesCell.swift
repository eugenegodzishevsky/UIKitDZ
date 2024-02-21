// StoriesCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// enum Constants {
//    static let identifier = "StoriesCell"
//
// }
/// ячейка сториз
class StoriesCell: UITableViewCell {
    static let identifier = "StoriesCell"
    let scrollView = UIScrollView()
    let rmLinkStorage = RMLinkStorage()

    private var userPicView = UIImageView()
    private var userPicView1 = UIImageView()
    private var userPicView2 = UIImageView()
    private var userPicView3 = UIImageView()
    private var userPicView4 = UIImageView()
    private var addStoryView = UIImageView()
    private var pluslabel = UILabel()
    private var yourStoryLabel = UILabel()
    private var nameLabel1 = UILabel()
    private var nameLabel2 = UILabel()
    private var nameLabel3 = UILabel()
    private var nameLabel4 = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(stories: [Stories]) {
        userPicView.image = UIImage(named: "story1")

        userPicView1.image = UIImage(named: "story2")
        userPicView2.image = UIImage(named: "story2")
        userPicView3.image = UIImage(named: "story2")
        userPicView4.image = UIImage(named: "story2")
        addStoryView.image = UIImage(named: "addStory")
        pluslabel.text = "+"
        yourStoryLabel.text = "Ваша история"
        yourStoryLabel.textColor = .gray
        yourStoryLabel.font = UIFont(name: "Verdana", size: 8)
        nameLabel1.text = "Lavanda 123"
        nameLabel1.font = UIFont(name: "Verdana", size: 8)
        nameLabel2.text = "Lavanda 123"
        nameLabel2.font = UIFont(name: "Verdana", size: 8)
        nameLabel3.text = "Lavanda 123"
        nameLabel3.font = UIFont(name: "Verdana", size: 8)
        nameLabel4.text = "Lavanda 123"
        nameLabel4.font = UIFont(name: "Verdana", size: 8)

        contentView.addSubview(scrollView)
        scrollView.addSubview(userPicView)
        scrollView.addSubview(userPicView1)
        scrollView.addSubview(userPicView2)
//        scrollView.addSubview(storiesView)

        scrollView.addSubview(userPicView3)
        scrollView.addSubview(userPicView4)
        // scrollView.addSubview(addStoryView)
        userPicView.addSubview(addStoryView)
        addStoryView.addSubview(pluslabel)
        userPicView.addSubview(yourStoryLabel)
        userPicView1.addSubview(nameLabel1)
        userPicView2.addSubview(nameLabel2)
        userPicView3.addSubview(nameLabel3)
        userPicView4.addSubview(nameLabel4)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        userPicView.translatesAutoresizingMaskIntoConstraints = false
        userPicView1.translatesAutoresizingMaskIntoConstraints = false
        userPicView2.translatesAutoresizingMaskIntoConstraints = false
        userPicView3.translatesAutoresizingMaskIntoConstraints = false
        userPicView4.translatesAutoresizingMaskIntoConstraints = false
        addStoryView.translatesAutoresizingMaskIntoConstraints = false
        pluslabel.translatesAutoresizingMaskIntoConstraints = false
        yourStoryLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel1.translatesAutoresizingMaskIntoConstraints = false
        nameLabel2.translatesAutoresizingMaskIntoConstraints = false
        nameLabel3.translatesAutoresizingMaskIntoConstraints = false
        nameLabel4.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),

            userPicView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
            userPicView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            userPicView.widthAnchor.constraint(equalToConstant: 60),
            userPicView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5),
            userPicView.heightAnchor.constraint(equalToConstant: 60),

            addStoryView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 45),
            addStoryView.trailingAnchor.constraint(equalTo: userPicView.trailingAnchor),
            addStoryView.widthAnchor.constraint(equalToConstant: 20),
            addStoryView.bottomAnchor.constraint(equalTo: userPicView.bottomAnchor),
            addStoryView.heightAnchor.constraint(equalToConstant: 20),

            pluslabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 45),
            pluslabel.trailingAnchor.constraint(equalTo: userPicView.trailingAnchor, constant: 5),
            pluslabel.widthAnchor.constraint(equalToConstant: 20),
            pluslabel.bottomAnchor.constraint(equalTo: userPicView.bottomAnchor),
            pluslabel.heightAnchor.constraint(equalToConstant: 20),

            yourStoryLabel.bottomAnchor.constraint(equalTo: userPicView.bottomAnchor, constant: 15),
            yourStoryLabel.leadingAnchor.constraint(equalTo: userPicView.leadingAnchor, constant: 5),
            nameLabel1.bottomAnchor.constraint(equalTo: userPicView1.bottomAnchor, constant: 15),
            nameLabel1.leadingAnchor.constraint(equalTo: userPicView1.leadingAnchor, constant: 5),
            nameLabel2.bottomAnchor.constraint(equalTo: userPicView2.bottomAnchor, constant: 15),
            nameLabel2.leadingAnchor.constraint(equalTo: userPicView2.leadingAnchor, constant: 5),
            nameLabel3.bottomAnchor.constraint(equalTo: userPicView3.bottomAnchor, constant: 15),
            nameLabel3.leadingAnchor.constraint(equalTo: userPicView3.leadingAnchor, constant: 5),
            nameLabel4.bottomAnchor.constraint(equalTo: userPicView4.bottomAnchor, constant: 15),
            nameLabel4.leadingAnchor.constraint(equalTo: userPicView4.leadingAnchor, constant: 5),

            userPicView1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
            userPicView1.leadingAnchor.constraint(equalTo: userPicView.trailingAnchor, constant: 22),
            userPicView1.widthAnchor.constraint(equalToConstant: 60),
            userPicView1.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5),
            userPicView1.heightAnchor.constraint(equalToConstant: 60),

            userPicView2.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
            userPicView2.leadingAnchor.constraint(equalTo: userPicView1.trailingAnchor, constant: 22),
            userPicView2.widthAnchor.constraint(equalToConstant: 60),
            userPicView2.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5),
            userPicView2.heightAnchor.constraint(equalToConstant: 60),

            userPicView3.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
            userPicView3.leadingAnchor.constraint(equalTo: userPicView2.trailingAnchor, constant: 22),
//            userPicView3.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 10),
            userPicView3.widthAnchor.constraint(equalToConstant: 60),
            userPicView3.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5),
            userPicView3.heightAnchor.constraint(equalToConstant: 60),

            userPicView4.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
            userPicView4.leadingAnchor.constraint(equalTo: userPicView3.trailingAnchor, constant: 22),
            userPicView4.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 10),
            userPicView4.widthAnchor.constraint(equalToConstant: 60),
            userPicView4.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5),
            userPicView4.heightAnchor.constraint(equalToConstant: 60),

        ])
    }
}
