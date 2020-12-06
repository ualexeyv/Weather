//
//  LoginFormController.swift
//  weather
//
//  Created by пользовтель on 05.12.2020.
//

import UIKit

class LoginFormController: UIViewController {

    override func viewDidLoad() {
            super.viewDidLoad()
         
            // Жест нажатия
            let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
            // Присваиваем его UIScrollVIew
            scrollView?.addGestureRecognizer(hideKeyboardGesture)
    }
   
    let login = "admin"
  
    let password = "12345"
    
    @IBOutlet var scrollView: UIScrollView!
    
    @IBOutlet var loginInput: UITextField!
    
    @IBOutlet var passwordInput: UITextField!
    
    @IBAction func buttonPressed(_ sender: Any) {
            
    }
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
            // Второе — когда она пропадает
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    /*
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "checkIdentity" {
            if checkInput() {
                return true
            } else {
                let alert = UIAlertController (title: "Ошибка",
                                               message: "вы ввели не правильные логин и пароль",
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
    
    private func checkInput () -> Bool {
        return loginInput.text == login && passwordInput.text == password
    } */
    
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
