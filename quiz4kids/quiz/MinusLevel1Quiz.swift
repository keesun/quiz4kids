//
//  MinusLevel1Quiz.swift
//  quiz4kids
//
//  Created by Keesun Baik on 19/01/2018.
//  Copyright © 2018 whiteship. All rights reserved.
//

import Foundation

class MinusLevel1Quiz : Quiz {
    
    override func create(index: Int) -> Quiz {
        let quiz = MinusLevel1Quiz()
        let left = Int(arc4random_uniform(6) + 5)
        let right = Int(arc4random_uniform(5))
        quiz.answer = String(left - right)
        quiz.question = "\(left) - \(right) = ?"
        quiz.title = "Quiz \(index)"
        quiz.type = QuizTypes.minusLevel1
        return quiz
    }
}
