//
//  SpellingLevel1Quiz.swift
//  quiz4kids
//
//  Created by Keesun Baik on 19/01/2018.
//  Copyright © 2018 whiteship. All rights reserved.
//

import Foundation

class SpellingQuiz : Quiz {
    
    override func create(index: Int) -> Quiz {
        let quiz = SpellingQuiz()
        let words = self.extractWords(self.wordsString())
        let wordIndex = Int(arc4random_uniform(UInt32(words.count)))
        let word = words[wordIndex]
        quiz.answer = word
        quiz.question = word
        quiz.title = "Quiz \(index)"
        return quiz
    }

    func extractWords(_ wordsString: String) -> [String] {
        var words: [String] = [String]()
        
        for separatedBySpace in wordsString.components(separatedBy: " ") {
            for separatedByLineBreak in separatedBySpace.components(separatedBy: "\n") {
                let trimmed = separatedByLineBreak.trimmingCharacters(in: .whitespacesAndNewlines)
                if !trimmed.isEmpty {
                    words.append(separatedByLineBreak)
                }
            }
        }
        
        return words
    }
    
    func wordsString() -> String {
        return ""
    }
    
}
