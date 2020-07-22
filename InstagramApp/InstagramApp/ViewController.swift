//
//  ViewController.swift
//  InstagramApp
//
//  Created by Tonywilson Jesuraj on 22/07/20.
//  Copyright © 2020 Tonywilson Jesuraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var tableView: UITableView!
    var models = [InstagramPost]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.register(PostTableViewCell.nib(), forCellReuseIdentifier: PostTableViewCell.identifier)

        tableView.delegate = self 
        tableView.dataSource = self
        models.append(InstagramPost(numberOfLikes: 1202, userName: "Dan_Dhayaalan", userImageName: "dan", postImageName: "pic"))
        
        models.append(InstagramPost(numberOfLikes: 39213, userName: "Next_Dan_kishore", userImageName: "dan", postImageName: "pic"))
        
        models.append(InstagramPost(numberOfLikes: 239213, userName: "Sunitha", userImageName: "pic", postImageName: "snake"))
        
      
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 120+140+view.frame.size.width
//    }

}


struct InstagramPost {
    let numberOfLikes: Int
    let userName: String
    let userImageName: String
    let postImageName: String
}
