//
//  PhotoViewCellCollectionViewCell.swift
//  weather
//
//  Created by пользовтель on 16.12.2020.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var friendsPhoto: UIImageView!
    
    func setPhotoData (photo: UIImage) {
        friendsPhoto.image = photo
    }
}
