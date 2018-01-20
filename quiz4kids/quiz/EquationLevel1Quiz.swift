//
//  EquationLevel1Quiz.swift
//  quiz4kids
//
//  Created by Keesun Baik on 19/01/2018.
//  Copyright © 2018 whiteship. All rights reserved.
//

import Foundation

class EquationLevel1Quiz: Quiz {
    init(index: Int) {
        super.init()
        let left = Int(arc4random_uniform(11))
        let right = Int(arc4random_uniform(11))
        self.answer = String(right)
        self.question = "\(left) + ? = \(left + right)"
        self.title = "Quiz \(index)"
    }
}
