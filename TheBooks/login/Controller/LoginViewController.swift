//
//  ViewController.swift
//  TheBooks
//
//  Created by ArjMaster on 30/03/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var Header: UIView!
    @IBOutlet weak var Email: UIView!
    @IBOutlet weak var Password: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        Utils().roundCorners(with: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 60, view: self.Header)
        
        Email.layer.borderWidth = 2;
        Email.layer.borderColor = #colorLiteral(red: 0.7882352941, green: 0.7882352941, blue: 0.8039215686, alpha: 1);
        Email.layer.cornerRadius = 25
        
        Password.layer.borderWidth = 2;
        Password.layer.borderColor = #colorLiteral(red: 0.7882352941, green: 0.7882352941, blue: 0.8039215686, alpha: 1);
        Password.layer.cornerRadius = 25
    }
}

