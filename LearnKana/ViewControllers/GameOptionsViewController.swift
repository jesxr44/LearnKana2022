//
//  GameOptionsViewController.swift
//  LearnKana
//
//  Created by Jesus Escribano on 17/3/22.
//

import Foundation
import UIKit

class GameOptionsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var goButton: UIBarButtonItem!
    @IBOutlet weak var selectAll: UIBarButtonItem!
    
    var alphabet : Alphabet?
    var gameOptionsViewModel : GameOptionsViewModel?
    var rows : Array<String>?
    var subtitles : Array<String>?
    
    private var selectedCells : Array<Int> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let alphabet = alphabet {
            gameOptionsViewModel = GameOptionsViewModel.init(with: alphabet)
            rows = gameOptionsViewModel!.rowsViewModel()
            subtitles = gameOptionsViewModel!.subtitleViewModel()
            self.navigationItem.title = alphabet.title
        }
        
        goButton.isEnabled = false
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - Buttons actions
    @IBAction func selectAllRows(_ sender: UIBarButtonItem) {
        guard let alphabet = alphabet else {
            return
        }
        if selectedCells.count < alphabet.alphabet.count {
            let range: Range = 0..<alphabet.alphabet.count
            for number in range {
                selectedCells.append(number)
            }
            sender.title = "Deselect All"
            goButton.isEnabled = true
        } else {
            selectedCells = []
            sender.title = "Select All"
            goButton.isEnabled = false
        }
        tableView.reloadData()
    }
    
    @IBAction func startGame(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Select mode", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Normal", style: .default, handler: { _ in
        
            if let gameViewController = self.storyboard?.instantiateViewController(withIdentifier: "gameViewControllerIndentifier") as? GameViewController {
                gameViewController.kanaViewModel = KanaViewModel(with: self.alphabet!, rows: self.selectedCells, mode: .normal)
                gameViewController.modalPresentationStyle = .fullScreen
                self.present(gameViewController, animated: true, completion: nil)
            }
            
        }))
        
        alert.addAction(UIAlertAction(title: "Time attack", style: .default, handler: { _ in
        
            
            
        }))
        
        alert.addAction(UIAlertAction(title: "Kami", style: .default, handler: { _ in
        
            
            
        }))
        alert.addAction(UIAlertAction(title: "Back", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        

    }
    
    // MARK: - UITableViewDelegate & UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let alphabet = alphabet else {
            return 0
        }

        return alphabet.alphabet.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellReuseIdentifier = "gameOptionsCell"

        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)! as UITableViewCell
        
        guard let rows = rows, let subtitles = subtitles else {
            return cell
        }
        cell.textLabel?.text = rows[indexPath.row]
        cell.detailTextLabel?.text = subtitles[indexPath.row]
        cell.accessoryType = selectedCells.contains(indexPath.row) ? .checkmark : .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            if selectedCells.contains(indexPath.row) {
                let index = selectedCells.firstIndex(of: indexPath.row)!
                selectedCells.remove(at: index)
                cell.accessoryType = .none
            } else {
                selectedCells.append(indexPath.row)
                cell.accessoryType = .checkmark
            }
            goButton.isEnabled = selectedCells.count > 0
        }
    }
}
