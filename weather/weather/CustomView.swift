//
//  CustomView.swift
//  weather
//
//  Created by пользовтель on 22.12.2020.
//

import UIKit

class CustomView: UIView {
    
        var image: UIImageView? = nil
        
        func setImg (_ image: UIImage) {
            self.image = UIImageView (frame: self.bounds)
            self.image?.image = image
            self.image?.layer.cornerRadius = self.frame.size.height/2
            self.image?.layer.masksToBounds = true
            self.backgroundColor = .clear
            self.addSubview(self.image!)
        }
    
    override func draw(_ rect: CGRect) {
        
        
        layer.shadowColor = UIColor.green.cgColor
        layer.shadowOffset = .zero
        layer.shadowRadius = 12
        layer.shadowOpacity = 1.0
        
        
    }
    

}
