//
//  ViewController.swift
//  quizzVerbs
//
//  Created by misael rivera on 20/05/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var score:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func playBtn(_ sender: Any) {
        performSegue(withIdentifier: "playAway", sender: self)
    }
    func getScore(score:Int)
    {
        self.score = score
    }
    @IBAction func playGuessVerbBtn(_ sender: Any) {
        performSegue(withIdentifier: "guessverb", sender: self)
    }
}

