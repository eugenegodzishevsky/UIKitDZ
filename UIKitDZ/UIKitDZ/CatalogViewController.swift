// CatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// класс
class CatalogViewController: UIViewController {
    private let autorizationLabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 280, width: 195, height: 31))
        label.text = "Catalog"
        label.font = UIFont(name: "verdana", size: 26)
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Каталог"
        view.backgroundColor = .brown
        print("ViewDidLoad")
    }
}
