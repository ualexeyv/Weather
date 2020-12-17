//
//  FriendsViewCell.swift
//  weather
//
//  Created by пользовтель on 12.12.2020.
//

import UIKit

class FriendsViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    
    func setData (name: String, surname: String, friendAvatar: UIImage) {
        nameLabel.text = name
        surnameLabel.text = surname
        avatar.image = friendAvatar
    }

}
