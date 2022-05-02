//
//  PopularRecipeCollectionViewCell.swift
//  FoodRecipeApp
//
//  Created by student on 11/24/21.
//

import UIKit

class PopularRecipeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var popularRecipeImage: UIImageView!
    @IBOutlet weak var popularRecipeName: UILabel!
    
    func setPopularRecipesData(image:UIImage,name:String){
        popularRecipeName.text = name
        popularRecipeImage.image = image
    }
    
}
