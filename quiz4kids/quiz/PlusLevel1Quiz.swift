//
//  PlusLevel1Quiz.swift
//  quiz4kids
//
//  Created by Keesun Baik on 19/01/2018.
//  Copyright © 2018 whiteship. All rights reserved.
//

import Foundation

class PlusLevel1Quiz: Quiz {
    
    override func create(index: Int) -> Quiz {
        let quiz = PlusLevel1Quiz()
        let left = Int(arc4random_uniform(11))
        let right = Int(arc4random_uniform(11))
        quiz.answer = String(left + right)
        quiz.question = "\(left) + \(right) = ?"
        quiz.title = "Quiz \(index)"
        quiz.type = QuizTypes.plusLevel1
        return quiz
    }
    
}
