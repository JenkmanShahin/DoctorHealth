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



}
