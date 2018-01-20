//
//  PlusLevel3Quiz.swift
//  quiz4kids
//
//  Created by Keesun Baik on 19/01/2018.
//  Copyright © 2018 whiteship. All rights reserved.
//

import Foundation

class PlusLevel3Quiz : Quiz {
    init(index: Int) {
        super.init()
        let first = Int(arc4random_uniform(11))
        let second = Int(arc4random_uniform(11))
        let third = Int(arc4random_uniform(11))
        self.answer = String(first + second + third)
        self.question = "\(first) + \(second) + \(third) = ?"
        self.title = "Quiz \(index)"
        self.type = QuizTypes.plusLevel3
    }
}
