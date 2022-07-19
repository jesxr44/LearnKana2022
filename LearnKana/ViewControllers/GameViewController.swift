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
    @IBOutlet weak var errorIndicator: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var errorCountLabel: UILabel!
    
    var kanaViewModel : KanaViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerTextField.delegate = self
        answerTextField.autocorrectionType = .no
        scoreLabel.textColor = UIColor.green
        errorIndicator.textColor = UIColor.red
        errorCountLabel.textColor = UIColor.red
        nextRound()
    }
    
    // MARK: - Buttons actions
    @IBAction func checkAnwser(_ sender: UIButton) {
        checkAnswer()
    }
    @IBAction func finishGame(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Game methods
    
    func checkAnswer() {
        guard let answer = answerTextField.text, !answer.isEmpty, let kanaViewModel = kanaViewModel else {
            return
        }
        if (answer == kanaViewModel.answer) {
            kanaViewModel.updateScore(with: .correct)
            scoreLabel.text = String(kanaViewModel.score)
            answerTextField.text = ""
            errorIndicator.text = ""
            nextRound()
        } else {
            kanaViewModel.updateScore(with: .wrong)
            errorCountLabel.text = String(kanaViewModel.errors)
            errorIndicator.text = "X"
        }
    }
    
    func nextRound() {
        if let kanaViewModel = kanaViewModel {
            kanaViewModel.selectHideogram(random: true)
            hideogramLabel.text = kanaViewModel.hideogram
            
            if kanaViewModel.hideogram == "" {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - UITextFieldDelegate methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        checkAnswer()
        return true
    }
}

