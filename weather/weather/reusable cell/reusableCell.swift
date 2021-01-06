//
//  FriendsViewCell.swift
//  weather
//
//  Created by пользовтель on 12.12.2020.
//

import UIKit

class ReusableCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatrImg: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    
    func setData (name: String, surname: String, friendAvatar: UIImage) {
        nameLabel.text = name
        descLabel.text = surname
        avatrImg.image = friendAvatar
        avatrImg.layer.cornerRadius = self.frame.size.height/2
        avatrImg.layer.masksToBounds = true
        
    }
    override func draw(_ rect: CGRect) {
        
    //    layer.shadowColor = UIColor.blue.cgColor
   //     layer.shadowOffset = .zero
   //     layer.shadowRadius = 12
   //     layer.shadowOpacity = 1.0
    }
}
