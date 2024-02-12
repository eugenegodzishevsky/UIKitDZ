// PlayerViewController.swift
// Copyright © RoadMap. All rights reserved.

//
//  PlayerViewController.swift
//  UIKitDZ
//
//  Created by Vermut xxx on 12.02.2024.
//
import AVFoundation
import UIKit

/// Вью контроллер плеера второго экрана приложения
final class PlayerViewController: UIViewController {
    // MARK: - Private Properties

    private var player: AVAudioPlayer?
    private var currentTrackIndex = 0
    private var timer: Timer?

    // MARK: - Properties

    var track: String?
    var tracks: [String]?

    // MARK: - IBOutlets

    @IBOutlet var trackTimeLabel: UILabel!
    @IBOutlet var trackNameLabel: UILabel!
    @IBOutlet var slider: UISlider!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        // громкость
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set up audio session: \(error)")
        }
        // задний фон
        if let image = UIImage(named: "background") {
            view.backgroundColor = UIColor(patternImage: image)

            if let trackName = track, let url = Bundle.main.url(forResource: trackName, withExtension: "mp3") {
                player = try? AVAudioPlayer(contentsOf: url)
                player?.play()
                currentTrackIndex = tracks?.firstIndex(of: trackName) ?? 0
                trackNameLabel.text = trackName
            }
        }

        slider.minimumValue = 0
        if let duration = player?.duration {
            slider.maximumValue = Float(duration)
        }
        slider.addTarget(self, action: #selector(sliderValueChanged(_:)), for: .valueChanged)
        startUpdatingSlider()
    }

    // MARK: - IBActions

    @IBAction func playButtonTapped(_ sender: UIButton) {
        if player?.isPlaying == true {
            player?.pause()
            sender.setImage(UIImage(named: "play"), for: .normal)
        } else {
            player?.play()
            sender.setImage(UIImage(named: "pause"), for: .normal)
        }
    }

    @IBAction func forwardTrackButtonTapped(_ sender: UIButton) {
        currentTrackIndex = (currentTrackIndex + 1) % (tracks?.count ?? 0)
        loadTrack()
        player?.play()
        trackNameLabel.text = tracks?[currentTrackIndex]
    }

    @IBAction func rewindTrackButtonTapped(_ sender: UIButton) {
        currentTrackIndex = (currentTrackIndex - 1 + (tracks?.count ?? 0)) % (tracks?.count ?? 0)
        loadTrack()
        player?.play()
        trackNameLabel.text = tracks?[currentTrackIndex]
    }

    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func forwardButtonTapped(_ sender: UIButton) {
        if let currentTime = player?.currentTime {
            player?.currentTime = currentTime + 30
        }
    }

    @IBAction func rewindButtonTapped(_ sender: UIButton) {
        if let currentTime = player?.currentTime {
            player?.currentTime = currentTime - 30
        }
    }

    // MARK: - Private Methods

    private func loadTrack() {
        if let url = Bundle.main.url(forResource: tracks?[currentTrackIndex], withExtension: "mp3") {
            player = try? AVAudioPlayer(contentsOf: url)
        }
    }

    private func startUpdatingSlider() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.slider.value = Float(self.player?.currentTime ?? 0)
            self.trackTimeLabel.text = self.timeString(time: TimeInterval(self.slider.value))
        }
    }

    private func timeString(time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }

    @objc private func sliderValueChanged(_ sender: UISlider) {
        player?.currentTime = TimeInterval(sender.value)
        trackTimeLabel.text = timeString(time: TimeInterval(sender.value))
    }
}
