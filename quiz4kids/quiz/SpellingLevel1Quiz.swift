//
//  SpellingLevel1Quiz.swift
//  quiz4kids
//
//  Created by Keesun Baik on 19/01/2018.
//  Copyright © 2018 whiteship. All rights reserved.
//

import Foundation

class SpellingLevel1Quiz: SpellingQuiz {
    
    override func create(index: Int) -> Quiz {
        let quiz = super.create(index: index)
        quiz.type = QuizTypes.spellingLevel1
        return quiz
    }
    
    override func wordsString() -> String {
        return """
        a all am an and
        are as at away back
        ball bell big bird blue
        book boot box boy brown
        but by can car cat
        come cow day do dog
        down end fall fan fish
        fly food for from fun
        get go good gray green
        ground hog hat he here hill
        I in into is it
        inside kitten little look mad
        me mud my name no
        not of on orange out
        paint pet pin play put
        rain red run sad say
        see she sing sit so
        stay stop story sun take
        that the them then there
        they this to too up
        we wet what where who
        will with work yellow yes
        you zoo orange white black
        """
    }
}
