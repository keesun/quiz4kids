//
//  PlusLevel3Quiz.swift
//  quiz4kids
//
//  Created by Keesun Baik on 19/01/2018.
//  Copyright © 2018 whiteship. All rights reserved.
//

import Foundation

class PlusLevel3Quiz : Quiz {
    
    override func create(index: Int) -> Quiz {
        let quiz = PlusLevel3Quiz()
        let first = Int(arc4random_uniform(11))
        let second = Int(arc4random_uniform(11))
        let third = Int(arc4random_uniform(11))
        quiz.answer = String(first + second + third)
        quiz.question = "\(first) + \(second) + \(third) = ?"
        quiz.title = "Quiz \(index)"
        quiz.type = QuizTypes.plusLevel3
        return quiz
    }
}
