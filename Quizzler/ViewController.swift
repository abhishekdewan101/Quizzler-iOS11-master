//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let questionBank = QuestionBank()
    var pickedAnswer : Bool = false
    var queustionNumber : Int = 0
    var currentScore = 0;
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstQuestion = questionBank.list[queustionNumber]
        questionLabel.text = firstQuestion.questionText
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if (sender.tag == 1) {
            pickedAnswer = true
        } else {
            pickedAnswer = false;
        }
        checkAnswer()
    }
    
    
    func updateUI() {
      questionLabel.text = questionBank.list[queustionNumber].questionText
    }
    

    func nextQuestion() {
        queustionNumber += 1
        if (queustionNumber < questionBank.list.count) {
            updateUI()
        } else {
         startOver()
        }
        scoreLabel.text = String(currentScore)
        progressLabel.text = "\(queustionNumber + 1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(queustionNumber + 1)
    }
    
    
    func checkAnswer() {
        if (questionBank.list[queustionNumber].answer == pickedAnswer) {
            currentScore += 1
        } else {
            print("wrong answer")
        }
        nextQuestion()
    }
    
    
    func startOver() {
       queustionNumber = 0
        let alert = UIAlertController(title: "End of Quiz", message: "You have reached the end of the quiz. Would you like to try again?", preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "Restart", style: .default, handler: {(UIAlertAction) in
                self.updateUI()
            })
        alert.addAction(restartAction)
        present(alert,animated: true,completion: nil)
    }
    

    
}
