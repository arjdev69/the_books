//
//  EditBookViewController.swift
//  TheBooks
//
//  Created by ArjMaster on 11/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class EditBookViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var Header: UIView!
    @IBOutlet weak var titleBook: UILabel!
    
    @IBOutlet weak var FieldsFormView: UIView!
    @IBOutlet weak var titleFieldForm: UITextField!
    @IBOutlet weak var authorFieldForm: UITextField!
    @IBOutlet weak var genreFieldForm: UIButton!
    @IBOutlet weak var statusFieldForm: UIButton!
    
    //MARK: Objects Layout
    var pickerView = UIPickerView();
    
    //MARK: Parameters
    var bookID:String?;
    var book:BooksHome?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        self.setupLayout()
        self.getBook()
    }
    
    //MARK: SETUP LAYOUT
    func setupLayout(){
        Utils().roundCorners(with: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 35, view: self.Header)
        
        Utils().setColorBorderView(view: self.FieldsFormView, border: 1, radius: 14)
    }
    
    //MARK: FUNCS SUPPORT
    func setTextFieldForm(){
        self.titleBook.text = book?.title.uppercased()
        self.titleFieldForm.text = book?.title
        self.authorFieldForm.text = book?.author_name
        self.genreFieldForm.setTitle(book?.genre, for: .normal)
        self.statusFieldForm.setTitle(book?.status, for: .normal)
    }
    
    //MARK: Requests
    func getBook(){
        BooksRepository().getBookById(id: bookID ?? "") { (book) in
            self.book = book
            self.setTextFieldForm()
        }
    }
    
    //MARK: Actions
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
