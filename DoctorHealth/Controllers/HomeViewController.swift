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
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(loginUser(_ :)), name: NSNotification.Name.init("login"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loginUser(_ :)), name: NSNotification.Name.init("register"), object: nil)
    }
    
    func creatDoctors(){
        doctor1 = Doctor(context: self.context)
        doctor1.name = "Dr.Tim"
        doctor1.desText = "- Dr.Tim \n- Familydoctor \n- 10 years Experience \n- Telephon: 0521 889956 \n- Email: M.M@gmail.comm "
        doctor1.image = "man health worker_"
        doctor2 = Doctor(context: self.context)
        doctor2.name = "Dr.Sara"
        doctor2.desText = "- Dr.Sara \n- Familydoctor \n- 7 years Experience \n- Telephon: 0521 889956 \n- Email: M.M@gmail.comm "
        doctor2.image = "woman health worker_"
        doctor3 = Doctor(context: self.context)
        doctor3.name = "Dr.Mat"
        doctor3.desText = "- Dr.Mat \n- Childrendoctor \n- 16 years Experience \n- Telephon: 0521 889956 \n- Email: M.M@gmail.comm "
        doctor3.image = "man health worker_"

        
        try! self.context.save()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! testViewController
        let doctor = sender as! Doctor
        destinationViewController.doctor = doctor
    }

    @IBAction func buttonPressed(){
        performSegue(withIdentifier: "show_details", sender: doctor1)
    }
    
    @IBAction func buttonPressed2(){
        performSegue(withIdentifier: "show_details", sender: doctor2)
    }
    
    @IBAction func buttonPressed3(){
        performSegue(withIdentifier: "show_details", sender: doctor3)
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
