//
//  FriendsViewCell.swift
//  weather
//
//  Created by пользовтель on 12.12.2020.
//

import UIKit

class ReusableCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var cView: CustomView!
    
    func setData (name: String, surname: String) {
        nameLabel.text = name
        descLabel.text = surname
        
    }
    func setAvatar (_ img: UIImage) {
        cView.setImg(img)
        
        
    }
    override func draw(_ rect: CGRect) {
        
    //    layer.shadowColor = UIColor.blue.cgColor
   //     layer.shadowOffset = .zero
   //     layer.shadowRadius = 12
   //     layer.shadowOpacity = 1.0
    }
}
