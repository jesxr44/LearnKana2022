//
//  KanaViewModel.swift
//  LearnKana
//
//  Created by Jesus Escribano on 16/3/22.
//

import Foundation

class KanaViewModel {
    var alphabet : Alphabet
    let latin = Latin()
    var hideogram : String
    var answer : String
    var score : Int
    
    init(with alphabet: Alphabet) {
        self.alphabet = alphabet
        self.hideogram = (alphabet.alphabet[0])[0]
        self.answer = (latin.alphabet[0])[0]
        self.score = 0
    }
    
    func selectHideogram()
    {
        let randomRow = Int.random(in: 0..<alphabet.alphabet.count)
        let randomHideogram = Int.random(in: 0..<alphabet.alphabet[randomRow].count)

        self.hideogram = (alphabet.alphabet[randomRow])[randomHideogram]
        self.answer = (latin.alphabet[randomRow])[randomHideogram]
    }
    
    func updateScore()
    {
        score += 1
    }
}
