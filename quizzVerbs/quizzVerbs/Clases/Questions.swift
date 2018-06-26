//
//  Questions.swift
//  quizzVerbs
//
//  Created by misael rivera on 22/05/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import Foundation
struct Questions {
    let questionText:String
    let posibbleAnswer:String
    let answer:Bool
    
    init(questionText:String,posibbleAnswer:String,answer:Bool) {
        self.questionText = questionText
        self.posibbleAnswer = posibbleAnswer
        self.answer = answer
    }
}
