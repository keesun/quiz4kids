//
//  AlphabetLevel1Quiz.swift
//  quiz4kids
//
//  Created by whiteship on 1/20/18.
//  Copyright © 2018 whiteship. All rights reserved.
//

import Foundation

class NumberLevel1Quiz: Quiz {
    
    var numberSoundMap: [Int: String] = [:]
    
    override init() {
        super.init()
        numberSoundMap[0] = "Zero"
        numberSoundMap[1] = "One"
        numberSoundMap[2] = "Two"
        numberSoundMap[3] = "Three"
        numberSoundMap[4] = "Four"
        numberSoundMap[5] = "Five"
        numberSoundMap[6] = "Six"
        numberSoundMap[7] = "Seven"
        numberSoundMap[8] = "Eight"
        numberSoundMap[9] = "Nine"
        numberSoundMap[10] = "Ten"
    }
    
    override func create(index: Int) -> Quiz {
        let quiz = NumberLevel1Quiz()
        let number = Int(arc4random_uniform(11))
        quiz.answer = "\(number)"
        quiz.question = numberSoundMap[number]!
        quiz.title = "Quiz \(index)"
        quiz.type = QuizTypes.numberLevel1
        return quiz
    }
    
}
