//
//  ProfileViewController.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 12.01.23.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var imageViewQR: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var generateBTN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func genrateBTN(_ sender: Any) {
        if let writeText = textField.text{
            
            let data = writeText.data(using: .ascii, allowLossyConversion: false)
            
            let filer = CIFilter(name: "CIQRCodeGenerator")
            filer?.setValue(data, forKey: "inputMessage")
            
            let img = UIImage(ciImage: (filer?.outputImage)!)
            
            imageViewQR.image = img
            
        }
    }
}
