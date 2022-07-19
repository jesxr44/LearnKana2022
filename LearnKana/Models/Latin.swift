//
//  Latin.swift
//  LearnKana
//
//  Created by Jesus Escribano on 16/3/22.
//

import Foundation

struct Latin: Alphabet {
    let title = "Latin"
    var alphabet : Array<Array<String>>

    let vowels = ["a","i","u","e","o"]
    let kRow = ["ka","ki","ku","ke","ko"]
    let sRow = ["sa","shi","su","se","so"]
    let tRow = ["ta","chi","tsu","te","to"]
    let nRow = ["na","ni","nu","ne","no"]
    let hRow = ["ha","hi","fu","he","ho"]
    let mRow = ["ma","mi","mu","me","mo"]
    let yRow = ["ya","yu","yo"]
    let rRow = ["ra","ri","ru","re","ro"]
    let wnRow = ["wa","wo","n"]
    let gRow = ["ga","gi","gu","ge","go"]
    let zRow = ["za","ji","zu","ze","zo"]
    let dRow = ["da","ji","zu","de","do"]
    let bRow = ["ba","bi","bu","be","bo"]
    let pRow = ["pa","pi","pu","pe","po"]
    
    let kyaRow = ["kya","kyu","kyo"]
    let gyaRow = ["gya","gyu","gyo"]
    let shaRow = ["sha","shu","sho"]
    let jaRow = ["ja ","ju ","jo"]
    let chaRow = ["cha","chu","cho"]
    let nyaRow = ["nya","nyu","nyo"]
    let hyaRow = ["hya","hyu","hyo"]
    let byaRow = ["bya","byu","byo"]
    let pyaRow = ["pya","pyu","pyo"]
    let myaRow = ["mya","myu","myo"]
    let ryaRow = ["rya","ryu","ryo"]

    init () {
        alphabet = [vowels, kRow, sRow, tRow, nRow, hRow, mRow, yRow, rRow, wnRow, gRow, zRow, dRow, bRow, pRow, kyaRow, gyaRow, shaRow, jaRow, chaRow, nyaRow, hyaRow, byaRow, pyaRow, myaRow, ryaRow]
    }
}
