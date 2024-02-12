// PlaylistViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью контроллер плейлист первого экрана приложения
final class PlaylistViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var track1Label: UILabel!
    @IBOutlet private var track2Label: UILabel!
    @IBOutlet private var track3Label: UILabel!

    // MARK: - Private Properties

    private var tracks = ["Sugar Dragon", "01 Constance", "01 The Sentinel"]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        let labels = [track1Label, track2Label, track3Label]
        for (index, label) in labels.enumerated() {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
            label?.isUserInteractionEnabled = true
            label?.addGestureRecognizer(tapGesture)
            label?.tag = index
        }
    }

    // MARK: - Private Methods

    @objc private func labelTapped(_ sender: UITapGestureRecognizer) {
        if let index = sender.view?.tag {
            let trackName = tracks[index]

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let playerViewController = storyboard
                .instantiateViewController(withIdentifier: "PlayerViewController") as? PlayerViewController
            else { return }

            playerViewController.track = trackName
            playerViewController.tracks = tracks

            present(playerViewController, animated: true, completion: nil)
        }
    }
}
