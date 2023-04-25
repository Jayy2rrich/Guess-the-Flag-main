//
//  ViewController.swift
//  Guess the Flag
//
//  Created by Lisette Antigua on 4/22/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
    var questionsAsked = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
                
                button1.layer.borderWidth = 1
                button2.layer.borderWidth = 1
                button3.layer.borderWidth = 1
                
                button1.layer.borderColor = UIColor.lightGray.cgColor
                button2.layer.borderColor = UIColor.lightGray.cgColor
                button3.layer.borderColor = UIColor.lightGray.cgColor

                askQuestion(action: nil)
    }
    func askQuestion(action: UIAlertAction!) {
        countries.shuffle()
                correctAnswer = Int.random(in: 0...2)
                
                button1.setImage(UIImage(named: countries[0]), for: .normal)
                button2.setImage(UIImage(named: countries[1]), for: .normal)
                button3.setImage(UIImage(named: countries[2]), for: .normal)
                
                title = "SCORE: \(score) | GUESS: \(countries[correctAnswer].uppercased())"
            }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        questionsAsked += 1
                
                if sender.tag == correctAnswer {
                    score += 1
                } else {
                    let alert = UIAlertController(title: "Wrong!", message: "That's the flag of \(countries[sender.tag].capitalized).", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: nil))
                    present(alert, animated: true)
                }
                
                if questionsAsked < 10 {
                    askQuestion(action: nil)
                } else {
                    let ac = UIAlertController(title: "Game Over", message: "Your final score is \(score).", preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
                        self.score = 0
                        self.questionsAsked = 0
                        self.askQuestion(action: nil)
                    }))
                    present(ac, animated: true)
                }
    }
}

