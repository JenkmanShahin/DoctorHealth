//
//  DetailsViewController.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 16.01.23.
//

import UIKit

class DetailsViewController: UIViewController{
  
    

    @IBOutlet weak var morningField: UITextField!
    @IBOutlet weak var noonField: UITextField!
    @IBOutlet weak var eviningField: UITextField!
    
    let tablets = ["1/2 Pill", "1 Pill", "2 Pill", "0.3 ml", "0.5 ml", "0.8 ml"]
    let tabletsPicker = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabletsPicker.dataSource = self
        tabletsPicker.delegate = self
        morningField.inputView = tabletsPicker
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
        
    }
        

  
    @IBAction func choose(){
        
    }

}

extension DetailsViewController:  UIPickerViewDataSource, UIPickerViewDelegate{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        <#code#>
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
    }
}
