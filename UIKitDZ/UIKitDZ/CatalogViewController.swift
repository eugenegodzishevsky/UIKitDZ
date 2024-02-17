// CatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// класс
class CatalogViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    private let category = Category()
    let subcategories = ["Бренды", "Обувь", "Сумки"]
    var imageViews: [UIImageView] = []
//    var shoesViewController: ShoesViewController?

    private lazy var categorySegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: category.categoryTypes)
        segmentedControl.addTarget(self, action: #selector(categorySelected), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()

    private lazy var backItem: UIBarButtonItem = {
        let backItem = UIBarButtonItem()
        backItem.title = ""
        backItem.tintColor = .black
        return backItem
    }()

    private lazy var cameraButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            image: UIImage(named: "camera"),
            style: .plain,
            target: self,
            action: #selector(cameraTapped)
        )
        button.tintColor = .black
        return button
    }()

    private lazy var barcodeButton: UIBarButtonItem = {
        let button = UIBarButtonItem(
            image: UIImage(named: "barcode"),
            style: .plain,
            target: self,
            action: #selector(cameraTapped)
        )
        button.tintColor = .black
        return button
    }()

    private lazy var newView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowRadius = 1
        view.layer.masksToBounds = false

        let imageView = UIImageView()
        imageView.image = UIImage(named: "women_new")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageViews.append(imageView)

        let label = UILabel()
        label.text = "Новинки"
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(imageView)
        view.addSubview(label)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.topAnchor.constraint(equalTo: view.topAnchor),
            label.heightAnchor.constraint(equalToConstant: 20),
        ])

        return view
    }()

    private lazy var salesView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowRadius = 1
        view.layer.masksToBounds = false

        let imageView = UIImageView()
        imageView.image = UIImage(named: "women_sales")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageViews.append(imageView)

        let label = UILabel()
        label.text = "Распродажа"
        label.textAlignment = .center
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(imageView)
        view.addSubview(label)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            label.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            label.heightAnchor.constraint(equalToConstant: 20),
        ])

        return view
    }()

    private lazy var brandsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor(red: 248.0 / 255.0, green: 248.0 / 255.0, blue: 248.0 / 255.0, alpha: 1.0)

        let imageView = UIImageView()
        imageView.image = UIImage(named: "brends")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false

        let label = UILabel()
        label.text = "Бренды"
        label.font = UIFont(name: "Verdana-Bold", size: 14)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(imageView)
        view.addSubview(label)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.widthAnchor.constraint(equalToConstant: 100),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            label.heightAnchor.constraint(equalToConstant: 20),
        ])

        return view
    }()

    private lazy var shoesView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor(red: 248.0 / 255.0, green: 248.0 / 255.0, blue: 248.0 / 255.0, alpha: 1.0)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(shoesViewTapped))
        view.addGestureRecognizer(tapGestureRecognizer)

        let imageView = UIImageView()
        imageView.image = UIImage(named: "shoes_woman")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageViews.append(imageView)

        let label = UILabel()
        label.text = "Обувь"
        label.font = UIFont(name: "Verdana-Bold", size: 14)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(imageView)
        view.addSubview(label)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.widthAnchor.constraint(equalToConstant: 100),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            label.heightAnchor.constraint(equalToConstant: 20),
        ])

        return view
    }()

    private lazy var bagsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor(red: 248.0 / 255.0, green: 248.0 / 255.0, blue: 248.0 / 255.0, alpha: 1.0)

        let imageView = UIImageView()
        imageView.image = UIImage(named: "bag_woman")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageViews.append(imageView)

        let label = UILabel()
        label.text = "Сумки"
        label.font = UIFont(name: "Verdana-Bold", size: 14)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(imageView)
        view.addSubview(label)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.widthAnchor.constraint(equalToConstant: 100),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            label.heightAnchor.constraint(equalToConstant: 20),
        ])

        return view
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        navigationItem.rightBarButtonItems = [barcodeButton, cameraButton]
        navigationItem.backBarButtonItem = backItem

        title = "Каталог"
        view.backgroundColor = .white
        view.addSubview(categorySegmentedControl)
        view.addSubview(newView)
        view.addSubview(salesView)
        view.addSubview(brandsView)
        view.addSubview(shoesView)
        view.addSubview(bagsView)

        setupCategorySegmentedControl()
        setupNewView()
        setupSalesView()
        setupBrandsView()
        setupShoesView()
        setupBagsView()
    }

    private func setupCategorySegmentedControl() {
        categorySegmentedControl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        categorySegmentedControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        categorySegmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 122).isActive = true
        categorySegmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
        if let font = UIFont(name: "Verdana-Bold", size: 12) {
            categorySegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        }
    }

    private func setupNewView() {
        newView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        newView.topAnchor.constraint(equalTo: view.topAnchor, constant: 186).isActive = true
        newView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        newView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }

    private func setupSalesView() {
        salesView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        salesView.topAnchor.constraint(equalTo: view.topAnchor, constant: 186).isActive = true
        salesView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        salesView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }

    private func setupBrandsView() {
        brandsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        brandsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 326).isActive = true
        brandsView.widthAnchor.constraint(equalToConstant: 335).isActive = true
        brandsView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func setupShoesView() {
        shoesView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        shoesView.topAnchor.constraint(equalTo: view.topAnchor, constant: 426).isActive = true
        shoesView.widthAnchor.constraint(equalToConstant: 335).isActive = true
        shoesView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func setupBagsView() {
        bagsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        bagsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 526).isActive = true
        bagsView.widthAnchor.constraint(equalToConstant: 335).isActive = true
        bagsView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    @objc private func categorySelected(_ sender: UISegmentedControl) {
        let imageNames: [String]
        switch sender.selectedSegmentIndex {
        case 0:
            imageNames = ["women_new", "women_sales", "shoes_woman", "bag_woman"]
        case 1:
            imageNames = ["man_news", "man_sales", "shoes_man", "bag_man"]
        case 2:
            imageNames = ["child_new", "child_sales", "shoes_child", "bag_child"]
        default:
            return
        }

        for (imageView, imageName) in zip(imageViews, imageNames) {
            imageView.image = UIImage(named: imageName)
        }
    }

    @objc private func shoesViewTapped() {
        let shoesViewController = ShoesViewController()
        navigationController?.pushViewController(shoesViewController, animated: true)

        guard let tabBarController = tabBarController,
              let viewControllers = tabBarController.viewControllers else { return }

        for viewController in viewControllers {
            if let navController = viewController as? UINavigationController {
                let firstViewController = navController.viewControllers.first
                if let cartViewController = firstViewController as? CartViewController {
                    shoesViewController.delegate = cartViewController
                    shoesViewController.cartViewController = cartViewController
                    break
                }
            }
        }
    }

    @objc private func cameraTapped() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
}
