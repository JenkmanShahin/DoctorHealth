//
//  UserViewController.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 05.01.23.
//

import UIKit

class HomeViewController: UIViewController {

    var user: User!
    
    @IBOutlet weak var welcomeText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeText.text = "Hallo \(user.fullname ?? "")"

    }

}
