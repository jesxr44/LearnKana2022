//
//  ViewController.swift
//  LearnKana
//
//  Created by Jesus Escribano on 16/3/22.
//

import UIKit

class GameViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var hideogramLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    
    let kanaViewModel = KanaViewModel(with: Hiragana())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerTextField.delegate = self
        answerTextField.autocorrectionType = .no
        nextRound()
    }
    
    
    @IBAction func checkAnwser(_ sender: UIButton) {
        checkAnswer()
    }
    
    func checkAnswer() {
        guard let answer = answerTextField.text, !answer.isEmpty else {
            return
        }
        if (answer == kanaViewModel.answer) {
            kanaViewModel.updateScore()
            answerTextField.text = ""
            nextRound()
        }
    }
    
    func nextRound() {
        kanaViewModel.selectHideogram()
        hideogramLabel.text = kanaViewModel.hideogram
    }
    
    // MARK: - UITextFieldDelegate methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        checkAnswer()
        return true
    }
}

