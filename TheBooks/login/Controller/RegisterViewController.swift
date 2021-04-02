//
//  RegisterViewController.swift
//  TheBooks
//
//  Created by ArjMaster on 31/03/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var Header: UIView!
    @IBOutlet weak var Name: UIView!
    @IBOutlet weak var Email: UIView!
    @IBOutlet weak var Password: UIView!
    @IBOutlet weak var RepeatPassword: UIView!
    
    @IBOutlet weak var Loading: UIActivityIndicatorView!
    @IBOutlet weak var TextFieldName: UITextField!
    @IBOutlet weak var TextFiedlEmail: UITextField!
    @IBOutlet weak var TextFieldPassword: UITextField!
    @IBOutlet weak var TextFieldRepeatPassword: UITextField!
    @IBOutlet weak var RegisterUser: UIButton!
    @IBOutlet weak var Scroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }
    
    //MARK: - LAYOUT
    func setupLayout(){
        NotificationCenter.default.addObserver(self, selector: #selector(updateHeightScroll(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateHeightScrollMine(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        Utils().roundCorners(with: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 70, view: self.Header)
        Utils().setColorBorderView(view: self.Name, border: 1, radius: 20)
        Utils().setColorBorderView(view: self.Email, border: 1, radius: 20)
        Utils().setColorBorderView(view: self.Password, border: 1, radius: 20)
        Utils().setColorBorderView(view: self.RepeatPassword, border: 1, radius: 20)
        
        self.Scroll.showsHorizontalScrollIndicator = false
        self.Scroll.showsVerticalScrollIndicator = false
        
        self.RegisterUser.layer.cornerRadius = 20
        
    }
    
    @objc func updateHeightScroll(notification:Notification){
        self.Scroll.contentSize = CGSize(width: self.Scroll.frame.width, height: self.Scroll.frame.height + 280)
    }
    
    @objc func updateHeightScrollMine(notification:Notification){
        self.Scroll.contentSize = CGSize(width: self.Scroll.frame.width, height: self.Scroll.frame.height - 280)
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: SUPPORT-FUNCS
    func mountJsonServer() -> Dictionary<String, Any>  {
        guard let name = TextFieldName.text else {return [:]}
        guard let email = TextFiedlEmail.text else {return [:]}
        guard let password = TextFieldPassword.text else {return [:]}
        guard let repeatPassword = TextFieldRepeatPassword.text else {return [:]}
        
        let dic:Dictionary<String, Any> = [
            "full_name": name,
            "email": email,
            "password_hash": password,
            "repeat_password": repeatPassword
        ]
        
        return dic
    }
    
    func validationForm(json: Dictionary<String, Any>) -> Bool{
        var msg = ""
        guard let name = json["full_name"] as? String else {return false}
        guard let email = json["email"] as? String else {return false}
        guard let password = json["password_hash"] as? String else {return false}
        guard let repeat_password = json["repeat_password"] as? String else {return false}
        
        if name.isEmpty {
            msg = "Campo nome não pode ficar vazio."
        }else if email.isEmpty {
            msg = "Campo email não pode ficar vazio."
        }else if password.isEmpty {
            msg = "Campo Senha não pode ficar vazio."
        }else if repeat_password.isEmpty {
            msg = "Campo Confirma Senha não pode ficar vazio."
        }
        
        if password != repeat_password {
            msg = "Por favor insira a mesma senha."
        }
        
        if !msg.isEmpty {
            AlertControl(controller: self).basic(titulo: "Erro ao efetuar cadastro", mensagem: "\(msg)", label: "Fechar", action: .destructive, type: .alert)
            return false
        }
        
        return true
    }
    
    //MARK: - ACTIONS
    @IBAction func RegisterUser(_ sender: UIButton) {
        let json = mountJsonServer()
        if validationForm(json: json){
            self.Loading.startAnimating()
            
            UserRepository().addUserService(json) { (add, data) in
                if add {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        self.Loading.stopAnimating()
                        self.navigationController?.popViewController(animated: false)
                    }
                } else {
                    AlertControl(controller: self).basic(titulo: "Erro ao efetuar cadastro", mensagem: "Verifique seus dados e tente novamente.", label: "Fechar", action: .destructive, type: .alert)
                }
            }
        }
    }
}
