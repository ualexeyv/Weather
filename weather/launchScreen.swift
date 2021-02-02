//
//  launchScreen.swift
//  weather
//
//  Created by пользовтель on 26.01.2021.
//

import UIKit

class launchScreen: UIViewController {

    let point1 = UIView (frame: CGRect (x: 20, y: 20, width: 5, height: 5))
    let point2 = UIView (frame: CGRect (x: 30, y: 20, width: 5, height: 5))
    let point3 = UIView (frame: CGRect (x: 40, y: 20, width: 5, height: 5))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        point1.layer.cornerRadius = 2.5
        point1.layer.masksToBounds = true
        point1.backgroundColor = .white
        point2.layer.cornerRadius = 2.5
        point2.layer.masksToBounds = true
        point2.backgroundColor = .white
        point3.layer.cornerRadius = 2.5
        point3.layer.masksToBounds = true
        point3.backgroundColor = .white
        self.view.addSubview(point1)
        self.view.addSubview(point2)
        self.view.addSubview(point3)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.point1.alpha = 0.5
        })
        UIView.animate(withDuration: 0.5, delay: 0.1, options: [.repeat, .autoreverse], animations: {
            self.point2.alpha = 0.5
        })
        UIView.animate(withDuration: 0.5, delay: 0.2, options: [.repeat, .autoreverse], animations: {
            self.point3.alpha = 0.5
        })

    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
