//
//  Katakana.swift
//  LearnKana
//
//  Created by Jesus Escribano on 16/3/22.
//

import Foundation

struct Katakana: Alphabet {
    let title = "Katakana"
    var alphabet : Array<Array<String>>

    let vowels = ["ア","イ","ウ","エ","オ"]
    let kRow = ["カ","キ","ク","ケ","コ"]
    let sRow = ["サ","シ","ス","セ","ソ"]
    let tRow = ["タ","チ","ツ","テ","ト"]
    let nRow = ["ナ","ニ","ヌ","ネ","ノ"]
    let hRow = ["ハ","ヒ","フ","ヘ","ホ"]
    let mRow = ["マ","ミ","ム","メ","モ"]
    let yRow = ["ヤ","ユ","ヨ"]
    let rRow = ["ラ","リ","ル","レ","ロ"]
    let wnRow = ["ワ","ヲ","ン"]
    let gRow = ["ガ","ギ","グ","ゲ","ゴ"]
    let zRow = ["ザ","ジ","ズ","ゼ","ゾ"]
    let dRow = ["ダ","ヂ","ヅ","デ","ド"]
    let bRow = ["バ","ビ","ブ","ベ","ボ"]
    let pRow = ["パ","ピ","プ","ペ","ポ"]
    
    let kyaRow = ["キャ","キュ","キョ"]
    let gyaRow = ["ギャ","ギュ","ギョ"]
    let shaRow = ["シャ","シュ","ショ"]
    let jaRow = ["ジャ","ジュ","ジョ"]
    let chaRow = ["チャ","チュ","チョ"]
    let nyaRow = ["ニャ","ニュ","ニョ"]
    let hyaRow = ["ヒャ","ヒュ","ヒョ"]
    let byaRow = ["ビャ","ビュ","ビョ"]
    let pyaRow = ["ピャ","ピュ","ピョ"]
    let myaRow = ["ミャ","ミュ","ミョ"]
    let ryaRow = ["リャ","リュ","リョ"]
    
    init () {
        alphabet = [vowels, kRow, sRow, tRow, nRow, hRow, mRow, yRow, rRow, wnRow, gRow, zRow, dRow, bRow, pRow, kyaRow, gyaRow, shaRow, jaRow, chaRow, nyaRow, hyaRow, byaRow, pyaRow, myaRow, ryaRow]
    }
}
