//
//  QuizViewController.swift
//  quiz4kids
//
//  Created by whiteship on 2017. 12. 22..
//  Copyright © 2017년 whiteship. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quiz = Quiz()
    var quizList = [Quiz]()
    var index = 0
    var horizontal = true

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var checkButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        navigationItem.title = quiz.title + " / 20"
        
        if (horizontal) {
            // 5 + 3 = ?
            questionLabel.text = quiz.question
            questionLabel.textAlignment = .left;
        } else {
            let splits = quiz.question.components(separatedBy: " ")
            if (splits.count < 3) {
                questionLabel.text = quiz.question
                questionLabel.textAlignment = .left;
                horizontal = true
                //         5
                //      + 13
                // ----------
                //         ?
            } else if (splits.count == 5) {
                questionLabel.numberOfLines = 4
                let a = splits[0]
                let operand = splits[1]
                let b = splits[2]
                let c = splits[4]
                questionLabel.textAlignment = .right
                var quizQuestion = a + "\n"
                quizQuestion += operand + " " + b
                quizQuestion += "\n" + "---------" + "\n" + c
                questionLabel.text = quizQuestion
            } else {
                //         5
                //      +  3
                //      +  2
                // ----------
                //         ?
                questionLabel.numberOfLines = 5
                let a = splits[0]
                let oper1 = splits[1]
                let b = splits[2]
                let oper2 = splits[3]
                let c = splits[4]
                let d = splits[6]
                questionLabel.textAlignment = .right
                var quizQuestion = a + "\n"
                quizQuestion += oper1 + " " + b + "\n"
                quizQuestion += oper2 + " " + c + "\n"
                quizQuestion += "---------" + "\n" + d
                questionLabel.text = quizQuestion
            }
        }
        
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
    
    @IBAction func inputEditing(_ sender: Any) {
        checkButton.isHidden = false
        nextButtonHideOrShow()
    }
    
    @IBAction func refareshTapped(_ sender: Any) {
        horizontal = !horizontal
        updateView()
    }
    
}
