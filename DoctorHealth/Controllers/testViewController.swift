//
//  testViewController.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 24.01.23.
//

import UIKit

class testViewController: UIViewController{
   
    var doctor: Doctor!
    var termine: [Termin]!
    
    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var doctorDescription: UITextView!
    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var appointmentLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
  
    let context = (UIApplication.shared.delegate as!
                   AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doctorName.text = doctor.name
        doctorDescription.text = doctor.desText
        doctorImage.image = UIImage(named: doctor.image ?? "")
        fetchTermin()
        

        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        appointmentLabel.text = termine?.last?.termin
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }

    func fetchTermin() {
        do {
            self.termine = try context.fetch(Termin.fetchRequest())
        } catch {
            print("error")
        }
    }
    
   
    @IBAction func confirmBTN(_ sender: Any) {
        let alert = UIAlertController(title: "Confirm", message: "Do you want to confirm this Appointment?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancle", style: .cancel))
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: {_ in
        }))
        present(alert, animated: true)
    
        let newTermin = Termin(context: self.context)
        newTermin.termin = appointmentLabel.text
        if newTermin.termin != "" && newTermin.termin != nil{
            do {
                try self.context.save()
            } catch {
                print("Error saving new Appointment")
            }
        }
    }
    
    @IBAction func datePicker(_ sender: Any) {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd-MM-YY||hh:mm"
        appointmentLabel.text = dateFormater.string(from: datePicker.date)
    }
}



//extension testViewController: UIPickerViewDataSource, UIPickerViewDelegate{
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
    
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//
//    }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
//
//    }
    
    

