//
//  CustomView.swift
//  weather
//
//  Created by пользовтель on 22.12.2020.
//

import UIKit

class CustomView: UIImageView {
    
 /*   var image: UIImageView?
    
    func setImg (_ image: UIImage) {
        self.image = UIImageView (frame: self.bounds)
        self.image?.image = image
        self.addSubview(self.image!)
    } */
    
    override func draw(_ rect: CGRect) {
        
        layer.backgroundColor = UIColor.red.cgColor
        layer.shadowColor = UIColor.blue.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 12
        layer.shadowOpacity = 1.0
        
    }
    

}
