//
//  SpotPhotoCollectionViewCell.swift
//  Snacktacular
//
//  Created by Michael Ryan on 11/12/20.
//  Copyright © 2020 Michael Ryan. All rights reserved.
//

import UIKit

class SpotPhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    var spot: Spot!
    var photo: Photo! {
        didSet {
            photo.loadImage(spot: spot) { (success) in
                if success {
                    self.photoImageView.image = self.photo.image
                } else {
                    print("Error: no success in loading photo in spotphotocollectionviewcell")
                }
            }
           
        }
    }
    
    
}
