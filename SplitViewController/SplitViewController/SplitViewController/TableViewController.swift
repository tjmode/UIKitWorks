//
//  TableViewController.swift
//  SplitViewController
//
//  Created by Sunitha Balasubramanian on 24/08/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, ListControllerDelegate {
    var contactName: UITextField!
    var contactNumber: UITextField!
    let defaults = UserDefaults.standard
    var selectedIndexPath = 0
    var contact = [ContactList]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contact List"
        navigationItem.leftBarButtonItem = self.editButtonItem
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add
            , target: self, action: #selector(addingNewContact))
        tableView.reloadData()
        retrieveData()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // MARK: - Number of Rows In Section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contact.count
    }
    
    // MARK: - tableView cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.contactNameLabel.text = contact[indexPath.row].contactName
        cell.contactNumberLabel.text = contact[indexPath.row].contactNumber
        return cell
    }
    
    @objc func addingNewContact() {
        let alertController =  UIAlertController(title: "Add New Contact", message: nil, preferredStyle: .alert)
        alertController.addTextField{(contactNameText) in
            self.contactName =  contactNameText
            self.contactName?.placeholder = "Enter name"
            
        }
        
        alertController.addTextField{(contactNumbertext) in
            self.contactNumber = contactNumbertext
            self.contactNumber?.placeholder = "Enter Number"
            self.contactNumber.keyboardType = .numberPad
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            self.contact.append(ContactList(contactName: "\(self.contactName.text!)",contactNumber: "\(self.contactNumber.text!)"))
            self.tableView.reloadData()
            self.saveUserDefaults()
            self.retrieveData()
        }))
        present(alertController, animated: true)
    }
    
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            contact.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveUserDefaults()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! DetailViewController
        detailViewController.delegate = self
        detailViewController.contactId = indexPath.row
        detailViewController.contactNameText = contact[indexPath.row].contactName
        detailViewController.contactNumberText = contact[indexPath.row].contactNumber
        detailViewController.contactArray = contact
        let navigationViewController = UINavigationController(rootViewController: detailViewController)
        splitViewController?.showDetailViewController(navigationViewController, sender: nil)
    }
    
    func updateContactList(data: [ContactList]) {
        contact = data
        print(contact)
        defaults.set(try? PropertyListEncoder().encode(contact), forKey: "Saved")
        tableView.reloadData()
        retrieveData()
    }
    
    func saveUserDefaults() {
        defaults.set(try? PropertyListEncoder().encode(contact), forKey: "Saved")
        retrieveData()
    }
    
    func retrieveData() {
        if let savedContact = defaults.value(forKey: "Saved") as? Data {
            let loadContact = try? PropertyListDecoder().decode(Array<ContactList>.self, from: savedContact)
            contact = loadContact!
        }
    }
    // Override to support rearranging the table view.
   /* override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
