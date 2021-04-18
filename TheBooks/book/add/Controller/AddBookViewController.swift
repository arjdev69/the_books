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
    
    //MARK: - Outlets
    @IBOutlet weak var Header: UIView!
    @IBOutlet weak var titleBookInput: UITextField!
    @IBOutlet weak var nameAuthorBook: UITextField!
    @IBOutlet weak var btnGenre: UIButton!
    @IBOutlet weak var btnSaveBook: UIButton!
    @IBOutlet weak var exitBtnBook: UIButton!
    @IBOutlet weak var btnStatus: UIButton!
    
    //MARK: Objects Layout
    var pickerView = UIPickerView();
    
    //MARK: Attributes
    var combo = list()
    var genre = ["Romance", "Fábula", "Conto", "Crônica", "Ensaio", "Poesia", "Autobiografia", "Horror", "Literatura", "Fantasia", "Ficção Científica", "Folhetim"]
    var status = ["Já Lidos", "Para Ler", "Lendo"]
    
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

    //MARK: SUPPORT-FUNCS
    func mountJsonServer() -> Dictionary<String, Any>  {
        guard let titleBook = titleBookInput.text else {return [:]}
        guard let nameAuthor = nameAuthorBook.text else {return [:]}
        guard let genreFieldValue = btnGenre.titleLabel?.text else {return [:]}
        guard let statusFieldValue = btnStatus.titleLabel?.text else {return [:]}
        
       let dic:Dictionary<String, Any> = [
            "title": titleBook,
            "author_name": nameAuthor,
            "genre": genreFieldValue,
            "status": statusFieldValue,
            "reading_start_date": "21/12/2020",
            "reading_end_date": "12/10/2021",
            "reading_done":false
        ]
                
        return dic
    }
    
    func validationForm(json: Dictionary<String, Any>) -> Bool{
        var msg = ""
        guard let titleBook = json["title"] as? String else {return false}
        guard let nameAuthor = json["author_name"] as? String else {return false}
        guard let genreFieldValue = json["genre"] as? String else {return false}
        guard let statusFieldValue = json["status"] as? String else {return false}
        
        if titleBook.isEmpty {
            msg = "Campo titulo não pode ficar vazio."
        }else if nameAuthor.isEmpty {
            msg = "Campo nome não pode ficar vazio."
        }else if genreFieldValue.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            msg = "Campo gênero não pode ficar vazio."
        }else if statusFieldValue.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            msg = "Campo status não pode ficar vazio."
        }
                
        if !msg.isEmpty {
            AlertControl(controller: self).basic(titulo: "Erro ao efetuar cadastro", mensagem: "\(msg)", label: "Fechar", action: .destructive, type: .alert)
            return false
        }
        
        return true
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
        let json = mountJsonServer()
        if validationForm(json: json){
            //self.Loading.startAnimating()
            
            BooksRepository().addBooksService(json) { (add, data) in
                if add {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        //self.Loading.stopAnimating()
                        self.navigationController?.popViewController(animated: false)
                    }
                } else {
                    AlertControl(controller: self).basic(titulo: "Erro ao efetuar cadastro", mensagem: "Verifique seus dados e tente novamente.", label: "Fechar", action: .destructive, type: .alert)
                }
            }
        }
    }
    
}
