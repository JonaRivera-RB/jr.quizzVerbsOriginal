//
//  gamerVC.swift
//  quizzVerbs
//
//  Created by misael rivera on 22/05/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit

class gamerVC: UIViewController {
    //labels,buttons
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var possibleAnswerLbl: UILabel!
    
    let allQuestions = QuestionBank()
    var pickedAnswer:Bool = false
    var numberQuestion:Int = 0
    var score:Int  = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }
    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else if sender.tag == 2 {
            pickedAnswer = false
        }
        let respuesta = checkAnswer()
        print(respuesta)
        if respuesta == true {
        numberQuestion += 1
        nextQuestion()
        }
        else {
            numberQuestion = 0
            score = 0
        }
    }
    func checkAnswer() -> Bool
    {
        let correcAnswer = allQuestions.questionList[numberQuestion].answer
        if pickedAnswer == correcAnswer {
          score += 1
            return true
        }else{
            performSegue(withIdentifier: "yourScoreAway", sender: self)
            startOver()
            return false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sendScore = segue.destination as? yourScoreVC {
            sendScore.getScore(score: score)
        }
    }
    func nextQuestion() {
        if numberQuestion < allQuestions.questionList.count {
            print("nuemro pregunta",numberQuestion)
            questionLbl.text = allQuestions.questionList[numberQuestion].questionText
            possibleAnswerLbl.text = allQuestions.questionList[numberQuestion].posibbleAnswer
            updateUI()
        } else {
            let alert = UIAlertController(title: "Awesome", message: "You have finished all the questions, Do you want to star over?", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(alertAction)
            present(alert,animated: true,completion: nil)
        }
    }
    func startOver()
    {
        numberQuestion = 0
        score = 0
        nextQuestion()
        //time = 60
    }
    func updateUI()
    {
        
    }
}

