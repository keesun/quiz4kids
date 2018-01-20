//
//  PlusLevel2Quiz.swift
//  quiz4kids
//
//  Created by Keesun Baik on 19/01/2018.
//  Copyright © 2018 whiteship. All rights reserved.
//

import Foundation

class PlusLevel2Quiz : Quiz {
    
    override func create(index: Int) -> Quiz {
        let quiz = PlusLevel2Quiz()
        let left = Int(arc4random_uniform(101))
        let right = Int(arc4random_uniform(11))
        quiz.answer = String(left + right)
        quiz.question = "\(left) + \(right) = ?"
        quiz.title = "Quiz \(index)"
        quiz.type = QuizTypes.plusLevel2
        return quiz
    }
    
}
