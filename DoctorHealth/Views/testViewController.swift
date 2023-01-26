//
//  testViewController.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 24.01.23.
//

import UIKit

class testViewController: UIViewController {
    
    var doctor: Doctor!

    @IBOutlet weak var doctorName: UILabel!
    @IBOutlet weak var doctorDescription: UITextView!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var doctorImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doctorName.text = doctor.name
        

    }
  
}
