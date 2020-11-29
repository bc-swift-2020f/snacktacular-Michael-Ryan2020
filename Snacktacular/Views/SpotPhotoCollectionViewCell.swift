//
//  SpotPhotoCollectionViewCell.swift
//  Snacktacular
//
//  Created by Michael Ryan on 11/12/20.
//  Copyright © 2020 Michael Ryan. All rights reserved.
//

import UIKit
import SDWebImage

class SpotPhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var photoImageView: UIImageView!
    var spot: Spot!
    var photo: Photo! {
        didSet {
            
            if let url = URL(string: self.photo.photoURL) {
                self.photoImageView.sd_imageTransition = .fade
                self.photoImageView.sd_imageTransition?.duration = 0.2
                self.photoImageView.sd_setImage(with: url)
            } else {
                print("Error: Url didn't work \(self.photo.photoURL)")
                self.photo.loadImage(spot: self.spot) { (success) in
                    self.photo.saveData(spot: self.spot) { (success) in
                        print("Image updated with URL \(self.photo.photoURL)")
                    }
                }
            }
//
        }
    }
    
    
}
