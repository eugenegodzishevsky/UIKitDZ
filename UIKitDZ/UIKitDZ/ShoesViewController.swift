// ShoesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol ShoesViewControllerDelegate: AnyObject {
    func didSelectShoe(imageName: String, labelText: String)
    // func didSelectSize(size: String)
}

/// экран с выбором обуви
final class ShoesViewController: UIViewController {
    weak var cartViewController: CartViewController?

    // let cartViewController = CartViewController()
    weak var delegate: ShoesViewControllerDelegate?

    // MARK: UI

    private var cartImages: [UIImageView] = []
    private var isPink: [Bool] = []
    private var shoeViewsData: [ShoeViewData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        title = "Обувь"

        let shoeView1 = createCustomView(withImageNamed: "shoe_1", labelText: "2250 ₽")
        let shoeView2 = createCustomView(withImageNamed: "shoe_2", labelText: "4250 ₽")
        let shoeView3 = createCustomView(withImageNamed: "shoe_3", labelText: "5750 ₽")
        let shoeView4 = createCustomView(withImageNamed: "shoe_4", labelText: "3500 ₽")
        let shoeView5 = createCustomView(withImageNamed: "shoe_5", labelText: "5750 ₽")

        view.addSubview(shoeView1)
        view.addSubview(shoeView2)
        view.addSubview(shoeView3)
        view.addSubview(shoeView4)
        view.addSubview(shoeView5)

        NSLayoutConstraint.activate([
            shoeView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            shoeView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            shoeView1.widthAnchor.constraint(equalToConstant: 157),
            shoeView1.heightAnchor.constraint(equalToConstant: 157),

            shoeView2.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            shoeView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 198),
            shoeView2.widthAnchor.constraint(equalToConstant: 157),
            shoeView2.heightAnchor.constraint(equalToConstant: 157),

            shoeView3.topAnchor.constraint(equalTo: view.topAnchor, constant: 303),
            shoeView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            shoeView3.widthAnchor.constraint(equalToConstant: 157),
            shoeView3.heightAnchor.constraint(equalToConstant: 157),

            shoeView4.topAnchor.constraint(equalTo: view.topAnchor, constant: 303),
            shoeView4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 198),
            shoeView4.widthAnchor.constraint(equalToConstant: 157),
            shoeView4.heightAnchor.constraint(equalToConstant: 157),

            shoeView5.topAnchor.constraint(equalTo: view.topAnchor, constant: 476),
            shoeView5.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            shoeView5.widthAnchor.constraint(equalToConstant: 157),
            shoeView5.heightAnchor.constraint(equalToConstant: 157)
        ])
    }

    private func createCustomView(withImageNamed imageName: String, labelText: String) -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(red: 248.0 / 255.0, green: 248.0 / 255.0, blue: 248.0 / 255.0, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = false

        let shoeImage = UIImageView()
        shoeImage.image = UIImage(named: imageName)
        shoeImage.contentMode = .scaleAspectFit
        shoeImage.translatesAutoresizingMaskIntoConstraints = false

        let cartImage = UIImageView()
        cartImage.image = UIImage(named: "cart")
        cartImage.contentMode = .scaleAspectFit
        cartImage.translatesAutoresizingMaskIntoConstraints = false
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(cartTapped))
        cartImage.addGestureRecognizer(tapGestureRecognizer)
        cartImage.isUserInteractionEnabled = true
        cartImages.append(cartImage)
        isPink.append(false)

        let shoeViewData = ShoeViewData(imageName: imageName, labelText: labelText)
        shoeViewsData.append(shoeViewData)

        let label = UILabel()
        label.text = labelText
        label.textAlignment = .right
        label.font = UIFont(name: "Verdana-Bold", size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(shoeImage)
        view.addSubview(cartImage)

        view.addSubview(label)

        NSLayoutConstraint.activate([
            shoeImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 27),
            shoeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 29),
            shoeImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            shoeImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),

            cartImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 11.5),
            cartImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 126),
            cartImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -11),
            cartImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -126.5),

            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 85),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -9),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12),
            label.heightAnchor.constraint(equalToConstant: 20),
        ])

        return view
    }

    @objc private func cartTapped(_ sender: UITapGestureRecognizer) {
        if let imageView = sender.view as? UIImageView {
            if let index = cartImages.firstIndex(of: imageView) {
                if isPink[index] {
                    imageView.image = UIImage(named: "cart")
                    isPink[index] = false
                } else {
                    imageView.image = UIImage(named: "cart_pink")
                    isPink[index] = true

                    let shoeViewData = shoeViewsData[index]
                    let imageName = shoeViewData.imageName
                    let labelText = shoeViewData.labelText
                    print("pic - \(shoeViewData.imageName), text - \(shoeViewData.labelText)")
                    delegate?.didSelectShoe(imageName: imageName, labelText: labelText)

                    let sizeViewController = SizeViewController()
                    sizeViewController.delegate = cartViewController
                    if sizeViewController.delegate == nil {
                        print("Delegate is nil")
                    } else {
                        print("Delegate is not nil")
                    }

                    present(sizeViewController, animated: true, completion: nil)
                }
            }
        }
    }
}
