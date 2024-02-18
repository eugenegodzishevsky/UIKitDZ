// CartViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран корзины
final class CartViewController: UIViewController {
    enum Constants {
        static let totalBillText = "Оформить заказ - "
    }

    private lazy var totalBillButton = makeCustomButton(text: Constants.totalBillText)
    private lazy var quantityLabel = {
        let label = UILabel()
        label.text = "\(quantity)"
        label.textAlignment = .center
        label.font = UIFont(name: "Verdana", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var selectedImage = [String?]()
    var selectedLabelText = [String?]()
    var selectedSize = [String?]()
    var cartItems = [UIView?]()

    var quantity = 1 {
        didSet {
            quantityLabel.text = String(quantity)
        }
    }

    var price = 0
    var currentPrice = 0 {
        didSet {
            totalBillButton.setTitle(Constants.totalBillText + String(currentPrice), for: .normal)
            print(currentPrice)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        print(selectedImage)
        print(selectedLabelText)
        print(selectedSize)
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = "Корзина"

        for itemView in cartItems {
            itemView?.removeFromSuperview()
        }
        cartItems.removeAll()

        for index in 0 ..< selectedImage.count {
            let imageName = selectedImage[index] ?? ""
            let labelText = selectedLabelText[index] ?? ""
            let stringLabel = labelText.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
            if let lastItem = cartItems.last {
                let newBaseView = createCustomView(withImageNamed: imageName, priceLabelText: labelText)
                view.addSubview(newBaseView)
                cartItems.append(newBaseView)
                price = Int(stringLabel) ?? 100_000
                currentPrice = Int(stringLabel) ?? 100_000
                NSLayoutConstraint.activate([
                    newBaseView.topAnchor.constraint(
                        equalTo: lastItem?.bottomAnchor ?? view.bottomAnchor,
                        constant: 20
                    ),
                    newBaseView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    newBaseView.widthAnchor.constraint(equalToConstant: 333),
                    newBaseView.heightAnchor.constraint(equalToConstant: 157),
                ])
            } else {
                let newBaseView = createCustomView(withImageNamed: imageName, priceLabelText: labelText)
                view.addSubview(newBaseView)
                cartItems.append(newBaseView)
                price = Int(stringLabel) ?? 100_000
                currentPrice = Int(stringLabel) ?? 100_000
                NSLayoutConstraint.activate([
                    newBaseView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
                    newBaseView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    newBaseView.widthAnchor.constraint(equalToConstant: 333),
                    newBaseView.heightAnchor.constraint(equalToConstant: 157),
                ])
            }
        }
    }

    private func createCustomView(
        withImageNamed imageName: String,
        priceLabelText: String // ,
        // sizeLabelText: String
    ) -> UIView {
        let baseView = UIView()
        baseView.backgroundColor = UIColor.white
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.layer.cornerRadius = 12
        baseView.layer.masksToBounds = false

        let view = UIView()
        view.backgroundColor = UIColor(red: 248.0 / 255.0, green: 248.0 / 255.0, blue: 248.0 / 255.0, alpha: 1.0)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = false

        let shoeImage = UIImageView()
        shoeImage.image = UIImage(named: imageName)
        shoeImage.translatesAutoresizingMaskIntoConstraints = false

        let cartButton = UIButton()
        cartButton.setImage(UIImage(named: "cart_pink"), for: .normal)
        cartButton.contentMode = .scaleAspectFit
        cartButton.translatesAutoresizingMaskIntoConstraints = false
        cartButton.addTarget(self, action: #selector(cartTapped(_:)), for: .touchUpInside)
        cartButton.tag = cartItems.count // Установка тега для кнопки
        cartButton.isUserInteractionEnabled = true
        // cartImages.append(cartImage)
        // isPink.append(false)

        let priceLabel = UILabel()
        priceLabel.text = priceLabelText
//        currentPrice = Int(Double(priceLabel.text ?? "0") ?? 0)
        // priceLabel.text = "\(price)"

        priceLabel.textAlignment = .right
        priceLabel.font = UIFont(name: "Verdana-Bold", size: 10)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false

        let nameLabel = UILabel()
        nameLabel.text = "Женские ботинки"
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont(name: "Verdana", size: 12)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false

        let quantityNameLabel = UILabel()
        quantityNameLabel.text = "Количество"
        quantityNameLabel.textAlignment = .left
        quantityNameLabel.font = UIFont(name: "Verdana", size: 12)
        quantityNameLabel.translatesAutoresizingMaskIntoConstraints = false

        let sizingLabel = UILabel()
        sizingLabel.text = "Размер"
        sizingLabel.textAlignment = .left
        sizingLabel.font = UIFont(name: "Verdana", size: 12)
        sizingLabel.translatesAutoresizingMaskIntoConstraints = false

        let pricingLabel = UILabel()
        pricingLabel.text = "Цена"
        pricingLabel.textAlignment = .left
        pricingLabel.font = UIFont(name: "Verdana", size: 12)
        pricingLabel.translatesAutoresizingMaskIntoConstraints = false

        func setupSizeButtons(size: String) -> UIButton {
            let button = UIButton()
            button.setBackgroundImage(UIImage(named: "button"), for: .normal)
            button.setTitle(size, for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.titleLabel?.font = UIFont(name: "Verdana", size: 10)
            button.isUserInteractionEnabled = true
            button.layer.cornerRadius = 20
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(sizeButtonTapped), for: .touchUpInside)
            return button
        }

        func setupQuantityButtons(operation: String) -> UIButton {
            let button = UIButton()
            button.setBackgroundImage(UIImage(named: "button"), for: .normal)
            button.setTitle(operation, for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.titleLabel?.font = UIFont(name: "Verdana", size: 10)
            button.isUserInteractionEnabled = true
            button.layer.cornerRadius = 20
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(quantityButtonTapped), for: .touchUpInside)
            return button
        }

        let sizeButton1 = setupSizeButtons(size: "35")
        let sizeButton2 = setupSizeButtons(size: "36")
        let sizeButton3 = setupSizeButtons(size: "37")
        let sizeButton4 = setupSizeButtons(size: "38")
        let sizeButton5 = setupSizeButtons(size: "39")

        let operationButton1 = setupQuantityButtons(operation: "-")
        operationButton1.tag = 0
        let operationButton2 = setupQuantityButtons(operation: "+")
        operationButton1.tag = 1

        baseView.addSubview(view)
        view.addSubview(shoeImage)
        view.addSubview(cartButton)
        view.addSubview(priceLabel)
        view.addSubview(nameLabel)
        view.addSubview(quantityNameLabel)
        view.addSubview(sizingLabel)
        view.addSubview(pricingLabel)
        baseView.addSubview(sizeButton1)
        baseView.addSubview(sizeButton2)
        baseView.addSubview(sizeButton3)
        baseView.addSubview(sizeButton4)
        baseView.addSubview(sizeButton5)
        baseView.addSubview(operationButton1)
        baseView.addSubview(operationButton2)
        baseView.addSubview(quantityLabel)

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 157),
            view.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 157),

            shoeImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 27),
            shoeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 29),
            shoeImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -28),
            shoeImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),

            cartButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 11.5),
            cartButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 126),
            cartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -11),
            cartButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -126.5),

            priceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 144),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 266),
            priceLabel.widthAnchor.constraint(equalToConstant: 63),
            priceLabel.heightAnchor.constraint(equalToConstant: 12),

            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 18),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 173),
            nameLabel.widthAnchor.constraint(equalToConstant: 110),
            nameLabel.heightAnchor.constraint(equalToConstant: 15),

            quantityNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 45),
            quantityNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 173),
            quantityNameLabel.widthAnchor.constraint(equalToConstant: 72),
            quantityNameLabel.heightAnchor.constraint(equalToConstant: 15),

            sizingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 72),
            sizingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 173),
            sizingLabel.widthAnchor.constraint(equalToConstant: 44),
            sizingLabel.heightAnchor.constraint(equalToConstant: 15),

            pricingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 142),
            pricingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 173),
            pricingLabel.widthAnchor.constraint(equalToConstant: 32),
            pricingLabel.heightAnchor.constraint(equalToConstant: 15),

            sizeButton1.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 97),
            sizeButton1.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 179),
            sizeButton1.widthAnchor.constraint(equalToConstant: 31),
            sizeButton1.heightAnchor.constraint(equalToConstant: 17),

            sizeButton2.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 97),
            sizeButton2.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 219),
            sizeButton2.widthAnchor.constraint(equalToConstant: 31),
            sizeButton2.heightAnchor.constraint(equalToConstant: 17),

            sizeButton3.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 97),
            sizeButton3.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 259),
            sizeButton3.widthAnchor.constraint(equalToConstant: 31),
            sizeButton3.heightAnchor.constraint(equalToConstant: 17),

            sizeButton4.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 97),
            sizeButton4.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 299),
            sizeButton4.widthAnchor.constraint(equalToConstant: 31),
            sizeButton4.heightAnchor.constraint(equalToConstant: 17),

            sizeButton5.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 118),
            sizeButton5.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 179),
            sizeButton5.widthAnchor.constraint(equalToConstant: 31),
            sizeButton5.heightAnchor.constraint(equalToConstant: 17),

            operationButton1.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 46),
            operationButton1.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 260),
            operationButton1.widthAnchor.constraint(equalToConstant: 15),
            operationButton1.heightAnchor.constraint(equalToConstant: 15),

            operationButton2.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 46),
            operationButton2.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 300),
            operationButton2.widthAnchor.constraint(equalToConstant: 15),
            operationButton2.heightAnchor.constraint(equalToConstant: 15),

            quantityLabel.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 46),
            quantityLabel.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 280),
            quantityLabel.widthAnchor.constraint(equalToConstant: 17),
            quantityLabel.heightAnchor.constraint(equalToConstant: 15),

        ])

        return baseView
    }

    @objc private func sizeButtonTapped(_ sender: UIButton) {
        if sender.tag == 0 {
            print("button tapped")
            sender.setBackgroundImage(UIImage(named: "button_pink"), for: .normal)
            sender.tag = 1
        } else {
            print("button tapped")
            sender
                .setBackgroundImage(
                    UIImage(named: "button"),
                    for: .normal
                )
            sender.tag = 0
        }
    }

    @objc private func quantityButtonTapped(_ sender: UIButton) {
        let tag = sender.tag
        if tag == 1 {
            print("-")
            if quantity > 0 {
                quantity -= 1
                currentPrice -= price
//                setupUI()
            }
        } else {
            print("+")
            quantity += 1
            print(quantity)
            currentPrice += price
//            setupUI()
        }
//        priceLabel.text = "\(price)"
//        setupUI()
    }

    @objc private func cartTapped(_ sender: UIButton) {
        let tag = sender.tag

        selectedImage.remove(at: tag)
        selectedLabelText.remove(at: tag)
        selectedSize.remove(at: tag)

        cartItems[tag]?.removeFromSuperview()

        cartItems.remove(at: tag)

        for index in 0 ..< cartItems.count {
            cartItems[index]?.tag = index
        }
    }
}

extension CartViewController: ShoesViewControllerDelegate, SizeViewControllerDelegate {
    func didSelectShoe(imageName: String, labelText: String) {
        print("SHOES DELEGATE HERE")
        selectedImage.append(imageName)
        selectedLabelText.append(labelText)
        setupUI()
    }

    func didSelectSize(size: String) {
        print("SIZE DELEGATE HERE")
        selectedSize.append(size)
    }
}
