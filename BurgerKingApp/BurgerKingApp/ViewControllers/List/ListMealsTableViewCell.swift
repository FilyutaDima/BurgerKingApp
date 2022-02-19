//
//  ListMealsTableViewCell.swift
//  BurgerKingApp
//
//  Created by Dmitry on 18.02.22.
//

import UIKit

class ListMealsTableViewCell: UITableViewCell {

    @IBOutlet final weak var photoImageView: UIImageView!
    @IBOutlet final weak var titleLabel: UILabel!
    @IBOutlet final weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
