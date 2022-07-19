//
//  SelectGameViewController.swift
//  LearnKana
//
//  Created by Jesus Escribano on 17/3/22.
//

import Foundation
import UIKit

class SelectGameViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var selectedAlphabet : Alphabet?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - UITableViewDelegate & UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseIdentifier = "gameModeCell"
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)! as UITableViewCell
        cell.textLabel?.text = titleForCellAt(row: indexPath.row)
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        selectedAlphabet = indexPath.row == 0 ? Hiragana() : Katakana()
        performSegue(withIdentifier: "gameOptionsSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gameOptionsSegue" {
            if let destVC = segue.destination as? GameOptionsViewController {
                destVC.alphabet = selectedAlphabet
            }
        }
    }

    func titleForCellAt(row: Int) -> String {
        switch row {
        case 0:
            return "Hiragana"
        case 1:
            return "Katakana"
        default:
            return ""
        }
    }
}
