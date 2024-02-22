// StoriesCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ячейка сториз
final class StoriesCell: UITableViewCell {
    // MARK: - Constants

    static let identifier = Constants.storiesIdentifier

    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let xOffset = 20
    let increaseXOffset = 80

    let rmLinkStorage = RMLinkStorage()

//    private var userPicView = UIImageView()
//    private var userPicView1 = UIImageView()
//    private var userPicView2 = UIImageView()
//    private var userPicView3 = UIImageView()
//    private var userPicView4 = UIImageView()
//    private var addStoryView = UIImageView()
//    private var pluslabel = UILabel()
//    private var yourStoryLabel = UILabel()
//    private var nameLabel1 = UILabel()
//    private var nameLabel2 = UILabel()
//    private var nameLabel3 = UILabel()
//    private var nameLabel4 = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
        setupConstraints()
    }

//    func setupCell(stories: [Stories]) {
//        userPicView.image = UIImage(named: Constants.firstAvatarName)
//
//        userPicView1.image = UIImage(named: Constants.secondAvatarName)
//        userPicView2.image = UIImage(named: Constants.secondAvatarName)
//        userPicView3.image = UIImage(named: Constants.secondAvatarName)
//        userPicView4.image = UIImage(named: Constants.secondAvatarName)
//        addStoryView.image = UIImage(named: Constants.addStoryLabel)
//        pluslabel.text = Constants.plusLabel
//        yourStoryLabel.text = Constants.firstNameLabel
//        yourStoryLabel.textColor = .gray
//        yourStoryLabel.font = UIFont(name: Constants.verdana, size: 8)
//        nameLabel1.text = Constants.secondNameLabel
//        nameLabel1.font = UIFont(name: Constants.verdana, size: 8)
//        nameLabel2.text = Constants.secondNameLabel
//        nameLabel2.font = UIFont(name: Constants.verdana, size: 8)
//        nameLabel3.text = Constants.secondNameLabel
//        nameLabel3.font = UIFont(name: Constants.verdana, size: 8)
//        nameLabel4.text = Constants.secondNameLabel
//        nameLabel4.font = UIFont(name: Constants.verdana, size: 8)
//
//        contentView.addSubview(scrollView)
//        scrollView.addSubview(userPicView)
//        scrollView.addSubview(userPicView1)
//        scrollView.addSubview(userPicView2)
//        scrollView.addSubview(userPicView3)
//        scrollView.addSubview(userPicView4)
//        userPicView.addSubview(addStoryView)
//        addStoryView.addSubview(pluslabel)
//        userPicView.addSubview(yourStoryLabel)
//        userPicView1.addSubview(nameLabel1)
//        userPicView2.addSubview(nameLabel2)
//        userPicView3.addSubview(nameLabel3)
//        userPicView4.addSubview(nameLabel4)
//
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        userPicView.translatesAutoresizingMaskIntoConstraints = false
//        userPicView1.translatesAutoresizingMaskIntoConstraints = false
//        userPicView2.translatesAutoresizingMaskIntoConstraints = false
//        userPicView3.translatesAutoresizingMaskIntoConstraints = false
//        userPicView4.translatesAutoresizingMaskIntoConstraints = false
//        addStoryView.translatesAutoresizingMaskIntoConstraints = false
//        pluslabel.translatesAutoresizingMaskIntoConstraints = false
//        yourStoryLabel.translatesAutoresizingMaskIntoConstraints = false
//        nameLabel1.translatesAutoresizingMaskIntoConstraints = false
//        nameLabel2.translatesAutoresizingMaskIntoConstraints = false
//        nameLabel3.translatesAutoresizingMaskIntoConstraints = false
//        nameLabel4.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//            scrollView.topAnchor.constraint(equalTo: topAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
//
//            userPicView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
//            userPicView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
//            userPicView.widthAnchor.constraint(equalToConstant: 60),
//            userPicView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5),
//            userPicView.heightAnchor.constraint(equalToConstant: 60),
//
//            addStoryView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 45),
//            addStoryView.trailingAnchor.constraint(equalTo: userPicView.trailingAnchor),
//            addStoryView.widthAnchor.constraint(equalToConstant: 20),
//            addStoryView.bottomAnchor.constraint(equalTo: userPicView.bottomAnchor),
//            addStoryView.heightAnchor.constraint(equalToConstant: 20),
//
//            pluslabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 45),
//            pluslabel.trailingAnchor.constraint(equalTo: userPicView.trailingAnchor, constant: 5),
//            pluslabel.widthAnchor.constraint(equalToConstant: 20),
//            pluslabel.bottomAnchor.constraint(equalTo: userPicView.bottomAnchor),
//            pluslabel.heightAnchor.constraint(equalToConstant: 20),
//
//            yourStoryLabel.bottomAnchor.constraint(equalTo: userPicView.bottomAnchor, constant: 15),
//            yourStoryLabel.leadingAnchor.constraint(equalTo: userPicView.leadingAnchor, constant: 5),
//            nameLabel1.bottomAnchor.constraint(equalTo: userPicView1.bottomAnchor, constant: 15),
//            nameLabel1.leadingAnchor.constraint(equalTo: userPicView1.leadingAnchor, constant: 5),
//            nameLabel2.bottomAnchor.constraint(equalTo: userPicView2.bottomAnchor, constant: 15),
//            nameLabel2.leadingAnchor.constraint(equalTo: userPicView2.leadingAnchor, constant: 5),
//            nameLabel3.bottomAnchor.constraint(equalTo: userPicView3.bottomAnchor, constant: 15),
//            nameLabel3.leadingAnchor.constraint(equalTo: userPicView3.leadingAnchor, constant: 5),
//            nameLabel4.bottomAnchor.constraint(equalTo: userPicView4.bottomAnchor, constant: 15),
//            nameLabel4.leadingAnchor.constraint(equalTo: userPicView4.leadingAnchor, constant: 5),
//
//            userPicView1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
//            userPicView1.leadingAnchor.constraint(equalTo: userPicView.trailingAnchor, constant: 22),
//            userPicView1.widthAnchor.constraint(equalToConstant: 60),
//            userPicView1.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5),
//            userPicView1.heightAnchor.constraint(equalToConstant: 60),
//
//            userPicView2.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
//            userPicView2.leadingAnchor.constraint(equalTo: userPicView1.trailingAnchor, constant: 22),
//            userPicView2.widthAnchor.constraint(equalToConstant: 60),
//            userPicView2.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5),
//            userPicView2.heightAnchor.constraint(equalToConstant: 60),
//
//            userPicView3.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
//            userPicView3.leadingAnchor.constraint(equalTo: userPicView2.trailingAnchor, constant: 22),
//            userPicView3.widthAnchor.constraint(equalToConstant: 60),
//            userPicView3.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5),
//            userPicView3.heightAnchor.constraint(equalToConstant: 60),
//
//            userPicView4.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 5),
//            userPicView4.leadingAnchor.constraint(equalTo: userPicView3.trailingAnchor, constant: 22),
//            userPicView4.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: 10),
//            userPicView4.widthAnchor.constraint(equalToConstant: 60),
//            userPicView4.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 5),
//            userPicView4.heightAnchor.constraint(equalToConstant: 60),
//
//        ])
//    }
//

    // MARK: - Public Methods

    public func setupCell(with items: [Stories]) {
        var xOffset = CGFloat(xOffset)
        print("1 \(xOffset)")

        for item in items {
            let imageView = UIImageView()
            imageView.image = UIImage(named: item.avatarImageName)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            scrollView.addSubview(imageView)

            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: xOffset).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true

            xOffset += CGFloat(increaseXOffset)
            print("2 \(xOffset)")

            let label = UILabel()
            label.text = item.nameLabel
            label.textAlignment = .center
            label.font = UIFont(name: "Verdana", size: 8)
            scrollView.addSubview(label)

            label.translatesAutoresizingMaskIntoConstraints = false
            label.leadingAnchor.constraint(equalTo: imageView.leadingAnchor).isActive = true
            label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
            label.trailingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
            if item.addButton == true {
                let button = UIButton()
                button.translatesAutoresizingMaskIntoConstraints = false
                button.layer.cornerRadius = 10
                button.clipsToBounds = true
                button.setImage(UIImage(systemName: "plus"), for: .normal)
                button.tintColor = .white
                button.backgroundColor = UIColor(red: 233 / 255, green: 70 / 255, blue: 94 / 255, alpha: 1.0)
                scrollView.addSubview(button)

                button.heightAnchor.constraint(equalToConstant: 20).isActive = true
                button.widthAnchor.constraint(equalToConstant: 20).isActive = true
                button.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: -18)
                    .isActive = true
                button.bottomAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
            }
        }

        scrollView.contentSize = CGSize(width: xOffset, height: 100)
    }

    // MARK: - Private Methods

    private func setupView() {
        contentView.addSubview(scrollView)
    }

    private func setupConstraints() {
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
