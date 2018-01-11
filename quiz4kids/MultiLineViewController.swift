//
//  MultiLineViewController.swift
//  quiz4kids
//
//  Created by whiteship on 1/3/18.
//  Copyright © 2018 whiteship. All rights reserved.
//

import UIKit

class MultiLineViewController: UIViewController {
    
    var quiz = Quiz()
    var quizList = [Quiz]()
    var index = 0

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var statusLabel: UILabel!    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }

    func updateView() {
        navigationItem.title = quiz.title + " / 20"
        questionLabel.text = quiz.question
        
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
    
    @IBAction func inputChanged(_ sender: Any) {
        checkButton.isHidden = false
        nextButtonHideOrShow()
    }
}
