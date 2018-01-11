//
//  QuizTypeTableViewController.swift
//  quiz4kids
//
//  Created by whiteship on 2017. 12. 22..
//  Copyright © 2017년 whiteship. All rights reserved.
//

import UIKit

class QuizTypeTableViewController: UITableViewController {
    
    var quizTypes: [QuizType] = [QuizType]()
    var quiz: [String:[Quiz]] = [String:[Quiz]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getQuizType()
        getQuiz()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getStatisticsForQuizTypes()
        tableView.reloadData()
    }
    
    func getStatisticsForQuizTypes() {
        for quizType in self.quizTypes {
            quizType.total = 20
            quizType.resolved = 0
            for quiz in quiz[quizType.name]! {
                if quiz.pass {
                    quizType.resolved += 1
                }
            }
        }
    }
    
    func getQuizType() {
        let countLevel1 = QuizType()
        countLevel1.name = QuizTypes.countLevel1
        
        let plusLevel1 = QuizType()
        plusLevel1.name = QuizTypes.plusLevel1
        
        let minusLevel1 = QuizType()
        minusLevel1.name = QuizTypes.minusLevel1
        
        let plusLevel2 = QuizType()
        plusLevel2.name = QuizTypes.plusLevel2
        
        let minusLevel2 = QuizType()
        minusLevel2.name = QuizTypes.minusLevel2
        
        let plusLevel3 = QuizType()
        plusLevel3.name = QuizTypes.plusLevel3
        
        let multiplicationLevel1 = QuizType()
        multiplicationLevel1.name = QuizTypes.multiplicationLevel1
        
        let equationLevel1 = QuizType()
        equationLevel1.name = QuizTypes.equationLevel1
        
        let spellingLevel1 = QuizType()
        spellingLevel1.name = QuizTypes.spellingLevel1
        
        self.quizTypes = [countLevel1, plusLevel1, plusLevel2, plusLevel3, minusLevel1, minusLevel2, multiplicationLevel1, equationLevel1, spellingLevel1]
    }
    
    func getQuiz() {
        createCountLevel1Quiz()
        createPlusLevel1Quiz()
        createPlusLevel2Quiz()
        createMinusLevel1Quiz()
        createMinusLevel2Quiz()
        createPlusLevel3Quiz()
        createMultiplicationLevel1()
        createEquationLevel1()
        createSpellingLevel1()
    }
    
    func resetQuizFor(quizType: String) -> [Quiz] {
        switch quizType {
        case QuizTypes.spellingLevel1:
            createSpellingLevel1()
            return self.quiz[QuizTypes.spellingLevel1]!
        case QuizTypes.countLevel1:
            createCountLevel1Quiz()
            return self.quiz[QuizTypes.countLevel1]!
        case QuizTypes.plusLevel1:
            createPlusLevel1Quiz()
            return self.quiz[QuizTypes.plusLevel1]!
        case QuizTypes.plusLevel2:
            createPlusLevel2Quiz()
            return self.quiz[QuizTypes.plusLevel2]!
        case QuizTypes.minusLevel1:
            createMinusLevel1Quiz()
            return self.quiz[QuizTypes.minusLevel1]!
        case QuizTypes.minusLevel2:
            createMinusLevel1Quiz()
            return self.quiz[QuizTypes.minusLevel2]!
        case QuizTypes.plusLevel3:
            createPlusLevel3Quiz()
            return self.quiz[QuizTypes.plusLevel3]!
        case QuizTypes.multiplicationLevel1:
            createMultiplicationLevel1()
            return self.quiz[QuizTypes.multiplicationLevel1]!
        case QuizTypes.equationLevel1:
            createEquationLevel1()
            return self.quiz[QuizTypes.equationLevel1]!
            
        default:
            print("wrong type")
            return [Quiz]()
        }
    }
    
