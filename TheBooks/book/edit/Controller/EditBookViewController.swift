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
    var bookID:String = "";
    var book:BooksHome?;
    
    //MARK: Attributes
    var combo = list()
    var genre = ["Romance", "Fábula", "Conto", "Crônica", "Ensaio", "Poesia", "Autobiografia", "Horror", "Literatura", "Fantasia", "Ficção Científica", "Folhetim"]
    var status = ["Já Lidos", "Para Ler", "Lendo"]
    
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
    
    //MARK: SUPPORT-FUNCS
    func mountJsonServer() -> Dictionary<String, Any>  {
        guard let titleBook = titleFieldForm.text else {return [:]}
        guard let nameAuthor = authorFieldForm.text else {return [:]}
        guard let genreFieldValue = genreFieldForm.titleLabel?.text else {return [:]}
        guard let statusFieldValue = statusFieldForm.titleLabel?.text else {return [:]}
        
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
            msg = "Campo autor não pode ficar vazio."
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
    
    //MARK: Requests
    func getBook(){
        BooksRepository().getBookById(id: bookID) { (book) in
            self.book = book
            self.setTextFieldForm()
        }
    }
    
    //MARK: Actions
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveBook(_ sender: Any) {
        let json = mountJsonServer()
        if validationForm(json: json){
            BooksRepository().editBookService(id: bookID, json) { (edit, data) in
                if edit {
                    self.navigationController?.popViewController(animated: true)   
                }else {
                    AlertControl(controller: self).basic(mensagem: "Não foi possivel editar o book.", label: "Error ao editar o livro.", action: .default, type: .alert)
                }
            }
        }
    }
    
    @IBAction func genreBtn(_ sender: Any) {
        combo.type = "genre"
        combo.list = genre
        let pickerView = Utils().openPickerView(pickerView: self.pickerView, height: CGFloat(150))
        self.view.addSubview(pickerView)
    }
    
    @IBAction func statusBtn(_ sender: Any) {
        combo.type = "status"
        combo.list = status
        let pickerView = Utils().openPickerView(pickerView: self.pickerView, height: CGFloat(150))
        self.view.addSubview(pickerView)
    }
}
