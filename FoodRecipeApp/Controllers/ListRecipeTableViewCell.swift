//
//  ListRecipeTableViewCell.swift
//  FoodRecipeApp
//
//  Created by student on 11/24/21.
//

import UIKit

class ListRecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var popularRecipeNameLabel: UILabel!
    @IBOutlet weak var popularRecipeImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(name:String,image:UIImage){
        popularRecipeImageView.image = image
        popularRecipeNameLabel.text = name
    }

    
}

