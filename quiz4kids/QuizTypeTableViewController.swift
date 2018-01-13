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
        
        let spellingLevel2 = QuizType()
        spellingLevel2.name = QuizTypes.spellingLevel2
        
        self.quizTypes = [countLevel1, plusLevel1, plusLevel2, plusLevel3, minusLevel1, minusLevel2, multiplicationLevel1, equationLevel1, spellingLevel1, spellingLevel2]
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
        createSpellingLevel2()
    }
    
    func resetQuizFor(quizType: String) -> [Quiz] {
        switch quizType {
        case QuizTypes.spellingLevel1:
            createSpellingLevel1()
            return self.quiz[QuizTypes.spellingLevel1]!
        case QuizTypes.spellingLevel2:
            createSpellingLevel2()
            return self.quiz[QuizTypes.spellingLevel2]!
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
    
    func createSpellingQuiz(wordsString: String, type: String) {
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
        self.quiz[type] = quizList
    }
    
    func createSpellingLevel1() {
        self.createSpellingQuiz(wordsString: SpellingBee.level1Words, type: QuizTypes.spellingLevel1)
    }
    
    func createSpellingLevel2() {
        self.createSpellingQuiz(wordsString: SpellingBee.level2Words, type: QuizTypes.spellingLevel2)
    }
    
    func createCountLevel1Quiz() {
        self.createQuiz(Quiz.countingLevel1, quizType: QuizTypes.countLevel1)
    }
    
    func createQuiz(_ createQuiz: (Int) -> Quiz, quizType: String) {
        var quizList = [Quiz]()
        for index in 1...20 {
            quizList.append(createQuiz(index))
        }
        self.quiz[quizType] = quizList
    }
    
    func createEquationLevel1() {
        self.createQuiz(Quiz.equationLevel1, quizType: QuizTypes.equationLevel1)
    }
    
    func createMultiplicationLevel1() {
        self.createQuiz(Quiz.multiplication, quizType: QuizTypes.multiplicationLevel1)
    }
    
    func createPlusLevel1Quiz() {
        self.createQuiz(Quiz.plusLevel1, quizType: QuizTypes.plusLevel1)
    }
    
    func createPlusLevel2Quiz() {
        self.createQuiz(Quiz.plusLevel2, quizType: QuizTypes.plusLevel2)
    }
    
    func createPlusLevel3Quiz() {
        self.createQuiz(Quiz.plusLevel3, quizType: QuizTypes.plusLevel3)
    }
    
    func createMinusLevel1Quiz() {
        self.createQuiz(Quiz.minusLevel1, quizType: QuizTypes.minusLevel1)
    }
    
    func createMinusLevel2Quiz() {
        self.createQuiz(Quiz.minusLevel2, quizType: QuizTypes.minusLevel2)
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
