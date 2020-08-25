//
//  ViewController.swift
//  SplitViewController
//
//  Created by Sunitha Balasubramanian on 24/08/20.
//  Copyright © 2020 Sunitha Balasubramanian. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var contactNameText = ""
    var contactNumberText = ""
    var contactId: Int = 0
    var contactName: UITextField!
    var contactNumber: UITextField!
    var contactArray = [ContactList]()
    var delegate: ListControllerDelegate?

    @IBOutlet weak var contactNameLabel: UILabel!
    
    @IBOutlet weak var contactNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.com
        contactNumberLabel.text = contactNumberText
        contactNameLabel.text = contactNameText
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit
        , target: self, action: #selector(editingContactList))
    }
    
    @objc func editingContactList() {
        let alertController =  UIAlertController(title: "Edit Contact", message: nil, preferredStyle: .alert)
        alertController.addTextField{(contactNameText) in
            self.contactName =  contactNameText
            self.contactName.text = "\(self.contactNameLabel.text!)"
            self.contactName?.placeholder = "Enter name"
        }
        alertController.addTextField{(contactNumbertext) in
            self.contactNumber = contactNumbertext
            self.contactNumber.text = "\(self.contactNumberLabel.text!)"
            self.contactNumber?.placeholder = "Enter Number"
        }
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            self.contactArray[self.contactId].contactName = self.contactName.text ?? ""
            self.contactNameLabel.text = self.contactName.text ?? ""
            self.contactArray[self.contactId].contactNumber = self.contactNumber.text ?? ""
            self.contactNumberLabel.text = self.contactNumber.text ?? ""
            self.delegate?.updateContactList(data: self.contactArray)
        }))
        present(alertController, animated: true)
    }
 
}

