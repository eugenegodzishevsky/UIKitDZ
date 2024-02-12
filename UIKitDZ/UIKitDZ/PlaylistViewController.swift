// PlaylistViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью контроллер плейлист
class PlaylistViewController: UIViewController {
    @IBOutlet var track1Label: UILabel!
    @IBOutlet var track2Label: UILabel!
    @IBOutlet var track3Label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let labels = [track1Label, track2Label, track3Label]
        for label in labels {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
            label?.isUserInteractionEnabled = true
            label?.addGestureRecognizer(tapGesture)
        }
    }

    @objc func labelTapped() {
        // let playerViewController = PlayerViewController()

        // Передайте информацию о треке в следующий ViewController
        // Здесь 'track' - это информация о треке, которую вы хотите передать
        // playerViewController.track = track
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let playerViewController = storyboard
            .instantiateViewController(withIdentifier: "PlayerViewController") as? PlayerViewController else { return }
        // на Storyboard ID вашего PlayerViewController
        // Представьте его модально
        present(playerViewController, animated: true, completion: nil)
    }
}
