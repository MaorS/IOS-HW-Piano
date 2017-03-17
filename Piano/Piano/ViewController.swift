//
//  ViewController.swift
//  Piano
//
//  Created by Maor Shams on 16/03/2017.
//  Copyright © 2017 Maor Shams. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player : AVAudioPlayer?
    var soundsArray = [AVAudioPlayer]()
    
    @IBAction func onClickButton(_ sender: UIButton) {
        
        // get button tag
        let tag : Int = sender.tag
        
        var file : String = ""
        
        switch tag {
        // white notes
        case 100: file = "C3"
        case 101: file = "D"
        case 102: file = "E"
        case 103: file = "F"
        case 104: file = "G"
        case 105: file = "A"
        case 106: file = "B"
        case 107: file = "C4"
            
        // black notes
        case 200: file = "C#"
        case 201: file = "D#"
        case 202: file = "F#"
        case 203: file = "G#"
        case 204: file = "A#"
        default: return
        }
        
        
        play(file)
        
        // when 20 sounds stored, start cleaning
        if soundsArray.count == 20{
            cleanArray()
        }
        
    }
    
    // keep only 10 items in array
    func cleanArray(){
        for i in 0..<(soundsArray.count-10){
            soundsArray.remove(at: i)
        }
    }
    
    // play sound
    func play(_ filename : String){
        let soundFile: String? = Bundle.main.path(forResource: filename, ofType: ".mp3")
        let audioPlayer = try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile!))
        soundsArray.append(audioPlayer!)
        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}
