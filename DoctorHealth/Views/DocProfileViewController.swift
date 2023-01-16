//
//  DocProfileViewController.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 11.01.23.
//

import UIKit

class DocProfileViewController: UIViewController {

    @IBOutlet weak var availableApBTN: UIButton!
    @IBOutlet weak var ApointmantsView: UIView!
    @IBOutlet var weekBTNs: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func showButtonVisibility(){
        weekBTNs.forEach { button in
            UIView.animate(withDuration: 0.3){
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            }
        }
    }

    @IBAction func AvailableAp_pressed(_ sender: Any) {
        showButtonVisibility()
    }

    @IBAction func weekBTNs_pressed(_ sender: UIButton){
        switch sender.titleLabel!.text{
        case "Week 1":
            availableApBTN.setTitle("Week 1", for: .normal)
        case "Week 2":
            availableApBTN.setTitle("Week 2", for: .normal)
        case "Week 3":
            availableApBTN.setTitle("Week 3", for: .normal)
        case "Week 4":
            availableApBTN.setTitle("Week 4", for: .normal)
        default:
            return 
        }
    }

}
