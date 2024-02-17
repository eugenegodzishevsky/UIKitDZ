// CartViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран корзины
final class CartViewController: UIViewController {
    var selectedImage = [String?]()
    var selectedLabelText = [String?]()
    var selectedSize = [String?]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        title = "Корзина"

        print(selectedImage)
        print(selectedLabelText)
        print(selectedSize)
    }
}

extension CartViewController: ShoesViewControllerDelegate, SizeViewControllerDelegate {
    func didSelectShoe(imageName: String, labelText: String) {
        print("SHOES DELEGATE HERE")
        selectedImage.append(imageName)
        selectedLabelText.append(labelText)
    }

    func didSelectSize(size: String) {
        print("SIZE DELEGATE HERE")
        selectedSize.append(size)
    }
}
