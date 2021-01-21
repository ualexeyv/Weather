//
//  PhotoCollectionCell.swift
//  weather
//
//  Created by пользовтель on 18.12.2020.
//

import UIKit

class PhotoCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var photoView: CustomView!
    var image: UIImageView? = nil
    func SetPhotoData (img: UIImage) {
        image = UIImageView (frame: self.bounds)
        image?.image = img
        self.addSubview(self.image!)
    }
}
