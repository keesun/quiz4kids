//
//  AudioQuizViewController.swift
//  quiz4kids
//
//  Created by whiteship on 2017. 12. 24..
//  Copyright © 2017년 whiteship. All rights reserved.
//

import UIKit
import AVFoundation

class AudioQuizViewController: UIViewController {
    
    var quiz = Quiz()
    var quizList = [Quiz]()
    var index = 0

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var speedSlider: UISlider!
    
    let synthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        navigationItem.title = quiz.title + " / 20"
        
        if let inputValue = quiz.input {
            inputTextField.text = inputValue
            updateStatus(answer: quiz.answer, input: inputValue)
            nextButtonHideOrShow()
        } else {
            inputTextField.text = ""
            nextButton.isHidden = true
            checkButton.isHidden = true
            self.view.backgroundColor = UIColor.white
            statusLabel.text = "🙄"
        }
    }
    
    func nextButtonHideOrShow() {
        if index < 19 {
            nextButton.isHidden = false
        } else {
            nextButton.isHidden = true
        }
    }
    
    func updateStatus(answer:String, input:String) {
        if (answer == input) {
            quiz.pass = true
            statusLabel.text = "😄 Good job."
            self.view.backgroundColor = Colors.green
        } else {
            quiz.pass = false
            statusLabel.text = "🤔 Think again."
            self.view.backgroundColor = Colors.red
        }
    }

    @IBAction func playTapped(_ sender: Any) {        
        let utterance = AVSpeechUtterance(string: quiz.question)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = speedSlider.value
        synthesizer.speak(utterance)
    }
    
    @IBAction func inputEdited(_ sender: Any) {
        checkButton.isHidden = false
        nextButtonHideOrShow()
    }
    
    @IBAction func checkTapped(_ sender: Any) {
        if let inputText = inputTextField.text {
            quiz.input = inputText
            updateStatus(answer: quiz.answer, input: inputText)
        }
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        if let inputText = inputTextField.text {
            quiz.input = inputText
            updateStatus(answer: quiz.answer, input: inputText)
        }
        
        self.index += 1
        self.quiz = quizList[self.index]
        updateView()
    }
    
    @IBAction func helpTapped(_ sender: Any) {
        var characters = Array(quiz.answer)
        let index = Int(arc4random_uniform(UInt32(characters.count)))
        characters[index] = "_"
        statusLabel.text = String(characters)
    }
}
