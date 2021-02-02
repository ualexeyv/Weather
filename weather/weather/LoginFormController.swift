//
//  LoginFormController.swift
//  weather
//
//  Created by пользовтель on 05.12.2020.
//

import UIKit

class LoginFormController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {
    func pointPrepare (_ view:UIView) {
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        view.backgroundColor = .black
     
    }
    
    let point1 = UIView (frame: CGRect (x: 20, y: 60, width: 10, height: 10))
    let point2 = UIView (frame: CGRect (x: 40, y: 60, width: 10, height: 10))
    let point3 = UIView (frame: CGRect (x: 60, y: 60, width: 10, height: 10))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let keyBoardGesture = UITapGestureRecognizer (target: self, action: #selector (hideKeyBoard))
        scrollView?.addGestureRecognizer(keyBoardGesture)
        assignbackground()
        pointPrepare(point1)
        pointPrepare(point2)
        pointPrepare(point3)
        self.view.addSubview(point1)
        self.view.addSubview(point2)
        self.view.addSubview(point3)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.point1.alpha = 0
        })
        UIView.animate(withDuration: 0.5, delay: 0.1, options: [.repeat, .autoreverse], animations: {
            self.point2.alpha = 0
        })
        UIView.animate(withDuration: 0.5, delay: 0.2, options: [.repeat, .autoreverse], animations: {
            self.point3.alpha = 0
        })
        animateTitlesAppearing()
        

    }
    func animateTitlesAppearing() {
        let offset = view.bounds.width
        let offsetEnterLoginPass = view.bounds.height
        loginLabel.transform = CGAffineTransform(translationX: -offset, y: 0)
        passLabel.transform = CGAffineTransform(translationX: offset, y: 0)
        enterLoginPass.transform = CGAffineTransform (translationX: 0, y: -offsetEnterLoginPass)
        UIView.animate(withDuration: 1,
                       delay: 1,
                       options: .curveEaseOut,
                       animations: {
                           self.loginLabel.transform = .identity
                           self.passLabel.transform = .identity
                        self.enterLoginPass.transform = .identity
                       },
                       completion: nil)
    }
    
    func assignbackground(){
            let background = UIImage(named: "background")

            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
            imageView.contentMode =  UIView.ContentMode.scaleAspectFill
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
    }
    let login = "admin"
  
    let password = "12345"
    @IBOutlet weak var leftConstraintUpperText: NSLayoutConstraint!
    
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var enterLoginPass: UILabel!
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordInput: UITextField!
    @IBAction func buttonPressed(_ sender: Any) {
        
    }
    @IBOutlet weak var passLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var activeTextField: UITextField?
    

    
    @objc func keyBoardWasShown (notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets (top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    @objc func keyBoardWillBeHidden (notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyBoardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyBoardWillBeHidden), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func hideKeyBoard() {
        self.scrollView?.endEditing(true)
    }
    private func checkLogAndPass() -> Bool {
        return loginInput.text == login && passwordInput.text == password
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "checkIdentity" {
            if checkLogAndPass() {
                return true
            } else {
                let alert = UIAlertController (title: "Ошибка!",
                                               message: "Вы ввели не верный логин и пароль",
                                               preferredStyle: .alert)
                let action = UIAlertAction (title: "OK", style: .default) { (action) in
                    self.loginInput.text = ""
                    self.passwordInput.text = ""
                }
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }
        return true
    }
}
