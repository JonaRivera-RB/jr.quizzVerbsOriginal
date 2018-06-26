//
//  QuestionBank.swift
//  quizzVerbs
//
//  Created by misael rivera on 22/05/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import Foundation
struct QuestionBank {
    var questionList = [Questions]()
    init() {
        questionList.append(Questions(questionText: "Have you --- for your uncle?", posibbleAnswer: "worked", answer: true))
        questionList.append(Questions(questionText: "Has he --- the book that you gave me yesterday?", posibbleAnswer: "readed", answer: false))
        questionList.append(Questions(questionText: "Has she --- with him several times?", posibbleAnswer: "spoken", answer: true))
        questionList.append(Questions(questionText: "Have they --- money to you many times?", posibbleAnswer: "lent", answer: true))
        questionList.append(Questions(questionText: "Have they --- my book?", posibbleAnswer: "losed", answer: false))
        questionList.append(Questions(questionText: "Has he --- what I said?", posibbleAnswer: "forgotten", answer: true))
        questionList.append(Questions(questionText: "Have you --- here before?", posibbleAnswer: "was", answer: false))
        questionList.append(Questions(questionText: "Have you --- for more than fourteen hours?", posibbleAnswer: "slept", answer: true))
        questionList.append(Questions(questionText: "Has my cousin --- to Europe to study?", posibbleAnswer: "goned", answer: false))
        questionList.append(Questions(questionText: "Has she --- every show in the city?", posibbleAnswer: "seen", answer: true))
        questionList.append(Questions(questionText: "Have you --- that movie several times?", posibbleAnswer: "seed", answer: false))
        questionList.append(Questions(questionText: "Has he --- up the tournament?", posibbleAnswer: "gived", answer: false))
        questionList.append(Questions(questionText: "Have you --- all your problems?", posibbleAnswer: "forgeted", answer: false))
        /*
         Has he read the book that you gave me yesterday? (¿El ha leído el libro que me diste ayer?)
         Has she spoken with him several times? (¿Ella ha hablado con él varias veces?)
         Have they lent money to you many times? (¿Ellos te han prestado dinero muchas veces?)
         Have they lost my book? (¿Ellos han perdido mi libro?)
         Has he forgotten what I said? (¿Él ha olvidado lo que dije?)
         Have you been here before? (¿Has estado aquí antes?)
         Have you slept for more than fourteen hours? (¿Tú has dormido por más de catorce horas?)
         Has my cousin gone to Europe to study? (¿Mi primo se ha ido a Europa a estudiar?)
         Has she seen every show in the city? (¿Ella ha visto cada espectáculo en la ciudad?)
         Have you seen that movie several times? (¿Has visto esa película varias veces?)
         Has he given up the tournament? (¿Él ha abandonado el torneo?)
         Have you forgotten all your problems? (¿Has olvidado todos tus problemas?)
 */
        
    }
}
