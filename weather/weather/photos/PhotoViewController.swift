//
//  PhotoViewController.swift
//  weather
//
//  Created by пользовтель on 18.12.2020.
//

import UIKit

class PhotoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var photoArray = [UIImage]()
 
    @IBOutlet weak var photoCollection: UICollectionView!
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
       return photoArray.count
    }
   
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCollectionCell
        let photo = photoArray[indexPath.row]
        cell.SetPhotoData(img: photo)
        
        return cell
    }
    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let size = collectionView.bounds.width
        if (size > 500) {
            return CGSize(width: (size/2) - 8, height: (size/2) - 8)
        }
        return CGSize(width: 200, height: 200)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        photoCollection.delegate = self
        photoCollection.dataSource = self
    }

    
}
