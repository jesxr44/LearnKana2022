//
//  Hiragana.swift
//  LearnKana
//
//  Created by Jesus Escribano on 16/3/22.
//

import Foundation

struct Hiragana: Alphabet {
    var alphabet : Array<Array<String>>

    let vowels = ["あ","い","う","え","お"]
    let kRow = ["か","き","く","け","こ"]
    let sRow = ["さ","し","す","せ","そ"]
    let tRow = ["た","ち","つ","て","と"]
    let nRow = ["な","に","ぬ","ね","の"]
    let hRow = ["は","ひ","ふ","へ","ほ"]
    let mRow = ["ま","み","む","め","も"]
    let yRow = ["や","ゆ","よ"]
    let rRow = ["ら","り","る","れ","ろ"]
    let wnRow = ["わ","を","ん"]
    let gRow = ["が","ぎ","ぐ","げ","ご"]
    let zRow = ["ざ","じ","ず","ぜ","ぞ"]
    let dRow = ["だ","ぢ","づ","で","ど"]
    let bRow = ["ば","び","ぶ","べ","ぼ"]
    let pRow = ["ぱ","ぴ","ぷ","ぺ","ぽ"]
    
    init () {
        alphabet = [vowels, kRow, sRow, tRow, nRow, hRow, mRow, yRow, rRow, wnRow, gRow, zRow, dRow, bRow, pRow]
    }
}
