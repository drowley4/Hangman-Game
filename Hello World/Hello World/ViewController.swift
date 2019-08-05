//
//  ViewController.swift
//  Hello World
//
//  Created by Doug Rowley on 6/24/19.
//  Copyright © 2019 Doug Rowley. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    var hangWord = ""
    var numGuesses = 9
    let wordBank = WordBank()
    var timer:Timer?
    var timeLeft = 30
    var listLettersGuessed: [Character] = []
    @IBOutlet weak var againButton: UIButton!
    @IBOutlet weak var viewButtons: UIView!
    @IBOutlet weak var partialWord: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var hangmanDrawing: HangmanDrawing!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.againButton.layer.cornerRadius = 8
        
        var xPoint = 0
        var yPoint = 0
        var count = 0
        for char in "abcdefghijklmnopqrstuvwxyz" {
            switch count {
            case 7:
                yPoint += 50
                xPoint = 0
            case 14:
                yPoint += 50
                xPoint = 0
            case 21:
                yPoint += 50
                xPoint = 50
            default:
                count += 0
            }
            let buttonX = xPoint
            let buttonY = yPoint
            let buttonWidth = 50
            let buttonHeight = 50
            xPoint += 50
            
            let button = UIButton(type: .system)
            button.layer.cornerRadius = 4
            button.titleLabel?.adjustsFontSizeToFitWidth = true
            button.addTarget(self, action: #selector(checkLetterButton), for: .touchUpInside)
            button.frame = CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight)
            button.setTitle(String(char), for: .normal)
            button.layer.borderWidth = 1.5
            button.layer.borderColor = UIColor.white.cgColor
            button.layer.backgroundColor = UIColor.blue.cgColor
            button.setTitleColor(UIColor.white, for: .normal)
            
            self.viewButtons.addSubview(button)
            count += 1
        }
        
        self.selectWord()
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    
  /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let identifier = segue.identifier ?? "no segue"
        switch identifier {
        case "toHintController":
            let hintController = segue.destination as! HintController
            hintController.setPartialWord(self.partialWord.text ?? "")
        default:
            print("UNEXPECTED SEGUE IDENTIFER \(identifier)")
        }
    }*/
    
    @IBAction func checkLetterButton(_ sender: UIButton) {
        let letterGuessed = sender.currentTitle
        sender.isEnabled = false
        sender.flyAway()
        sender.layer.backgroundColor = UIColor.black.cgColor
        self.listLettersGuessed.append(letterGuessed![letterGuessed!.startIndex])
        var win = true
        var hit = true
        self.timeLeft = 30
        hit = self.checkLetter(letterGuessed!)
        let tmpStr = self.partialWord.text!
        for letter in tmpStr {
            if letter == "-" {
                win = false
            }
        }
        if !hit {
            self.checkNumGuesses()
        }
        if win && numGuesses > 0  {
            self.timer?.invalidate()
            self.timeLabel.text = "YOU WIN!!!!!!"
            self.viewButtons.subviews.map{view in view as! UIButton}.forEach{button in button.isEnabled = false}
        }
    }
    
    private func showToast(controller: UIViewController, message: String, seconds: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.white
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        
        controller.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
    
    @IBAction func playAgainButton() {
        self.viewButtons.subviews.map{view in view as! UIButton}.forEach{button in button.isEnabled = true}
        self.viewButtons.subviews.map{view in view as! UIButton}.forEach{button in button.layer.backgroundColor = UIColor.blue.cgColor}
        self.selectWord()
        self.numGuesses = 10
        self.checkNumGuesses()
        self.timeLeft = 30
        self.listLettersGuessed.removeAll()
        self.timer?.invalidate()
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
    }
    
    private func checkLetter(_ guessedLetter: String) -> Bool {
        var num = 0
        var hit = false
        var tmpStr = ""
        for letter in self.hangWord {
            if letter == guessedLetter[guessedLetter.startIndex] {
                hit = true
                tmpStr = self.partialWord.text!
                tmpStr.remove(at: tmpStr.index(tmpStr.startIndex, offsetBy: num))
                tmpStr.insert(letter, at: tmpStr.index(tmpStr.startIndex, offsetBy: num))
                self.partialWord.text = tmpStr
            }
            num += 1
        }
        return hit
    }
    
    private func checkNumGuesses() {
        self.numGuesses -= 1
        switch self.numGuesses {
        case 9:
            self.hangmanDrawing.drawShape(selectedShape: .noose)
        case 8:
            self.hangmanDrawing.drawShape(selectedShape: .head)
        case 7:
            self.hangmanDrawing.drawShape(selectedShape: .body)
        case 6:
            self.hangmanDrawing.drawShape(selectedShape: .oneLeg)
        case 5:
            self.hangmanDrawing.drawShape(selectedShape: .twoLegs)
        case 4:
            self.hangmanDrawing.drawShape(selectedShape: .oneArm)
        case 3:
            self.hangmanDrawing.drawShape(selectedShape: .twoArms)
        case 2:
            self.hangmanDrawing.drawShape(selectedShape: .oneEye)
        case 1:
            self.hangmanDrawing.drawShape(selectedShape: .twoEyes)
        default:
            self.timeLabel.text = "YOU LOST!!!!!"
            self.partialWord.text = self.hangWord
            self.timer?.invalidate()
            self.hangmanDrawing.drawShape(selectedShape: .frown)
            self.viewButtons.subviews.map{view in view as! UIButton}.forEach{button in button.isEnabled = false}
        }
    }
    
    private func selectWord() {
        self.numGuesses = 9
        let randomNum = Int.random(in: 0..<180)
        self.hangWord = self.wordBank.words[randomNum]
        var partWord = ""
        for _ in self.hangWord {
            partWord += "-"
        }
        self.partialWord.text = partWord
    }
    
    @objc func onTimerFires() {
        self.timeLeft -= 1
        self.timeLabel.text = "\(timeLeft) seconds left"
        
        if self.timeLeft <= 0 {
            self.checkNumGuesses()
            self.timeLeft = 30
        }
    }
}


