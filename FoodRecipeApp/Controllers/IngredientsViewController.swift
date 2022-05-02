//
//  IngredientsViewController.swift
//  FoodRecipeApp
//
//  Created by student on 11/24/21.
//

import UIKit

class IngredientsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var ingredients:[String] = []
        @IBOutlet weak var ingredientsTableView: UITableView!
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            ingredients.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ingredients", for: indexPath)
            cell.textLabel?.text = ingredients[indexPath.row]
            return cell
        }

        override func viewDidLoad() {
            super.viewDidLoad()
            ingredientsTableView.dataSource = self
            ingredientsTableView.delegate = self
        }
    

}
