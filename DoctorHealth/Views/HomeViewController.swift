//
//  UserViewController.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 05.01.23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var user: User?
    
    @IBOutlet weak var welcomeText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(loginUser(_ :)), name: NSNotification.Name.init("login"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loginUser(_ :)), name: NSNotification.Name.init("register"), object: nil)
    }

    @IBAction func buttonPressed(){
        performSegue(withIdentifier: "show_details", sender: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        welcomeText.text = "Welcome \(user?.fullname ?? "")"
    }
    
    @objc func loginUser(_ notification: NSNotification){
        if let x = notification.object as? User {
            user = x
            print(user?.fullname)
        } else {
            return
        }
    }
}
