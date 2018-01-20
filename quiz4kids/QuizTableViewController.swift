//
//  QuizTableViewController.swift
//  quiz4kids
//
//  Created by whiteship on 2017. 12. 22..
//  Copyright © 2017년 whiteship. All rights reserved.
//

import UIKit

class QuizTableViewController: UITableViewController {
    
    var quizTypeVC = QuizTypeTableViewController()
    var quizType = QuizType()
    var quizList = [Quiz]()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let quizList = quizTypeVC.quiz[quizType.name] {
            self.quizList = quizList
        }
        
        self.navigationController?.title = quizType.name
        self.navigationItem.title = quizType.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quizCell", for: indexPath)
        let quiz = quizList[indexPath.row]
        cell.textLabel?.text = quiz.title
        if (quiz.input != nil) {
            if (quiz.pass) {
                cell.backgroundColor = Colors.green
            } else {
                cell.backgroundColor = Colors.red
            }
        } else {
            cell.backgroundColor = UIColor.white
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if quizType.name == QuizTypes.countLevel1 {
            performSegue(withIdentifier: "appleQuiz", sender: indexPath.row)
        } else if (quizType.name == QuizTypes.spellingLevel1
            || quizType.name == QuizTypes.spellingLevel2
            || quizType.name == QuizTypes.numberLevel1) {
            performSegue(withIdentifier: "audioQuiz", sender: indexPath.row)
        } else if quizType.name == QuizTypes.multiplicationLevel1 {
            performSegue(withIdentifier: "multiLineQuiz", sender: indexPath.row)
        } else {
            performSegue(withIdentifier: "quiz", sender: indexPath.row)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let quizVC = segue.destination as? QuizViewController {
            if let indexPathRow = sender as? Int {
                let quiz = quizList[indexPathRow]
                quizVC.quiz = quiz
                quizVC.index = indexPathRow
                quizVC.quizList = quizList
            }
        }
        
        if let quizVC = segue.destination as? AppleCountViewController {
            if let indexPathRow = sender as? Int {
                let quiz = quizList[indexPathRow]
                quizVC.quiz = quiz
                quizVC.index = indexPathRow
                quizVC.quizList = quizList
            }
        }
        
        if let quizVC = segue.destination as? AudioQuizViewController {
            if let indexPathRow = sender as? Int {
                let quiz = quizList[indexPathRow]
                quizVC.quiz = quiz
                quizVC.index = indexPathRow
                quizVC.quizList = quizList
            }
        }
        
        if let quizVC = segue.destination as? MultiLineViewController {
            if let indexPathRow = sender as? Int {
                let quiz = quizList[indexPathRow]
                quizVC.quizList = quizList
                quizVC.index = indexPathRow
                quizVC.quiz = quiz
            }
        }
    }

    @IBAction func resetTapped(_ sender: Any) {
        self.quizList = quizTypeVC.resetQuizFor(quizType: quizType)
        tableView.reloadData()
    }

}
