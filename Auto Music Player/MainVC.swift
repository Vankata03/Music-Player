//
//  ViewController.swift
//  Auto Music Player
//
//  Created by Ivan Terziev on 12.10.20.
//

import UIKit
import AVFoundation

// MARK: - Class Beginning
class MainVC: UIViewController {
    
    
    // MARK: - Properties
    @IBOutlet var buttonSong1: UIButton!
    @IBOutlet var buttonSong2: UIButton!
    @IBOutlet var buttonSong3: UIButton!
    @IBOutlet var buttonSong4: UIButton!
    var songs: [String] = ["Ne mersi", "Sveti Valentin", "Koi", "S teb ili s nikoi"]
    var player: AVAudioPlayer?

    
    // MARK: - App Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        updateButtonLabel()

    }
    
    
    // MARK: - Methods
    func setup() {
        buttonSong1.layer.cornerRadius = 25
        buttonSong2.layer.cornerRadius = 25
        buttonSong3.layer.cornerRadius = 25
        buttonSong4.layer.cornerRadius = 25
    }
    
    func updateButtonLabel() {
        buttonSong1.setTitle(songs[0], for: .normal)
        buttonSong2.setTitle(songs[1], for: .normal)
        buttonSong3.setTitle(songs[2], for: .normal)
        buttonSong4.setTitle(songs[3], for: .normal)
    }
    
    func playSound(_ songNum: Int) {
        
        guard let path = Bundle.main.path(forResource: "song\(songNum)", ofType: ".mp3") else { return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("Failed to load file")
        }
    }
    
    
    // MARK: - Button actions
    @IBAction func buttonPressed(_ sender: UIButton) {
        playSound(sender.tag)
    }
}
