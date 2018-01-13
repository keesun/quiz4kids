//
//  Quiz.swift
//  quiz4kids
//
//  Created by whiteship on 2017. 12. 22..
//  Copyright © 2017년 whiteship. All rights reserved.
//

import Foundation

class Quiz {
    var title = ""
    var question = ""
    var answer = ""
    var input: String?
    var pass = false
    var type = ""
    
    static func plusLevel1(index: Int) -> Quiz {
        let quiz = Quiz()
        let left = Int(arc4random_uniform(11))
        let right = Int(arc4random_uniform(11))
        quiz.answer = String(left + right)
        quiz.question = "\(left) + \(right) = ?"
        quiz.title = "Quiz \(index)"
        return quiz
    }
    
    static func plusLevel2(index: Int) -> Quiz {
        let quiz = Quiz()
        let left = Int(arc4random_uniform(101))
        let right = Int(arc4random_uniform(11))
        quiz.answer = String(left + right)
        quiz.question = "\(left) + \(right) = ?"
        quiz.title = "Quiz \(index)"
        return quiz
    }
    
    static func plusLevel3(index: Int) -> Quiz {
        let quiz = Quiz()
        let first = Int(arc4random_uniform(11))
        let second = Int(arc4random_uniform(11))
        let third = Int(arc4random_uniform(11))
        quiz.answer = String(first + second + third)
        quiz.question = "\(first) + \(second) + \(third) = ?"
        quiz.title = "Quiz \(index)"
        return quiz
    }
    
    static func minusLevel1(index: Int) -> Quiz {
        let quiz = Quiz()
        let left = Int(arc4random_uniform(6) + 5)
        let right = Int(arc4random_uniform(5))
        quiz.answer = String(left - right)
        quiz.question = "\(left) - \(right) = ?"
        quiz.title = "Quiz \(index)"
        return quiz
    }
    
    static func minusLevel2(index: Int) -> Quiz {
        let quiz = Quiz()
        let left = Int(arc4random_uniform(91) + 10)
        let right = Int(arc4random_uniform(10))
        quiz.answer = String(left - right)
        quiz.question = "\(left) - \(right) = ?"
        quiz.title = "Quiz \(index)"
        return quiz
    }
    
    static func multiplication(index: Int) -> Quiz {
        let quiz = Quiz()
        let left = Int(arc4random_uniform(8) + 2)
        let right = Int(arc4random_uniform(9) + 1)
        quiz.answer = String(left * right)
        quiz.question = "\(left) ✕ \(right) = ?"
        quiz.title = "Quiz \(index)"
        
        if right == 1 {
            quiz.question += "\n\(left) ✕ \(right + 1) = \(left * (right + 1))"
            quiz.question += "\n\(left) ✕ \(right + 2) = \(left * (right + 2))"
        } else if right == 9 {
            let q = quiz.question
            quiz.question = "\(left) ✕ \(right - 2) = \(left * (right - 2))"
            quiz.question += "\n\(left) ✕ \(right - 1) = \(left * (right - 1))"
            quiz.question += "\n\(q)"
        } else {
            let q = quiz.question
            quiz.question = "\(left) ✕ \(right - 1) = \(left * (right - 1))"
            quiz.question += "\n\(q)"
            quiz.question += "\n\(left) ✕ \(right + 1) = \(left * (right + 1))"
        }
        return quiz
    }
    
    static func equationLevel1(index: Int) -> Quiz {
        let quiz = Quiz()
        let left = Int(arc4random_uniform(11))
        let right = Int(arc4random_uniform(11))
        quiz.answer = String(right)
        quiz.question = "\(left) + ? = \(left + right)"
        quiz.title = "Quiz \(index)"
        return quiz
    }
    
    static func countingLevel1(index: Int) -> Quiz {
        let quiz = Quiz()
        let appleCount = Int(arc4random_uniform(10) + 1)
        quiz.answer = String(appleCount)
        quiz.question = "apple\(appleCount).png"
        quiz.title = "Quiz \(index)"
        return quiz
    }
    
}
