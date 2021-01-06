//
//  PhotoViewController.swift
//  weather
//
//  Created by пользовтель on 18.12.2020.
//

import UIKit

class PhotoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var photoArray = [UIImage]()
    @IBOutlet weak var photoCollection: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       return photoArray.count
    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCollectionCell
        let img = photoArray[indexPath.row]
        cell.SetPhotoData(img: img)
        
        return cell
    }
    
 //   override func viewDidLoad() {
 //       super.viewDidLoad()

    
}
