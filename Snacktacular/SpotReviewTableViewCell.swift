//
//  SpotReviewTableViewCell.swift
//  Snacktacular
//
//  Created by Michael Ryan on 11/8/20.
//  Copyright © 2020 Michael Ryan. All rights reserved.
//

import UIKit

class SpotReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewTitleLabel: UILabel!
    
    @IBOutlet weak var reviewTextLabel: UILabel!
    
    var review: Review! {
        didSet {
            reviewTitleLabel.text = review.title
            reviewTextLabel.text = review.text
        }
    }
}
