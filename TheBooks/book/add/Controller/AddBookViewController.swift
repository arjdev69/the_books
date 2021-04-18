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
    
    @IBOutlet weak var btnGenre: UIButton!
    @IBOutlet weak var btnSaveBook: UIButton!
    @IBOutlet weak var exitBtnBook: UIButton!
    @IBOutlet weak var btnStatus: UIButton!
    
    
    var pickerView = UIPickerView();
    
    
    var list = ["DFFDF", "FSDF", "DSFFDF"]
    
    
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
        pickerView.backgroundColor = UIColor.orange
        pickerView.setValue(UIColor.black, forKey: "textColor")
        pickerView.autoresizingMask = .flexibleWidth
        pickerView.contentMode = .center
        pickerView.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 300)
        self.view.addSubview(pickerView)
    }
    
    @IBAction func saveBook(_ sender: UIButton) {
        
    }
    
}


extension AddBookViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row].capitalized
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        btnGenre.setTitle(list[row], for: .normal)
        pickerView.removeFromSuperview()
    }
}
