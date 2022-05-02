//
//  RecipeDetailViewController.swift
//  FoodRecipeApp
//
//  Created by student on 11/24/21.
//

import UIKit

class RecipeDetailViewController: UIViewController {

    var detailsOfRecipe = recipeDetail (id:"" as! String,name: "", cook: 0, image: UIImage(named: "noImage")!, prep: 0, ratedUsers: 0, rating: 0.0, servings: 0, total: 0, ingredients: [], instructions: [])
    @IBOutlet weak var preparationTimeLabel: UILabel!
    @IBOutlet weak var detailRecipeImageView: UIImageView!
    @IBOutlet weak var cookingTimeLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var ratingImage1: UIImageView!
    @IBOutlet weak var ratingImage2: UIImageView!
    @IBOutlet weak var ratingImage3: UIImageView!
    @IBOutlet weak var ratingImage4: UIImageView!
    @IBOutlet weak var ratingImage5: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preparationTimeLabel.text = "\(String(detailsOfRecipe.prep))"
        detailRecipeImageView.image = detailsOfRecipe.image
        cookingTimeLabel.text = "\(String(detailsOfRecipe.cook))"
        totalTimeLabel.text = "\(String(detailsOfRecipe.total))"
        servingsLabel.text = "\(String(detailsOfRecipe.servings))"
        recipeNameLabel.text = detailsOfRecipe.name
        assignRating()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailtoIngredients" {
            let ingredientsDest = segue.destination as! IngredientsViewController
            ingredientsDest.ingredients = detailsOfRecipe.ingredients
        }
        if segue.identifier == "detailtoInstructions" {
            let instDest = segue.destination as! InstructionsViewController
            instDest.instructions = detailsOfRecipe.instructions
        }
    }
    func assignRating(){
            
            var rating = detailsOfRecipe.rating
            rating.round()
            print(rating)
            rating = rating / 2
            rating.round()
            print(rating)
            var count = 1
            while(count<=Int(rating)){
                switch count {
                case 1:
                    ratingImage1.image = UIImage(named: "filledImage")
                case 2:
                    ratingImage2.image = UIImage(named: "filledImage")
                case 3:
                    ratingImage3.image = UIImage(named: "filledImage")
                case 4:
                    ratingImage4.image = UIImage(named: "filledImage")
                case 5:
                    ratingImage5.image = UIImage(named: "filledImage")
                default:
                    print("")
                }
                count += 1
            }
        }

    
}
