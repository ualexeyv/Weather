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
        
    }

}
