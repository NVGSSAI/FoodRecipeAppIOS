//
//  RecipeModel.swift
//  FoodRecipeApp
//
//  Created by student on 12/2/21.
//

import Foundation
import UIKit
import FirebaseDatabase

struct recipeDetail{
    var id:String
    var name:String
    var cook:Int
    var image:UIImage
    var prep:Int
    var ratedUsers:Int
    var rating:Double
    var servings:Int
    var total:Int
    var ingredients:[String]
    var instructions:[String]
}
//var recipes = [recipeDetail]()
//var data = NSDictionary()
//
//func getData(){
//    let databaseRef = Database.database().reference()
//    databaseRef.child("foodrecipes").observeSingleEvent(of: .value){(snapshot) in
//        data = snapshot.value as! NSDictionary
//             assigntoModel()
//    }
//}
//
//func assigntoModel(){
//    for(key,values) in data{
//        var recipeRow = recipeDetail (id:key as! String,name: "", cook: 0, image: UIImage(named: "noImage")!, prep: 0, ratedUsers: 0, rating: 0.0, servings: 0, total: 0, ingredients: [], instructions: [])
//        for(sKey,subValues) in values as! NSDictionary{
//            switch sKey as! String {
//            case "cook":recipeRow.cook = subValues as! Int
//            case "prep":recipeRow.prep = subValues as! Int
//            case "rating":recipeRow.rating = subValues as! Double
//            case "image":recipeRow.image = fetchImageFromWeb(url: subValues as! String)
//            case "ratedUsers":recipeRow.ratedUsers = subValues as! Int
//            case "total":recipeRow.total = subValues as! Int
//            case "name":recipeRow.name = subValues as! String
//            case "servings":recipeRow.servings = subValues as! Int
//            case "ingredients":recipeRow.ingredients = subValues as! Array<String>
//            case "instructions":recipeRow.instructions = subValues as! Array<String>
//            default:print("")
//            }
//        }
////        print(recipeRow)
//        recipes.append(recipeRow)
//    }
////    print(recipes)
//}
//
//func fetchImageFromWeb(url:String)->UIImage{
//    let url = URL(string: url)!
//
//    // Fetch Image Data
//    if let data = try? Data(contentsOf: url) {
//        // Create Image and Update Image View
//        return UIImage(data: data)!
//    }
//    return UIImage(data:Data())!
//}
