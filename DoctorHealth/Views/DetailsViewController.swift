//
//  DetailsViewController.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 16.01.23.
//

import UIKit

class DetailsViewController: UIViewController{
    
    @IBOutlet weak var tabletName: UILabel!
    
    @IBOutlet weak var morningField: UITextField!
    @IBOutlet weak var noonField: UITextField!
    @IBOutlet weak var eviningField: UITextField!
    
    let mortingTablets = ["1/2 Pill", "1 Pill", "2 Pill", "0.3 ml", "0.5 ml", "0.8 ml"]
    let morningTabletsPicker = UIPickerView()
    
    let noonTablets = ["1/2 Pill", "1 Pill", "2 Pill", "0.3 ml", "0.5 ml", "0.8 ml"]
    let noonTabletsPicker = UIPickerView()
    
    let eveningTablets = ["1/2 Pill", "1 Pill", "2 Pill", "0.3 ml", "0.5 ml", "0.8 ml"]
    let eviningTabletsPicker = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        morningTabletsPicker.dataSource = self
        morningTabletsPicker.delegate = self
        morningField.inputView = morningTabletsPicker
        
        noonTabletsPicker.dataSource = self
        noonTabletsPicker.delegate = self
        noonField.inputView = noonTabletsPicker
        
        eviningTabletsPicker.dataSource = self
        eviningTabletsPicker.delegate = self
        eviningField.inputView = eviningTabletsPicker
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
    
    @IBAction func save(){
        
    }
}

extension DetailsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView{
        case morningTabletsPicker: return mortingTablets.count
        case noonTabletsPicker: return noonTablets.count
        case eviningTabletsPicker: return eveningTablets.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView{
        case morningTabletsPicker: return mortingTablets[row]
        case noonTabletsPicker: return noonTablets[row]
        case eviningTabletsPicker: return eveningTablets[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        switch pickerView{
        case morningTabletsPicker: return morningField.text = mortingTablets[row]
        case noonTabletsPicker: return noonField.text = noonTablets[row]
        case eviningTabletsPicker: return eviningField.text = eveningTablets[row]
            
        default:
            print("Hallo")
        }
        self.view.endEditing(true)
    }
}
