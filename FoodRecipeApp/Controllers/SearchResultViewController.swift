//
//  SearchResultViewController.swift
//  FoodRecipeApp
//
//  Created by student on 11/24/21.
//

import UIKit

class SearchResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchedRecipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeinList", for: indexPath) as! ListRecipeTableViewCell
        cell.setData(name: searchedRecipes[indexPath.row].name, image: searchedRecipes[indexPath.row].image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? ListRecipeTableViewCell
        self.performSegue(withIdentifier: "searchtoRecipeDetail", sender: cell)
    }
    
    
    var searchedRecipes:[recipeDetail] = []
    @IBOutlet weak var searchResultsTableView: UITableView!
    override func viewDidLoad() {
            super.viewDidLoad()
            let nib = UINib(nibName: "ListRecipeTableViewCell", bundle: nil)
            searchResultsTableView.register(nib, forCellReuseIdentifier: "recipeinList")
            searchResultsTableView.dataSource = self
            searchResultsTableView.delegate = self
        
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "searchtoRecipeDetail"{
                let destinationtoDetail = segue.destination as! RecipeDetailViewController
                destinationtoDetail.detailsOfRecipe =
                searchedRecipes[(searchResultsTableView.indexPathForSelectedRow?.row)!]
            }
        }
    
}
