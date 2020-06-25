//
//  ViewController.swift
//  UIButton
//
//  Created by Tonywilson Jesuraj on 23/06/20.
//  Copyright © 2020 Tonywilson Jesuraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    let button = UIButton()
    let refreshButton = UIButton()
    var text = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        text.delegate = self
        text.placeholder = "Text...."
        text.borderStyle = .roundedRect
        refreshButton.backgroundColor = UIColor.red
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(text)
        view.addSubview(refreshButton)
        refreshButton.setTitle("refreshButton", for: .normal)
        let centerX = NSLayoutConstraint(item: refreshButton, attribute: .rightMargin, relatedBy: .equal, toItem: view, attribute: .rightMargin, multiplier: 1.0, constant: -10.0)
        let centerY = NSLayoutConstraint(item: refreshButton, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 55.0)
//        NSLayoutConstraint.activate([centerY, centerX])
         buttonAction ()
        let textFieldX = NSLayoutConstraint(item: text, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let textFieldY = NSLayoutConstraint(item: text, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        let textFieldWidth = NSLayoutConstraint(item: text, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 30.0)
//        let textFieldTrailing = NSLayoutConstraint(item: text, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 20.0)
//        let textFieldWidth = NSLayoutConstraint(item: text, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 20.0)
        NSLayoutConstraint.activate([centerX, centerY, textFieldX, textFieldY, textFieldWidth])
        refreshButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
       
        
    }
    
//    @objc func refreshAction() {
//        buttonAction()
//    }
    @objc func action(){
      //  button.backgroundColor = UIColor.lightGray

        button.setTitle("Saved", for: .normal)
        button.alpha = 0.5
        button.isEnabled = false
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool{
        let text = textField.text ?? ""
//        guard let text = textField.text else {
//            button.isEnabled = true
//            button.addTarget(self, action: #selector(action), for: .touchUpInside)
//            return true
//        }
        
        let newLen = text.count + string.count - range.length
        if newLen > 0 {
            button.isEnabled = true
            button.alpha = 1
            button.addTarget(self, action: #selector(action), for: .touchUpInside)
        } else {
            button.isEnabled = false
            button.alpha = 0.5
        }
        return true
    }
    
   @objc func buttonAction () {
        button.backgroundColor = UIColor.red
        button.translatesAutoresizingMaskIntoConstraints = false
        text.text = ""
        view.addSubview(button)
        button.setTitle("Save", for: .normal)
        let centerX = NSLayoutConstraint(item: button, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let centerY = NSLayoutConstraint(item: button, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -50.0)
        NSLayoutConstraint.activate([centerY, centerX])
        button.alpha = 0.5
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        text.resignFirstResponder()
    }
}
