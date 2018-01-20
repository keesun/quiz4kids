//
//  MultiplicationLevel1Quiz.swift
//  quiz4kids
//
//  Created by Keesun Baik on 19/01/2018.
//  Copyright © 2018 whiteship. All rights reserved.
//

import Foundation

class MultiplicationLevel1Quiz: Quiz {
    
    override func create(index: Int) -> Quiz {
        let quiz = MultiplicationLevel1Quiz()
        let left = Int(arc4random_uniform(8) + 2)
        let right = Int(arc4random_uniform(9) + 1)
        quiz.answer = String(left * right)
        quiz.question = "\(left) ✕ \(right) = ?"
        quiz.title = "Quiz \(index)"
        quiz.type = QuizTypes.multiplicationLevel1
        
        if right == 1 {
            quiz.question += "\n\(left) ✕ \(right + 1) = \(left * (right + 1))"
            quiz.question += "\n\(left) ✕ \(right + 2) = \(left * (right + 2))"
        } else if right == 9 {
            let q = quiz.question
            quiz.question = "\(left) ✕ \(right - 2) = \(left * (right - 2))"
            quiz.question += "\n\(left) ✕ \(right - 1) = \(left * (right - 1))"
            quiz.question += "\n\(q)"
        } else {
            let q = quiz.question
            quiz.question = "\(left) ✕ \(right - 1) = \(left * (right - 1))"
            quiz.question += "\n\(q)"
            quiz.question += "\n\(left) ✕ \(right + 1) = \(left * (right + 1))"
        }
        return quiz
    }
}
