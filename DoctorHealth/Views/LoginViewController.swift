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
      
      var users: [User]?
    
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
    
    //transferdata
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   //    wir speichern den TabBarController in einer variable
       let destinationVC = segue.destination as! UITabBarController
   //    wir greifen auf das 1te tab des tabBarControllers [0]
       let homeVc = destinationVC.viewControllers?[0] as! HomeViewController
   //    wir geben den user vom loginController zum userViewController
       let enteringUser = sender as? User
        homeVc.user = enteringUser
       
     }
    
    func fetchUser() {
        do {
          self.users = try context.fetch(User.fetchRequest())
        } catch {
          print("error")
        }
      }
    
    @IBAction func buttonPressed(_ sender: Any) {
        for i in 0...users!.count - 1 {
            print(users![i].email)
            if  (users![i].email == email.text && users![i].password == password.text) {
                performSegue(withIdentifier: "show_second", sender: self.users![i])
                break
            }
        }
     }
    
    }
    
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


