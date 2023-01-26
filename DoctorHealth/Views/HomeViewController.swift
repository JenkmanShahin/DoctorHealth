//
//  UserViewController.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 05.01.23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var user: User?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var doctor1 = Doctor()
    var doctor2: Doctor!
    var doctor3: Doctor!
    
    
    @IBOutlet weak var welcomeText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatDoctors()
        print(doctor1)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(loginUser(_ :)), name: NSNotification.Name.init("login"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loginUser(_ :)), name: NSNotification.Name.init("register"), object: nil)
    }
    
    func creatDoctors(){
        doctor1 = Doctor(context: context)
        doctor1.name = "Dr.Tim"
        doctor1.desText = ""
        doctor1.image = ""
        let termin1 = Termine(context: context)
        termin1.day = "Montag"
        termin1.termin = ["08:30","10:00","14:00"]
        doctor1.addToTermin(termin1)
        
        try! context.save()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! testViewController
        let doctor = sender as! Doctor
        destinationViewController.doctor = doctor
    }

    @IBAction func buttonPressed(){
        performSegue(withIdentifier: "show_details", sender: doctor1)
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
