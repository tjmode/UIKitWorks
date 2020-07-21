//
//  ViewController.swift
//  instagram
//
//  Created by Tonywilson Jesuraj on 21/07/20.
//  Copyright © 2020 Tonywilson Jesuraj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var yourLabel: UILabel!
    
    @IBOutlet var yourButton: UIButton!
    
    @IBOutlet var yourTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        yourLabel.changeColor(For: "Hello sneha", into: UIColor.red, from: 7, to: 3)
        yourTextView.textViewChangeColor(For: "Hello sneha", into: UIColor.red, from: 7, to: 3)
        yourButton.buttonTextChangeColor(For: "Hello sneha", into: UIColor.green, from: 7, to: 3)
        
    }


}

extension UILabel {
    func changeColor(For givenText: NSString,into color: UIColor, from locationNumber: Int, to length: Int){
    let myString:NSString = givenText
    var myMutableString = NSMutableAttributedString()
    myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)!])
    myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: NSRange(location: locationNumber,length: length))
    // set label Attribute
        self.attributedText = myMutableString
    }
}

extension UITextView {
    func textViewChangeColor(For givenText: NSString,into color: UIColor, from locationNumber: Int, to length: Int){
        let myString:NSString = givenText
        var myMutableString = NSMutableAttributedString()
        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 18.0)!])
        
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: NSRange(location: locationNumber,length: length))
        // set label Attribute
        self.attributedText = myMutableString
    }
}

extension UIButton {
    func buttonTextChangeColor(For givenText: NSString,into color: UIColor, from locationNumber: Int, to length: Int) {
        let myMutableString = NSMutableAttributedString(string: givenText as String);
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: NSRange(location: locationNumber,length: length))
        self.setAttributedTitle(myMutableString, for: .normal)
        
    }
    
}

