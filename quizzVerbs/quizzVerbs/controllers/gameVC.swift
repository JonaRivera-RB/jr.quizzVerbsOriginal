//
//  gameVC.swift
//  quizzVerbs
//
//  Created by misael rivera on 27/05/18.
//  Copyright © 2018 misael rivera. All rights reserved.
//

import UIKit
import Foundation

class gameVC: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
    //agregamos el collection view de las letras
    @IBOutlet weak var answersCV:UICollectionView!
    @IBOutlet weak var correctAnswerLbl: UILabel!
    @IBOutlet weak var verbsLbl: UILabel!
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    
    
    let allVerbs = VerbsBank()
    var arrayPalabrs = [String]()
    var arrayCells = [IndexPath]()
    var number = 0
    var score = 0
    var record = 0
    var answerReady:Bool = false
    var meter:Int = 0
    var timer:Timer?
    var time:Int = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        record = 0
        
    }
    override func viewWillAppear(_ animated: Bool) {
        resetViews()
        starover()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        timerLbl.text = "30"
    }
    
    //nuego juego preguntamos si el numero es menor que el el numero de verbos en la lista
    func newGame() {
        if number < allVerbs.verbsList.count {
            //el array que tiene la palabra le eliminamos todo
            arrayPalabrs.removeAll()
            //mandar a llamar funcion para desacomodar letras
            splitWord()
            //vaciamos arrayCell
            arrayCells.removeAll()
            //agregamos un verbo al label para mostrarlo en pantalla
            verbsLbl.text = allVerbs.verbsList[number].verb
            record = UserDefaults.standard.integer(forKey: "scoredGot")
            print("record->\(record)")
            timerStart()
        } else {
            //creamos una alerta de que ya has finalizado el juego
            let alert = UIAlertController(title: "Awesome", message: "You have finished all the questions, Do you want to star over?", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) { (UIAlertAction) in
                //una vez acepten la alerta nos manda a lafuncion startover
                self.starover()
            }
            alert.addAction(alertAction)
            present(alert,animated: true,completion: nil)
        }
    }
    //esta funcion comienza todos los contadores desde el inico es decir en 0
    //y comienza un nuevo juego
    func starover()
    {
        number = 0
        meter = 0
        score = 0
        time = 30
        correctAnswerLbl.text = ""
        newGame()
    }
    //funcion de respuesta lista que regresa un boleano
    func answerAlready() -> Bool {
        //creamos una constante de nombre respuesta correcta para agregarle la respuesta correcta del arreglo
        let correctAnswer = allVerbs.verbsList[number].answer
        print("lbl\(String(describing: correctAnswerLbl.text))")
        print("verblist \(correctAnswer)")
        //validamos que la respuesta obtenida en el label sea igual a la respuesta correcta
        if correctAnswerLbl.text == correctAnswer {
            //si la respuesta es correcta
            //vaciamos la respuesta correcta
            //ponemos el contador en cero
            //y resetamos vistas
            correctAnswerLbl.text = ""
            meter = 0
            resetViews()
            return true
        } else {
            timerStop()
            let scoredGot = UserDefaults.standard.integer(forKey: "scoredGot")
            if score > scoredGot {
                UserDefaults.standard.set(score, forKey: "scoredGot")
            }
            record = UserDefaults.standard.integer(forKey: "scoredGot")
            performSegue(withIdentifier: "yourScoreGuess", sender: self)
            resetViews()
           // self.starover()
            return false
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let sendScore = segue.destination as? yourScoreGuessVC {
                sendScore.getScoreGuess(scoreGuess: score, recordGuess: record)
            }
    }
    //funcion para desordenar un array
    func splitWord(){
        //palabra va ser igual al verbo que tenga la lista en el numero [number]
        let palabra:String = allVerbs.verbsList[number].answer
        //creamos un arrayVacio
        var array2 = [String]()
        //creamos un ciclo for donde vamos agregar al array dos la palabra separandola de una por una
        for word in palabra {
            array2.append(String(word))
        }
        print(array2)
        //creamos otro ciclo para que al array2 lo desordenemos
        //obtenemos una letra aleatoria del arreglo y la pasamos al arreglo palabra
        //y eliminamos esa misma letra que nos salio para ya no repetirla
        for _ in 0..<array2.count {
            let rand = Int(arc4random_uniform(UInt32(array2.count)))
            arrayPalabrs.append(array2[rand])
            array2.remove(at: rand)
        }
        print(arrayPalabrs)
        //hacemos un reload de los datos
        answersCV.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayPalabrs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "letter"
        let cell = answersCV.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! cellAnswersCVC
        cell.letters.text = arrayPalabrs[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //al label correctAnswer le agregamos la letra que fue precionada
        correctAnswerLbl.text! += arrayPalabrs[indexPath.row]
        print("You selected cell #\(indexPath.item)!")
        //le sumamos una letra al contador
        meter += 1
        print("meter->\(meter)")
        print("array counts->\(arrayPalabrs.count)")
        //si el contador es igual al numero de letras que tiene la palabra
        if meter == arrayPalabrs.count {
            //creamos una constante que recibe la respuesta de la funcion answerAlready
            let answer = answerAlready()
            if answer == true {
                number += 1
                score += 1
                time += 5
                newGame()
            } else {
                number = 0
                score = 0
            }
        }
    }
    func resetViews()
    {
        //reseteamos vistas
        //creamos un ciclo donde vamos a decir cuantas celdas estan disponibles
        for number in arrayCells {
        let cell = answersCV.cellForItem(at: number)
            cell?.isHidden = false
        }
        answersCV.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        arrayCells.append(indexPath)
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.isHidden = true
    }
    
    //regresa una letra a su caja
    @IBAction func backTheLetterBtn(_ sender: Any) {
        //si contador es mayor de cero
        //le quitamos una
        if meter > 0 {
        meter -= 1
        }
        //creamos un variable de nombre palabra donde le pasamos lo que tenga el lbl correctAnswer
        //le eliminamos la ultima letra a la palabra
        //y volvemos a poner la plaabra en el lbl
        var palabra = correctAnswerLbl.text!
         print("palabra inicial->\(palabra)")
        palabra = String(palabra.dropLast(1))
        correctAnswerLbl.text = String(palabra)
        print("palabra final->\(palabra)")
        //si arraycell su contenido es mayor a cero
        if arrayCells.count > 0 {
            //creamos una constante de nombre cell DE TIPO answerCV donde le agregamos la ultima
            //posicion del arrayCells
            //y decimos que esa posicion esta disponible
            let cell = answersCV.cellForItem(at: arrayCells.last!)
            cell?.isHidden = false
            //y eliminamos la ultima posicion del array
            arrayCells.removeLast()
        }
    }
    func timerStart()
    {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCont), userInfo: nil, repeats: true)
        }
    }
    func timerStop() {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }
    @objc func timerCont()
    {
        if time > 0 {
            self.time -= 1
        }
        timerLbl.text = String(time)
        if self.time < 1 {
            let scoredGot = UserDefaults.standard.integer(forKey: "scoredGot")
            if score > scoredGot {
                UserDefaults.standard.set(score, forKey: "scoredGot")
            }
            timerStop()
            performSegue(withIdentifier: "yourScoreGuess", sender: self)
        }
    }
    @IBAction func backViewBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
