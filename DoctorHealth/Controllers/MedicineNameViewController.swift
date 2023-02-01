//
//  MedicineTableViewController.swift
//  DoctorHealth
//
//  Created by jenkman Shahin on 10.01.23.
//

struct Plan {
    let name: String!
    let morning: String!
    let noon: String!
    let evening: String!
    
}

import UIKit

class MedicineViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    var plan = [Plan(name: "IbuBrufen", morning: "String?", noon: "", evening: "")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func startEditing(_ sender: Any){
        tableView.isEditing = !tableView.isEditing
    }

    
    @IBAction func Add(_ sender: Any){
        let alert = UIAlertController(title: "Add a new Plan", message: "Do you want to add a new Plan ?", preferredStyle: .alert)
        
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Cancle", style: .cancel))
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: {(_)
            in
            let text = alert.textFields?.first?.text
            let newPlan = Plan(name: text, morning: "", noon: "", evening: "")
            self.plan.append(newPlan)
            self.tableView.reloadData()
        }))
        present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! DetailsViewController
        let plan = sender as! Plan
        destinationViewController.plan = plan
    }
}

extension MedicineViewController: UITableViewDataSource, UITableViewDelegate{

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plan.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "planCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = plan[indexPath.row].name
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPlan = plan[indexPath.row]
        performSegue(withIdentifier: "showDetailSegue", sender: selectedPlan)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            plan.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else {
            if indexPath.section == 1{
                plan.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            }
       }
    }
}

