//
//  CountingLevel1Quiz.swift
//  quiz4kids
//
//  Created by Keesun Baik on 19/01/2018.
//  Copyright © 2018 whiteship. All rights reserved.
//

import Foundation

class CountingLevel1Quiz: Quiz {
    init(index: Int) {
        super.init()
        let appleCount = Int(arc4random_uniform(10) + 1)
        self.answer = String(appleCount)
        self.question = "apple\(appleCount).png"
        self.title = "Quiz \(index)"
    }
}
