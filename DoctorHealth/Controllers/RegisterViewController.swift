//
//  RegisterViewController.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 04.01.23.
//


import UIKit

class RegisterViewController: UIViewController{
    
    var user: [User]!
    
    @IBOutlet weak var birthdate: UITextField!
    @IBOutlet weak var fullName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var gender: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var registerButton: UIButton!
   
    let genders = ["Männlich", "Weiblich", "Divers"]
    let genderPicker = UIPickerView()
    let datePicker = UIDatePicker()
    
    let context = (UIApplication.shared.delegate as!
                   AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardDismissable()
        createDatePicker()
        registerButton.isEnabled = true
        email.keyboardType = .emailAddress
        height.keyboardType = .decimalPad
        weight.keyboardType = .decimalPad
        password.isSecureTextEntry = true
        fullName.delegate = self
        email.delegate = self
        birthdate.delegate = self
        height.delegate = self
        weight.delegate = self
        gender.delegate = self
        password.delegate = self
        genderPicker.delegate = self
        genderPicker.dataSource = self
        gender.inputView = genderPicker
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillHide), name: UIResponder.keyboardDidShowNotification, object: nil)
        
        
        func fetchUsers() {
            do {
                self.user = try context.fetch(User.fetchRequest())
                
                DispatchQueue.main.sync {
                    self.view.reloadInputViews()
                }
            } catch {
                print("error")
            }
        }
        
    }
    
    @IBAction func registerButton(_ sender: UIButton!){
        let new = User(context: self.context)
        new.fullname = fullName.text
        new.gender = gender.text
        let dateFormater = DateFormatter()
        new.birthdate = dateFormater.date(from: birthdate.text!)
        new.password = password.text
        new.email = email.text
        new.height = Double(height.text!) ?? 0
        
        do{
            try self.context.save()
            print(new)
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: NSNotification.Name.init("register"), object: new)
                  }
        } catch {
            print("error")
        }
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyboard.instantiateViewController(identifier: "MainTabBarController")
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mainTabBarController)
        
        
    }

    @objc func keyBoardWillShow(notification: NSNotification) {
        if self.view.frame.origin.y == 0 && (email.isFirstResponder || password.isFirstResponder) {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyBoardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    @objc func dismissKeyboardTouchOutside(){
        self.view.endEditing(true)
    }
    func keyboardDismissable() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardTouchOutside))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    //datePicker
    @objc func datePressed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        birthdate.text = dateFormatter.string(from: datePicker.date)
        birthdate.becomeFirstResponder()
      }
      
      func createDatePicker() {
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        birthdate.inputView = datePicker
        birthdate.inputAccessoryView = createToolbar()
        
      }
      
    func createToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        
        toolbar.sizeToFit()
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(datePressed))
        toolbar.setItems([button], animated: true)
        
        return toolbar
        
    }
}

    //textFields
    extension RegisterViewController: UITextFieldDelegate{
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            switch textField {
            case fullName:
                gender.becomeFirstResponder()
            default: self.view.endEditing(true)
            }
            return true
        }
    }
    
    //PickerViews
    extension RegisterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            switch pickerView {
            case genderPicker:
                return genders.count
            default: return 0
            }
        }
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            switch pickerView {
            case genderPicker:
                return genders[row]
            default: return ""
            }
        }
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            switch pickerView {
            case genderPicker:
                gender.text = genders[row]
            default: print("Picker nicht bekannt")
            }
            gender.becomeFirstResponder()
        } 
    }

