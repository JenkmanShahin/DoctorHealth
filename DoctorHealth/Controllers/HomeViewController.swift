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
    
  
    var doctorTim: Doctor!
    var doctorSara: Doctor!
    var doctorMat: Doctor!
    var selectedDoctor: Doctor?
    
    var doctors: [Doctor]!
    
    
    @IBOutlet weak var welcomeText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        NotificationCenter.default.addObserver(self, selector: #selector(loginUser(_ :)), name: NSNotification.Name.init("login"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(loginUser(_ :)), name: NSNotification.Name.init("register"), object: nil)
       
    }
    override func viewWillAppear(_ animated: Bool) {
        fetchDoctors()
    }
    
    func fetchDoctors() {
        do {
            doctors = try context.fetch(Doctor.fetchRequest())
        } catch {
            print("error")
        }
       
    
        doctorSara = doctors[0]
        doctorMat = doctors[1]
        doctorTim = doctors[2]
    }
    /*
    
    func creatDoctors(){
        let doctor1 = Doctor(context: context)
        doctor1.name = "Dr.Tim"
        doctor1.desText = "- Dr.Tim \n- Familydoctor \n- 10 years Experience \n- Telephon: 0521 889956 \n- Email: M.M@gmail.comm "
        doctor1.image = "man health worker_"
        let doctor2 = Doctor(context: context)
        doctor2.name = "Dr.Sara"
        doctor2.desText = "- Dr.Sara \n- Familydoctor \n- 7 years Experience \n- Telephon: 0521 889956 \n- Email: M.M@gmail.comm "
        doctor2.image = "woman health worker_"
        let doctor3 = Doctor(context: context)
        doctor3.name = "Dr.Mat"
        doctor3.desText = "- Dr.Mat \n- Childrendoctor \n- 16 years Experience \n- Telephon: 0521 889956 \n- Email: M.M@gmail.comm "
        doctor3.image = "man health worker_"

        
        do{
              try self.context.save()
            }catch{
              print("Error")
            }
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! testViewController
        destinationViewController.doctor = selectedDoctor
    }

    @IBAction func buttonPressed(){
        selectedDoctor = doctorTim
        performSegue(withIdentifier: "show_details", sender: selectedDoctor)
    }
    
    @IBAction func buttonPressed2(){
        selectedDoctor = doctorSara
        performSegue(withIdentifier: "show_details", sender: selectedDoctor)
    }
    
    @IBAction func buttonPressed3(){
        selectedDoctor = doctorMat
        performSegue(withIdentifier: "show_details", sender: selectedDoctor)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        welcomeText.text = "Welcome \(user?.fullname ?? "")"
    }
    
    @objc func loginUser(_ notification: NSNotification){
        if let x = notification.object as? User {
            user = x
        } else {
            return
        }
    }
}
