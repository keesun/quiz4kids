//
//  MinusLevel2Quiz.swift
//  quiz4kids
//
//  Created by Keesun Baik on 19/01/2018.
//  Copyright © 2018 whiteship. All rights reserved.
//

import Foundation

class MinusLevel2Quiz: Quiz {
    
    override func create(index: Int) -> Quiz {
        let quiz = MinusLevel2Quiz()
        let left = Int(arc4random_uniform(91) + 10)
        let right = Int(arc4random_uniform(10))
        quiz.answer = String(left - right)
        quiz.question = "\(left) - \(right) = ?"
        quiz.title = "Quiz \(index)"
        quiz.type = QuizTypes.minusLevel2
        return quiz
    }
}
