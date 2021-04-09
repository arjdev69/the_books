//
//  AddBookViewController.swift
//  TheBooks
//
//  Created by ArjMaster on 08/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class AddBookViewController: UIViewController {

    @IBOutlet weak var Header: UIView!
    
    @IBOutlet weak var titleBookInput: UITextField!
    @IBOutlet weak var nameAuthorBook: UITextField!

    @IBOutlet weak var btnSaveBook: UIButton!
    @IBOutlet weak var exitBtnBook: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }
    
    //MARK: Func Setup
    func setupLayout(){
        Utils().roundCorners(with: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 35, view: self.Header)
        
        Utils().setColorBorderView(view: self.titleBookInput, border: 1, radius: 25)
        Utils().setColorBorderView(view: self.nameAuthorBook, border: 1, radius: 25)

        Utils().setColorBorderView(view: self.btnSaveBook, border: 0, radius: 23)
        Utils().setColorBorderView(view: self.exitBtnBook, border: 1, radius: 23, #colorLiteral(red: 0.9788214564, green: 0.5642826557, blue: 0.3197808564, alpha: 1))


    }
    
}
