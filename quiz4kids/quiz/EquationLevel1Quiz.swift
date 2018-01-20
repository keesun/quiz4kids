//
//  EquationLevel1Quiz.swift
//  quiz4kids
//
//  Created by Keesun Baik on 19/01/2018.
//  Copyright © 2018 whiteship. All rights reserved.
//

import Foundation

class EquationLevel1Quiz: Quiz {
    
    override func create(index: Int) -> Quiz {
        let quiz = EquationLevel1Quiz()
        let left = Int(arc4random_uniform(11))
        let right = Int(arc4random_uniform(11))
        quiz.answer = String(right)
        quiz.question = "\(left) + ? = \(left + right)"
        quiz.title = "Quiz \(index)"
        return quiz
    }
}
