//
//  ViewController.swift
//  List of people
//
//  Created by Salamat Muldashov on 04.10.2023.
//

import UIKit


class ViewController: UIViewController, AddPersonDelegate {
   
    
    var persons: [Person] = [] 
    var idCounter: Int = 0
    var selectedIndex: Int?

    @IBOutlet weak var nameLabel: UIButton!
    @IBOutlet weak var surnameLabel: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PersonCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func sortByNameTapped(_ sender: UIButton) {
        persons.sort { $0.firstName < $1.firstName }
        tableView.reloadData()
    }

    @IBAction func sortByLastNameTapped(_ sender: UIButton) {
        persons.sort { $0.lastName < $1.lastName }
        tableView.reloadData()
        
    }
   
    @IBAction func defaultOrderByTapped(_ sender: UIButton) {
        persons.sort{ $0.id < $1.id }
        tableView.reloadData()
    }
    
    func addPerson(_ person: Person ) {
        idCounter+=1
        let personWithID = Person(id: idCounter, firstName: person.firstName, lastName: person.lastName)

        persons.append(personWithID)
        tableView.reloadData()
    }
    

    
    @IBAction func addPersonButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Update with your storyboard name
        let addPersonVC = storyboard.instantiateViewController(withIdentifier: "AddPersonViewController") as! AddPersonViewController
        addPersonVC.delegate = self
        
        navigationController?.pushViewController(addPersonVC, animated:true)

    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton){
        if let index = selectedIndex{
            persons.remove(at: index)
            tableView.reloadData()
        }

    }
        

    
    
    
    

}

    extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        let person = persons[indexPath.row]
        cell.textLabel?.text =  String(person.id) + " " + person.firstName + " " + person.lastName
        return cell
    }
        
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
    }




}

