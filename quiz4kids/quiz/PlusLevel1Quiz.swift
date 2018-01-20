//
//  PlusLevel1Quiz.swift
//  quiz4kids
//
//  Created by Keesun Baik on 19/01/2018.
//  Copyright © 2018 whiteship. All rights reserved.
//

import Foundation

class PlusLevel1Quiz: Quiz {
    init(index: Int) {
        super.init()
        let left = Int(arc4random_uniform(11))
        let right = Int(arc4random_uniform(11))
        self.answer = String(left + right)
        self.question = "\(left) + \(right) = ?"
        self.title = "Quiz \(index)"
        self.type = QuizTypes.plusLevel1
    }    
}
