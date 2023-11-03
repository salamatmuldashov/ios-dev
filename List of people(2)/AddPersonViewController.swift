//
//  AddPersonViewController.swift
//  List of people(2)
//
//  Created by Salamat Muldashov on 03.11.2023.
//

import UIKit


protocol AddPersonDelegate: AnyObject {
    func addPerson(_ person: Person)
    
}

class AddPersonViewController: UIViewController{
    weak var delegate: AddPersonDelegate?
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!

    @IBAction func addPersonTapped(_ sender: UIButton){
        guard let firstName = firstNameTextField.text, let lastName = lastNameTextField.text else { return }
       
        
        let newPerson = Person(id: 0, firstName: firstName, lastName: lastName)
        
        delegate?.addPerson(newPerson)
        
        
        navigationController?.popViewController(animated: true)

        
    }
}
