//
//  BeerTableViewCell.swift
//  BeerSearchingApp
//
//  Created by Juan Fernández Otero on 29/5/21.
//

import UIKit

class BeerTableViewCell: UITableViewCell {

    @IBOutlet weak var titleBeer: UILabel!
    @IBOutlet weak var tagLine: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleBeer.numberOfLines = 3

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        
    }
    
}
