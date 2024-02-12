// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

//
//  PlayerViewController.swift
//  UIKitDZ
//
//  Created by Vermut xxx on 12.02.2024.
//
import UIKit

/// Вью контроллер плеера
class PlayerViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = UIImage(named: "background") {
            view.backgroundColor = UIColor(patternImage: image)
        }
        // view.backgroundColor = .white
        print("2")
        // Do any additional setup after loading the view.
    }
}
