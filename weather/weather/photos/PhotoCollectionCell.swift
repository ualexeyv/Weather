//
//  PhotoCollectionCell.swift
//  weather
//
//  Created by пользовтель on 18.12.2020.
//

import UIKit

class PhotoCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var friendPhoto: UIImageView!
    
    func SetPhotoData (img: UIImage) {
        friendPhoto.image = img
    }
}
