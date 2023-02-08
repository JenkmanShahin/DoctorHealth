//
//  ProfileViewController.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 12.01.23.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var imageViewQR: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logoutBTN(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginController = storyboard.instantiateViewController(identifier: "LoginNavigationController")
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(loginController)
    }
    
}
