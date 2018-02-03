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
        countLevel1.quiz = CountingLevel1Quiz()
        
        let numberLeve1 = QuizType()
        numberLeve1.name = QuizTypes.numberLevel1
        numberLeve1.quiz = NumberLevel1Quiz()
        
        let plusLevel1 = QuizType()
        plusLevel1.name = QuizTypes.plusLevel1
        plusLevel1.quiz = PlusLevel1Quiz()
        
        let minusLevel1 = QuizType()
        minusLevel1.name = QuizTypes.minusLevel1
        minusLevel1.quiz = MinusLevel1Quiz()
        
        let plusLevel2 = QuizType()
        plusLevel2.name = QuizTypes.plusLevel2
        plusLevel2.quiz = PlusLevel2Quiz()
        
        let minusLevel2 = QuizType()
        minusLevel2.name = QuizTypes.minusLevel2
        minusLevel2.quiz = MinusLevel2Quiz()
        
        let plusLevel3 = QuizType()
        plusLevel3.name = QuizTypes.plusLevel3
        plusLevel3.quiz = PlusLevel3Quiz()
        
        let multiplicationLevel1 = QuizType()
        multiplicationLevel1.name = QuizTypes.multiplicationLevel1
        multiplicationLevel1.quiz = MultiplicationLevel1Quiz()
        
        let equationLevel1 = QuizType()
        equationLevel1.name = QuizTypes.equationLevel1
        equationLevel1.quiz = EquationLevel1Quiz()
        
        let spellingLevel1 = QuizType()
        spellingLevel1.name = QuizTypes.spellingLevel1
        spellingLevel1.quiz = SpellingLevel1Quiz()
        
        let spellingLevel2 = QuizType()
        spellingLevel2.name = QuizTypes.spellingLevel2
        spellingLevel2.quiz = SpellingLevel2Quiz()
        
        self.quizTypes = [
            countLevel1,
            numberLeve1,
            plusLevel1,
            plusLevel2,
            plusLevel3,
            minusLevel1,
            minusLevel2,
            multiplicationLevel1,
            equationLevel1,
            spellingLevel1,
            spellingLevel2
        ]
    }
    
    func getQuiz() {
        for quizType in self.quizTypes {
            let quizList = self.createQuizList(quizType: quizType)
            self.quiz[quizType.name] = quizList
        }
    }
    
    func createQuizList(quizType:QuizType) -> [Quiz] {
        var quizList = [Quiz]()
        for index in 1...20 {
            if quizList.count > 1 {
                let previousQuiz = quizList[index - 2]
                let newQuiz = self.createAQuiz(quizType: quizType, index: index, previousQuiz: previousQuiz)
                quizList.append(newQuiz)
            } else {
                quizList.append(quizType.quiz.create(index: index))
            }
        }
        return quizList
    }
    
    func createAQuiz(quizType:QuizType, index: Int, previousQuiz: Quiz) -> Quiz {
        let newQuiz = quizType.quiz.create(index: index)
        if previousQuiz.answer != newQuiz.answer {
            return newQuiz
        } else {
            return createAQuiz(quizType: quizType, index: index, previousQuiz: previousQuiz)
        }
    }
    
    func resetQuizFor(quizType: QuizType) -> [Quiz] {
        // re-create quiz for the quiz type
        var quizList = [Quiz]()
        for index in 1...20 {
            quizList.append(quizType.quiz.create(index: index))
        }
        self.quiz[quizType.name] = quizList
        
        // reset resolved count for the quiz type
        for qt in self.quizTypes {
            if qt.quiz === quizType.quiz {
                qt.resolved = 0
            }
        }
        
        return self.quiz[quizType.name]!
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
        } else {
            cell.backgroundColor = UIColor.white
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
