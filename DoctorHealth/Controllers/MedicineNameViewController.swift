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
    
    var selectedMedicine: MedicineTime!
    var medicineTimes: [MedicineTime]!
    
    let context = (UIApplication.shared.delegate as!
                   AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchTimes()
        tableView.reloadData()
    }
    
    @IBAction func startEditing(_ sender: Any){
        tableView.isEditing = !tableView.isEditing
    }

    func fetchTimes(){
        do{
            let request = MedicineTime.fetchRequest()
            let medicineTimes = try context.fetch(request)
        } catch{
            print("Error fetiching medicineTime")
        }
    }
    @IBAction func Add(_ sender: Any){
        let alert = UIAlertController(title: "Add a new Plan", message: "Do you want to add a new Plan ?", preferredStyle: .alert)
        
        alert.addTextField()
        alert.addAction(UIAlertAction(title: "Cancle", style: .cancel))
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: {(_)
            in
            let text = alert.textFields?.first?.text
            let newPlan = MedicineTime(context: self.context)
            newPlan.name = text
            do{
                try self.context.save()
            } catch {
                print("Error saving newPill")
            }
            self.tableView.reloadData()
        }))
        present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationViewController = segue.destination as! DetailsViewController
        let medicineTime = sender as! MedicineTime
        destinationViewController.medicineTime = medicineTime
    }
}

extension MedicineViewController: UITableViewDataSource, UITableViewDelegate{

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicineTimes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "planCell", for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = medicineTimes[indexPath.row].name
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPlan = medicineTimes[indexPath.row]
        performSegue(withIdentifier: "showDetailSegue", sender: selectedPlan)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            medicineTimes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else {
            if indexPath.section == 1{
                medicineTimes.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            }
       }
    }
}

