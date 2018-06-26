//
//  verbs.swift
//  quizzVerbs
//
//  Created by misael rivera on 27/05/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import Foundation
struct Verbs {
    let verb:String
    let answer:String
    let translation:String
    
    init(verb:String,answer:String,translation:String) {
        self.verb = verb
        self.answer = answer
        self.translation = translation
    }
}
