//
//  AddBookViewController.swift
//  TheBooks
//
//  Created by ArjMaster on 08/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

struct list {
    var type = "genre"
    var list = [""]
}

class AddBookViewController: UIViewController {
    
    @IBOutlet weak var Header: UIView!
    
    @IBOutlet weak var titleBookInput: UITextField!
    @IBOutlet weak var nameAuthorBook: UITextField!
    
    @IBOutlet weak var btnGenre: UIButton!
    @IBOutlet weak var btnSaveBook: UIButton!
    @IBOutlet weak var exitBtnBook: UIButton!
    @IBOutlet weak var btnStatus: UIButton!
    
    
    var pickerView = UIPickerView();
    
    var genre = ["Romance", "Fábula", "Conto", "Crônica", "Ensaio", "Poesia", "Autobiografia", "Horror", "Literatura", "Fantasia", "Ficção Científica", "Folhetim"]
    var status = ["Lido", "Para Ler", "Não Lido"]
    
    var combo = list()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    
    //MARK: Func Setup
    func setupLayout(){
        Utils().roundCorners(with: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 35, view: self.Header)
        
        Utils().setColorBorderView(view: self.titleBookInput, border: 1, radius: 25)
        Utils().setColorBorderView(view: self.nameAuthorBook, border: 1, radius: 25)
        Utils().setColorBorderView(view: self.btnGenre, border: 1, radius: 25)
        Utils().setColorBorderView(view: self.btnStatus, border: 1, radius: 25)
        
        
        Utils().setColorBorderView(view: self.btnSaveBook, border: 0, radius: 23)
        Utils().setColorBorderView(view: self.exitBtnBook, border: 1, radius: 23, #colorLiteral(red: 0.9788214564, green: 0.5642826557, blue: 0.3197808564, alpha: 1))
        
    }
    
    func getStoryboard(name: String) -> DropdownViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: name) as! DropdownViewController
        
        return controller;
    }
    
    //MARK: ACTIONS
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnGenreAction(_ sender: Any) {
        combo.type = "genre"
        combo.list = genre
        let pickerView = Utils().openPickerView(pickerView: self.pickerView, height: CGFloat(150))
        self.view.addSubview(pickerView)
    }
    
    @IBAction func btnStatusAction(_ sender: Any) {
        combo.type = "status"
        combo.list = status
        let pickerView = Utils().openPickerView(pickerView: self.pickerView, height: CGFloat(150))
        self.view.addSubview(pickerView)
    }
    
    @IBAction func saveBook(_ sender: UIButton) {
        
    }
    
}
