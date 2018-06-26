//
//  yourScoreVC.swift
//  quizzVerbs
//
//  Created by misael rivera on 23/05/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit

class yourScoreVC: UIViewController {

    var score:Int = 0
    @IBOutlet weak var scoreLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLbl.text = String(score)
    }
    @IBAction func playAgainBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func exitBtn(_ sender: Any) {
        
    }
    
    func getScore(score:Int)
    {
        self.score = score
    }
}
