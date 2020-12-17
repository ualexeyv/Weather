//
//  GroupCell.swift
//  weather
//
//  Created by пользовтель on 16.12.2020.
//

import UIKit

class GroupCell: UITableViewCell {

    
    @IBOutlet weak var iconGroup: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    func setGroupData (name: String, desc: String, icon: UIImage) {
        nameLabel.text = name
        descLabel.text = desc
        iconGroup.image = icon
    }
    

}
