//
//  ForgetPasswordViewController.swift
//  TheBooks
//
//  Created by ArjMaster on 31/03/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var Header: UIView!
    @IBOutlet weak var Email: UIView!
    @IBOutlet weak var btnSendEmail: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utils().roundCorners(with: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 70, view: self.Header)
        Utils().setColorBorderView(view: self.Email, border: 1, radius: 30)
        self.btnSendEmail.layer.cornerRadius = 30
    }

    @IBAction func btnGoBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
