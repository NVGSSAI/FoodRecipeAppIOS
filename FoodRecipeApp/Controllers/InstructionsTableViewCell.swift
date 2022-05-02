//
//  InstructionsTableViewCell.swift
//  FoodRecipeApp
//
//  Created by student on 12/4/21.
//

import UIKit

class InstructionsTableViewCell: UITableViewCell {

    @IBOutlet weak var instructionsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(line: String){
        instructionsLabel.text = line
    }
}
