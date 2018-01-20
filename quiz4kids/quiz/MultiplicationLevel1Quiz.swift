//
//  MultiplicationLevel1Quiz.swift
//  quiz4kids
//
//  Created by Keesun Baik on 19/01/2018.
//  Copyright © 2018 whiteship. All rights reserved.
//

import Foundation

class MultiplicationLevel1Quiz: Quiz {
    init(index: Int) {
        super.init()
        let left = Int(arc4random_uniform(8) + 2)
        let right = Int(arc4random_uniform(9) + 1)
        self.answer = String(left * right)
        self.question = "\(left) ✕ \(right) = ?"
        self.title = "Quiz \(index)"
        self.type = QuizTypes.multiplicationLevel1
        
        if right == 1 {
            self.question += "\n\(left) ✕ \(right + 1) = \(left * (right + 1))"
            self.question += "\n\(left) ✕ \(right + 2) = \(left * (right + 2))"
        } else if right == 9 {
            let q = self.question
            self.question = "\(left) ✕ \(right - 2) = \(left * (right - 2))"
            self.question += "\n\(left) ✕ \(right - 1) = \(left * (right - 1))"
            self.question += "\n\(q)"
        } else {
            let q = self.question
            self.question = "\(left) ✕ \(right - 1) = \(left * (right - 1))"
            self.question += "\n\(q)"
            self.question += "\n\(left) ✕ \(right + 1) = \(left * (right + 1))"
        }
    }
}
