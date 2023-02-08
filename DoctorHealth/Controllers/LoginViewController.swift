//
//  LoginViewController.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 05.01.23.
//


struct Login {
  var email: String
  var password: String
}

import UIKit

class LoginViewController: UIViewController{
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var users: [User]!
    var logUser: User!
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        email.keyboardType = .emailAddress
        password.isSecureTextEntry = true
        
        email.delegate = self
        password.delegate = self
        fetchUser()
    }
    
    //Dissmis Keyboard
    @objc func dismissKeyboardTouchOutside(){
        self.view.endEditing(true)
    }
    
    func keyboardDismissable() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
        action: #selector(dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func fetchUser() {
        do {
            self.users = try context.fetch(User.fetchRequest())
        } catch {
            print("error")
        }
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
        
        if users != nil {
            for user in users! {
               
                if  (user.email == email.text && user.password == password.text) {
                    logUser = user
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: NSNotification.Name.init("login"), object: self.logUser)
                          }
                   
                    (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
                  
                }
            }
        }
    }}
    
    //textField
    extension LoginViewController: UITextFieldDelegate{
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            switch textField {
            case email:
                password.becomeFirstResponder()
            default: self.view.endEditing(true)
            }
            return true
        }
    }
