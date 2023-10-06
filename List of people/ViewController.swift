//
//  ViewController.swift
//  List of people
//
//  Created by Salamat Muldashov on 04.10.2023.
//

import UIKit




class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UIButton!
    @IBOutlet weak var surnameLabel: UIButton!
    @IBOutlet weak var tableView: UITableView!
    private var isSortedName: Bool = false
    private var isSortedSurname: Bool = false
        
    var persons: [Person] = [
        Person(firstName: "John", lastName: "Snow"),
        Person(firstName: "Tyryon", lastName: "Lannister"),
        Person(firstName: "Robert", lastName: "Baratheon"),
        Person(firstName: "Ed", lastName: "Stark")
    ]
    let originalListOfPersons: [Person] = [
        Person(firstName: "John", lastName: "Snow"),
        Person(firstName: "Tyryon", lastName: "Lannister"),
        Person(firstName: "Robert", lastName: "Baratheon"),
        Person(firstName: "Ed", lastName: "Stark")
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PersonCell")
        tableView.dataSource = self
        
    }

    
    @IBAction func sortByNameTapped(_ sender: UIButton) {
        
            persons.sort { $0.firstName < $1.firstName }
            tableView.reloadData()
        }
        
    @IBAction func sortByLastNameTapped(_ sender: UIButton) {
            persons.sort { $0.lastName < $1.lastName }
            tableView.reloadData()
        }
    
    @IBAction func defaultOrderTapped(_ sender: UIButton){
        persons = originalListOfPersons
        tableView.reloadData()
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell", for: indexPath)
        let person = persons[indexPath.row]
        cell.textLabel?.text = person.firstName + " " + person.lastName
        return cell
    }
    
    
}

