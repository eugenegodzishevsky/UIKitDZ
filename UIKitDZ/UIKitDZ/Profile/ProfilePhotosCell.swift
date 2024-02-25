// ProfilePhotosCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ячейка фотографий
class ProfilePhotosCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let profilePhotosCellIdentifier = "ProfilePhotosCell"
        static let numberOfItemsInRow = 3
        static let spacing: CGFloat = 1.5
        static let itemWidth = (UIScreen.main.bounds.width - spacing * CGFloat(numberOfItemsInRow - 1)) /
            CGFloat(numberOfItemsInRow)
    }

    // MARK: - Private Properties

    private let images = [
        "spacePic",
        "spacePic1",
        "spacePic2",
        "spacePic3",
        "spacePic",
        "spacePic1",
        "spacePic2",
        "spacePic3",
        "spacePic"
    ]

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCollectionView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCollectionView()
    }

    // MARK: - Private Methods

    private func setupCollectionView() {
        let collectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = Constants.spacing
            layout.minimumInteritemSpacing = Constants.spacing
            layout.itemSize = CGSize(width: Constants.itemWidth, height: Constants.itemWidth)
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView.register(
                UICollectionViewCell.self,
                forCellWithReuseIdentifier: Constants.profilePhotosCellIdentifier
            )
            return collectionView
        }()

        collectionView.dataSource = self

        addSubview(collectionView)

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

// MARK: - CollectionView DataSource Methods

extension ProfilePhotosCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        images.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: Constants.profilePhotosCellIdentifier,
            for: indexPath
        )
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height))
        imageView.image = UIImage(named: images[indexPath.item])
        cell.contentView.addSubview(imageView)
        return cell
    }
}
