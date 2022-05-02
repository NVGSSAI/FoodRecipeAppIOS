//
//  InstructionsViewController.swift
//  FoodRecipeApp
//
//  Created by student on 11/24/21.
//

import UIKit

class InstructionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var instructionsLabel: UIView!
    @IBOutlet weak var instructionsTableView: UITableView!
    var instructions:[String] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        instructions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = instructionsTableView.dequeueReusableCell(withIdentifier: "instructions", for: indexPath) as! InstructionsTableViewCell
        cell.textLabel!.numberOfLines = 0
        cell.textLabel!.lineBreakMode = .byWordWrapping
        cell.textLabel!.font = UIFont.systemFont(ofSize: 14.0)
        cell.setData(line: instructions[indexPath.row])
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instructionsTableView.dataSource = self
        instructionsTableView.delegate = self
    }
        
}
