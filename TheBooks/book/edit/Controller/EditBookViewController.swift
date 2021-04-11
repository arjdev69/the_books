//
//  EditBookViewController.swift
//  TheBooks
//
//  Created by ArjMaster on 11/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class EditBookViewController: UIViewController {

    @IBOutlet weak var Header: UIView!
    @IBOutlet weak var titleBook: UILabel!
    
    @IBOutlet weak var FieldsFormView: UIView!
    @IBOutlet weak var titleFieldForm: UITextField!
    @IBOutlet weak var authorFieldForm: UITextField!
    @IBOutlet weak var genreFieldForm: UIButton!
    @IBOutlet weak var statusFieldForm: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupLayout()
        self.setTextFieldForm()
    }
    
    //MARK: SETUP LAYOUT
    func setupLayout(){
        Utils().roundCorners(with: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 35, view: self.Header)

        Utils().setColorBorderView(view: self.FieldsFormView, border: 1, radius: 14)
    }
    
    //MARK: FUNCS SUPPORT
    func setTextFieldForm(){
        self.titleBook.text = "Crépusculo".uppercased()
        self.titleFieldForm.text = "Crépusculo"
        self.authorFieldForm.text = "Silva, João."
        self.genreFieldForm.setTitle("Suspense, Romance.", for: .normal)
        self.statusFieldForm.setTitle("Lendo", for: .normal)
    }
}
