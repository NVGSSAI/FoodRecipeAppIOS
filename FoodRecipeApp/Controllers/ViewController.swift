//
//  ViewController.swift
//  FoodRecipeApp
//
//  Created by student on 11/24/21.
//

import UIKit
import FirebaseDatabase

//struct recipeDetail{
//    var id:String
//    var name:String
//    var cook:Int
//    var image:UIImage
//    var prep:Int
//    var ratedUsers:Int
//    var rating:Double
//    var servings:Int
//    var total:Int
//    var ingredients:[String]
//    var instructions:[String]
//}
var recipes = [recipeDetail]()
var popularRecipes = [recipeDetail] ()
var searchedRecipes = [recipeDetail]()
var data = NSDictionary()

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    @IBOutlet weak var popularRecipesLabel: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    @IBOutlet weak var listTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recipes.count
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//Creating database reference from firebase
        let databaseRef = Database.database().reference()
//Fetch recipes from firebase
        databaseRef.child("recipes").queryOrdered(byChild: "name").queryEqual(toValue: searchBar.text).observeSingleEvent(of: .value){(snapshot) in            
//            databaseRef.child("recipes").queryOrdered(byChild: "ingredients").queryEqual(toValue: "2 teaspoons salt").observeSingleEvent(of: .value){(snapshot) in
//            print(snapshot.value as! NSDictionary)
//            print(snapshot.value!)
            if snapshot.exists(){
                let searchedData = snapshot.value as! NSDictionary
                self.assigntoSearchedData(data: searchedData)
                self.performSegue(withIdentifier: "searchtoTable", sender: nil)
            }else{
                let alert = UIAlertController(title: "Alert", message: "No data found for the search \"\(searchBar.text!)\"", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                searchBar.text = ""
                self.present(alert, animated: true, completion: nil)
            }

        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeinList", for: indexPath) as! ListRecipeTableViewCell
        print(recipes[indexPath.row].name)
        cell.setData(name: recipes[indexPath.row].name, image: recipes[indexPath.row].image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? ListRecipeTableViewCell
        self.performSegue(withIdentifier: "listRecipeDetail", sender: cell)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        popularRecipes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularRecipeCell", for: indexPath) as! PopularRecipeCollectionViewCell
        print(popularRecipes[indexPath.row].name)
        cell.setPopularRecipesData(image: popularRecipes[indexPath.row].image, name: popularRecipes[indexPath.row].name)
        return cell
    }
        
    override func viewDidLoad(){
        super.viewDidLoad()
            self.getData()
//        popularRecipesLabel.layer.borderColor = UIColor.red.cgColor
//        popularRecipesLabel.layer.borderWidth = 3.0
                print("recipes view didload",recipes)
                popularCollectionView.delegate = self
                popularCollectionView.dataSource = self
                let nib = UINib(nibName: "ListRecipeTableViewCell", bundle: nil)
                listTableView.register(nib, forCellReuseIdentifier: "recipeinList")
                listTableView.dataSource = self
                listTableView.delegate = self
                searchBar.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        createSpinnerView()
    }
    
    func getData(){
        let databaseRef = Database.database().reference()
        databaseRef.child("recipes").observeSingleEvent(of: .value){(snapshot) in

            data = snapshot.value as! NSDictionary
            print("API CALl",data)
            self.assigntoModel()
        }
    }

    func assigntoModel(){
        print("assign model data",data)
        for(key,values) in data{
            var recipeRow = recipeDetail (id:key as! String,name: "", cook: 0, image: UIImage(named: "noImage")!, prep: 0, ratedUsers: 0, rating: 0.0, servings: 0, total: 0, ingredients: [], instructions: [])
            for(sKey,subValues) in values as! NSDictionary{
                switch sKey as! String {
                case "cook":recipeRow.cook = subValues as! Int
                case "prep":recipeRow.prep = subValues as! Int
                case "rating":recipeRow.rating = subValues as! Double
                case "image":
                    recipeRow.image = fetchImageFromWeb(url: subValues as! String)
                case "ratedUsers":recipeRow.ratedUsers = subValues as! Int
                case "total":recipeRow.total = subValues as! Int
                case "name":recipeRow.name = subValues as! String
                    print(recipeRow.name)
                case "servings":recipeRow.servings = subValues as! Int
                case "ingredients":recipeRow.ingredients = subValues as! Array<String>
                case "instructions":recipeRow.instructions = subValues as! Array<String>
                default:print("")
                }
            }
            recipes.append(recipeRow)
        }
        recipes = recipes.sorted{
            $0.name < $1.name
        }
        popularRecipes = getPopularRecipes(recipeList: recipes)
        print("In data",recipes)
        self.listTableView.reloadData()
        self.popularCollectionView.reloadData()
    }

    func fetchImageFromWeb(url:String)->UIImage{
        let url = URL(string: url)!
        print(url)
        // Fetch Image Data
        if let data = try? Data(contentsOf: url) {
            // Create Image and Update Image View
            return UIImage(data: data)!
        }
        return UIImage(data:Data())!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "popularRecipetoDetail"{
            let destinationFromPopular = segue.destination as! RecipeDetailViewController
            destinationFromPopular.detailsOfRecipe = popularRecipes[(popularCollectionView.indexPathsForSelectedItems?[0][1])!]
        }
        if segue.identifier == "searchtoTable"{
            let destinationFromSearch = segue.destination as! SearchResultViewController
            destinationFromSearch.searchedRecipes = searchedRecipes
        }
        if segue.identifier == "listRecipeDetail"{
            let destinationtoDetail = segue.destination as! RecipeDetailViewController
            destinationtoDetail.detailsOfRecipe =
            recipes[(listTableView.indexPathForSelectedRow?.row)!]
        }
        
    }
    
    
    func assigntoSearchedData(data:NSDictionary){
        for(key,values) in data{
            var recipeRow = recipeDetail (id:key as! String,name: "", cook: 0, image: UIImage(named: "noImage")!, prep: 0, ratedUsers: 0, rating: 0.0, servings: 0, total: 0, ingredients: [], instructions: [])
            for(sKey,subValues) in values as! NSDictionary{
                switch sKey as! String {
                case "cook":recipeRow.cook = subValues as! Int
                case "prep":recipeRow.prep = subValues as! Int
                case "rating":recipeRow.rating = subValues as! Double
                case "image":recipeRow.image = fetchImageFromWeb(url: subValues as! String)
                case "ratedUsers":recipeRow.ratedUsers = subValues as! Int
                case "total":recipeRow.total = subValues as! Int
                case "name":recipeRow.name = subValues as! String
                case "servings":recipeRow.servings = subValues as! Int
                case "ingredients":recipeRow.ingredients = subValues as! Array<String>
                case "instructions":recipeRow.instructions = subValues as! Array<String>
                default:print("")
                }
            }
            searchedRecipes.append(recipeRow)
        }
    }
    
    func createSpinnerView() {
            let child = SpinnerViewController()

            // add the spinner view controller
            addChild(child)
            child.view.frame = view.frame
            view.addSubview(child.view)
            child.didMove(toParent: self)

            // wait two seconds to simulate some work happening
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                // then remove the spinner view controller
                child.willMove(toParent: nil)
                child.view.removeFromSuperview()
                child.removeFromParent()
            }
        }
    func getPopularRecipes(recipeList:[recipeDetail])->[recipeDetail]{
        print("popular recipes")
        var tempRecipes = [recipeDetail]()
        for recipe in recipeList {
            if recipe.rating >= 9 {
                tempRecipes.append(recipe)
                print(recipe)
            }
        }
        return tempRecipes
    }
    
    


}

