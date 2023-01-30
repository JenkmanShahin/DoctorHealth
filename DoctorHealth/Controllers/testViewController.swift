//
//  testViewController.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 24.01.23.
//

import UIKit

class testViewController: UIViewController{
   
    var doctor: Doctor!
    
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var doctorDescription: UITextView!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var doctorImage: UIImageView!
    
    @IBOutlet weak var appointment: UIDatePicker!
    
    @IBOutlet weak var appointmentField: UITextField!
    
    let appointments = ["Monday: 08:30", "10:30", "15:30", "09:30", "11:00", "13:30", "10:30", "10:30", "13:30", "16:30", "08:30", "10:30"]
    let appointmentPicker = UIPickerView()
    
    let context = (UIApplication.shared.delegate as!
                   AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doctorName.text = doctor.name
        
        appointmentPicker.dataSource = self
        appointmentPicker.delegate = self
        appointmentField.inputView = appointmentPicker
        

        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func appBookBTN(_ sender: Any) {
    }
    
}

extension testViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView{
        case appointmentPicker: return appointments.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView{
        case appointmentPicker: return appointments[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        switch pickerView{
        case appointmentPicker: return appointmentField.text = appointments[row]
            
        default:
            print("Hallo")
        }
        self.view.endEditing(true)
    }
}

  

