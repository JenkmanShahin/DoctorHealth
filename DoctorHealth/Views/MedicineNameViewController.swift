//
//  MedicineTableViewController.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 10.01.23.
//

import UIKit

class MedicineViewController: UIViewController{
   
    @IBOutlet weak var tableView: UITableView!
    
    var newPlan = ["FirstWeek", "SecondWeek"]
    var oldPlan: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func startEditing(_ sender: Any){
        tableView.isEditing = !tableView.isEditing
    }
    
    @IBAction func Add(){
        let alert = UIAlertController(title: "Add a new Plan", message: "Do you want to add a new Plan  ?", preferredStyle: .alert)
        
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Cancle", style: .cancel))
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: {(_)
            in
            let text = alert.textFields?.first?.text
            self.newPlan.append(text!)
            self.tableView.reloadData()
        }))
        
        present(alert, animated: true)
    }
}
extension MedicineViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return newPlan.count
        } else {
            return oldPlan.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toAdd", for: indexPath)
        
        
        if indexPath.section == 0{
            var content = cell.defaultContentConfiguration()
            content.text = newPlan[indexPath.row]
            cell.contentConfiguration = content
            cell.accessoryType = .none
        }else {
            if indexPath.section == 1 {
                var content = cell.defaultContentConfiguration()
                content.text = oldPlan[indexPath.row]
                cell.contentConfiguration = content
                cell.accessoryType = .checkmark
            }
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "New Plan"
        }else {
            return "Old Plan"
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            newPlan.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else {
            if indexPath.section == 1{
                oldPlan.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(tableView.isEditing == false){
            
        
            if indexPath.section == 0{
                let data = newPlan[indexPath.row]
                oldPlan.append(data)
                newPlan.remove(at: indexPath.row)
            }else if indexPath.section == 1 {
                let data = oldPlan[indexPath.row]
                newPlan.append(data)
                oldPlan.remove(at: indexPath.row)
                
            }
            tableView.reloadData()
        }
    }
}

