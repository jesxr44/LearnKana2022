//
//  GameOptionsViewModel.swift
//  LearnKana
//
//  Created by Jesus Escribano on 18/3/22.
//

import Foundation

struct GameOptionsViewModel {
    var alphabet : Alphabet
    let latin = Latin()
    
    init(with alphabet: Alphabet) {
        self.alphabet = alphabet
    }
    
    func rowsViewModel() -> Array<String> {
        return rowFormat(for: alphabet)
    }
    
    func subtitleViewModel() -> Array<String> {
        return rowFormat(for: latin)
    }
    
    func rowFormat(for alphabet: Alphabet) -> Array<String> {
        var rows : Array<String> = []
        
        for row in alphabet.alphabet {
            
            var rowText = ""
            for hideogram in row {
                rowText.append(hideogram + " ")
            }
            rows.append(rowText)
        }
        
        return rows
    }
}
