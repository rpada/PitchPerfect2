//
//  PlaySoundsViewController.swift
//  PitchPerfect2
//
//  Created by Brenna Pada on 3/22/22.
//

import UIKit
import AVFoundation
class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    func adjustButtonPos(){
        snailButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit;
    }
    @IBOutlet weak var chipmunkButton: UIButton!
    func adjustChipmunkPos(){
        chipmunkButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFit;
    }
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    

    var recordedAudioURL:URL!
    var audioFile:AVAudioFile!
    var audioEngine:AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }

    // MARK: Actions

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
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func initAllButtonPos() {
            adjustButtonPos(snailButton)
            adjustButtonPos(chipmunkButton)
            adjustButtonPos(rabbitButton)
            adjustButtonPos(vaderButton)
            adjustButtonPos(echoButton)
            adjustButtonPos(reverbButton)
            adjustButtonPos(stopButton)
        }
        
        func adjustButtonPos(_ button : UIButton){
            button.imageView?.contentMode = UIView.ContentMode.scaleAspectFit;
        }

}
