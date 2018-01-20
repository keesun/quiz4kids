//
//  CountingLevel1Quiz.swift
//  quiz4kids
//
//  Created by Keesun Baik on 19/01/2018.
//  Copyright © 2018 whiteship. All rights reserved.
//

import Foundation

class CountingLevel1Quiz: Quiz {
    
    override func create(index: Int) -> Quiz {
        let quiz = CountingLevel1Quiz()
        let appleCount = Int(arc4random_uniform(10) + 1)
        quiz.answer = String(appleCount)
        quiz.question = "apple\(appleCount).png"
        quiz.title = "Quiz \(index)"
        return quiz
    }
}