    func createSpellingLevel1() {
        let wordsString = """
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
        
        var words: [String] = [String]()
        
        for separatedBySpace in wordsString.components(separatedBy: " ") {
            for separatedByLineBreak in separatedBySpace.components(separatedBy: "\n") {
                words.append(separatedByLineBreak)
            }
        }
        
        var quizList = [Quiz]()
        for index in 1...20 {
            let quiz = Quiz()
            let wordIndex = Int(arc4random_uniform(UInt32(words.count)))
            let word = words[wordIndex]
            quiz.answer = word
            quiz.question = word
            quiz.title = "Quiz \(index)"
            quizList.append(quiz)
        }
        self.quiz[QuizTypes.spellingLevel1] = quizList
    }
    
    func createCountLevel1Quiz() {
        var quizList = [Quiz]()
        for index in 1...20 {
            let quiz = Quiz()
            let appleCount = Int(arc4random_uniform(10) + 1)
            quiz.answer = String(appleCount)
            quiz.question = "apple\(appleCount).png"
            quiz.title = "Quiz \(index)"
            quizList.append(quiz)
        }
        self.quiz[QuizTypes.countLevel1] = quizList
    }
    
    func createEquationLevel1() {
        var quizList = [Quiz]()
        for index in 1...20 {
            let quiz = Quiz()
            let left = Int(arc4random_uniform(11))
            let right = Int(arc4random_uniform(11))
            quiz.answer = String(right)
            quiz.question = "\(left) + ? = \(left + right)"
            quiz.title = "Quiz \(index)"
            quizList.append(quiz)
        }
        self.quiz[QuizTypes.equationLevel1] = quizList
    }
    
    func createMultiplicationLevel1() {
        var quizList = [Quiz]()
        for index in 1...20 {
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
            
            quizList.append(quiz)
        }
        self.quiz[QuizTypes.multiplicationLevel1] = quizList
    }
    
    func createPlusLevel1Quiz() {
        var quizList = [Quiz]()
        for index in 1...20 {
            let quiz = Quiz()
            let left = Int(arc4random_uniform(11))
            let right = Int(arc4random_uniform(11))
            quiz.answer = String(left + right)
            quiz.question = "\(left) + \(right) = ?"
            quiz.title = "Quiz \(index)"
            quizList.append(quiz)
        }
        self.quiz[QuizTypes.plusLevel1] = quizList
    }
    
    func createPlusLevel2Quiz() {
        var quizList = [Quiz]()
        for index in 1...20 {
            let quiz = Quiz()
            let left = Int(arc4random_uniform(101))
            let right = Int(arc4random_uniform(11))
            quiz.answer = String(left + right)
            quiz.question = "\(left) + \(right) = ?"
            quiz.title = "Quiz \(index)"
            quizList.append(quiz)
        }
        self.quiz[QuizTypes.plusLevel2] = quizList
    }
    
    func createMinusLevel1Quiz() {
        var quizList = [Quiz]()
        for index in 1...20 {
            let quiz = Quiz()
            let left = Int(arc4random_uniform(6) + 5)
            let right = Int(arc4random_uniform(5))
            quiz.answer = String(left - right)
            quiz.question = "\(left) - \(right) = ?"
            quiz.title = "Quiz \(index)"
            quizList.append(quiz)
        }
        self.quiz[QuizTypes.minusLevel1] = quizList
    }
    
    func createMinusLevel2Quiz() {
        var quizList = [Quiz]()
        for index in 1...20 {
            let quiz = Quiz()
            let left = Int(arc4random_uniform(91) + 10)
            let right = Int(arc4random_uniform(10))
            quiz.answer = String(left - right)
            quiz.question = "\(left) - \(right) = ?"
            quiz.title = "Quiz \(index)"
            quizList.append(quiz)
        }
        self.quiz[QuizTypes.minusLevel2] = quizList
    }
    
    func createPlusLevel3Quiz() {
        var quizList = [Quiz]()
        for index in 1...20 {
            let quiz = Quiz()
            let first = Int(arc4random_uniform(11))
            let second = Int(arc4random_uniform(11))
            let third = Int(arc4random_uniform(11))
            quiz.answer = String(first + second + third)
            quiz.question = "\(first) + \(second) + \(third) = ?"
            quiz.title = "Quiz \(index)"
            quizList.append(quiz)
        }
        self.quiz[QuizTypes.plusLevel3] = quizList
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.quizTypes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "quizTypeCell", for: indexPath) as? QuizTypeTableViewCell else {
            fatalError("The dequeued cell is not an instance of QuizTypeTableViewCell.")
        }
        
        let quizType = self.quizTypes[indexPath.row]
        cell.titleLabel.text = quizType.name
        cell.statisticsLabel.text = "\(quizType.resolved)/\(quizType.total)"
        
        if quizType.resolved == quizType.total {
            cell.backgroundColor = Colors.green
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let quizType = self.quizTypes[indexPath.row]
            quiz[quizType.name] = [Quiz]()
            tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let quizType = quizTypes[indexPath.row]
        performSegue(withIdentifier: "start", sender: quizType)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let quizTableVC = segue.destination as? QuizTableViewController {
            if let quizType = sender as? QuizType {
                quizTableVC.quizType = quizType
                quizTableVC.quizTypeVC = self
            }
        }
    }
    
}
