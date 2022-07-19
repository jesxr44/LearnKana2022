//
//  KanaViewModel.swift
//  LearnKana
//
//  Created by Jesus Escribano on 16/3/22.
//

import Foundation

class KanaViewModel {
    
    enum TypeOfScore {
        case correct
        case wrong
    }
    
    enum TypeOfGame {
        case normal
        case timeAttack
        case kami
    }
    
    private var alphabet : Alphabet
    private var latin = Latin()
    private var hideogramRows : Array<Array<String>> = []
    private var answersRows : Array<Array<String>> = []
    
    var hideogram : String
    var answer : String
    var score : Int
    var errors: Int
    var gameMode : TypeOfGame
    
    
    init(with alphabet: Alphabet, rows:Array<Int>, mode: TypeOfGame) {
        self.alphabet = alphabet
        for row in rows {
            self.hideogramRows.append(alphabet.alphabet[row])
            self.answersRows.append(latin.alphabet[row])
        }
        self.hideogram = (self.hideogramRows[0])[0]
        self.answer = (latin.alphabet[0])[0]
        self.score = 0
        self.errors = 0
        self.gameMode = mode
    }
    
    func selectHideogram(random: Bool) {
        
        let randomHideogram = selectRandomHideogram(mode: gameMode)
        self.hideogram = randomHideogram.hideogram
        self.answer = randomHideogram.answer
    }
    
    private func selectRandomHideogram(mode: TypeOfGame)->(hideogram: String, answer: String) {

        var randomHideogramValues = ("", "")
        let randomRow = Int.random(in: 0..<self.hideogramRows.count)
        
        if self.hideogramRows[randomRow].count > 0 {
            let randomHideogram = Int.random(in: 0..<self.hideogramRows[randomRow].count)
            randomHideogramValues = ((self.hideogramRows[randomRow])[randomHideogram], (latin.alphabet[randomRow])[randomHideogram])
            
            if mode == .normal {
                (self.hideogramRows[randomRow]).remove(at: randomHideogram)
                (latin.alphabet[randomRow]).remove(at: randomHideogram)
            }
        }
        
        return randomHideogramValues
    }
    
    func updateScore(with typeOfScore: TypeOfScore) {
        switch typeOfScore {
        case .correct:
            score += 1
        case .wrong:
            errors += 1
        }
    }
}
