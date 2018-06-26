//
//  yourScoreGuessVC.swift
//  quizzVerbs
//
//  Created by misael rivera on 08/06/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit

class yourScoreGuessVC: UIViewController {
    
    var scoreGuess:Int = 0
    var recordGuess:Int = 0
    
    @IBOutlet weak var scoreGuessLbl: UILabel!
    @IBOutlet weak var recordGuessLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreGuessLbl.text = String(scoreGuess)
        recordGuessLbl.text = String(recordGuess)
    }
    @IBAction func playAgainBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func exitBtn(_ sender: Any) {
    }
    
    func getScoreGuess(scoreGuess:Int,recordGuess:Int)
    {
        self.scoreGuess = scoreGuess
        self.recordGuess = recordGuess
    }
}
