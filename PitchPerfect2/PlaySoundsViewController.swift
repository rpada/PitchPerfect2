//
//  PlaySoundsViewController.swift
//  PitchPerfect2
//
//  Created by Rianne Pada on 3/22/22.
//

import UIKit
import AVFoundation
class PlaySoundsViewController: UIViewController {
    // defining buttons
    @IBOutlet weak var snailButton: UIButton!
  
    @IBOutlet weak var chipmunkButton: UIButton!
   
    @IBOutlet weak var rabbitButton: UIButton!
   
    @IBOutlet weak var vaderButton: UIButton!
   
    @IBOutlet weak var echoButton: UIButton!
   
    @IBOutlet weak var reverbButton: UIButton!
  
    @IBOutlet weak var stopButton: UIButton!
    
    // defining audio
    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    // defining button sounds
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }

    // MARK: Actions for sounds

    @IBAction func playSoundForButton(_ sender: UIButton) {
        
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }

        configureUI(.playing)
    }

    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        stopAudio() // stops audio when pressed
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying) //appears when audio is not playing
    }

}

