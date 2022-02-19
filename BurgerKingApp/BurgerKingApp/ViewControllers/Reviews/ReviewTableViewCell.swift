//
//  ReviewTableViewCell.swift
//  BurgerKingApp
//
//  Created by Dmitry on 17.02.22.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {


    @IBOutlet final weak var dateReviewLabel: UILabel!
    @IBOutlet final weak var textReviewLabel: UILabel!
    @IBOutlet final weak var ratingReviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
