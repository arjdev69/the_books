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
    @IBOutlet weak var TextFieldEmail: UITextField!
    @IBOutlet weak var TextFieldPassword: UITextField!
    @IBOutlet weak var Scroll: UIScrollView!
    

    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }
    
    //MARK: Func Setup
    
    func setupLayout(){
        NotificationCenter.default.addObserver(self, selector: #selector(updateHeightScroll(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateHeightScrollMine(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        Utils().roundCorners(with: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner], radius: 70, view: self.Header)
        
        self.Email.layer.borderWidth = 2;
        self.Email.layer.borderColor = #colorLiteral(red: 0.7882352941, green: 0.7882352941, blue: 0.8039215686, alpha: 1);
        self.Email.layer.cornerRadius = 30
        
        self.Password.layer.borderWidth = 2;
        self.Password.layer.borderColor = #colorLiteral(red: 0.7882352941, green: 0.7882352941, blue: 0.8039215686, alpha: 1);
        self.Password.layer.cornerRadius = 30
        
        self.Scroll.showsHorizontalScrollIndicator = false
        self.Scroll.showsVerticalScrollIndicator = false
        
        self.btnLogin.layer.cornerRadius = 30
        
    }
    
    @objc func updateHeightScroll(notification:Notification){
        self.Scroll.contentSize = CGSize(width: self.Scroll.frame.width, height: self.Scroll.frame.height + 280)
    }
    
    @objc func updateHeightScrollMine(notification:Notification){
        self.Scroll.contentSize = CGSize(width: self.Scroll.frame.width, height: self.Scroll.frame.height - 280)
    }
    
    // MARK: - support funcs
    func mountJsonServer() -> Dictionary<String, Any> {
        guard let email = TextFieldEmail.text else { return [:] }
        guard let password = TextFieldPassword.text else { return [:] }
        
        let dic:Dictionary<String, Any> = [
            "email" : email,
            "password_hash": password,
        ]
        
        return dic
    }
    
    
    //MARK: Actions
    @IBAction func ForgetPassword(_ sender: Any) {
    
    }
    
    
    @IBAction func Login(_ sender: Any) {
        let json = mountJsonServer()
        UserRepository().addUserService(json) { (add, data) in
            guard let dataServer = data as? Login.Users else {return}
            if dataServer.email.isEmpty || dataServer.password_hash.isEmpty {
                AlertControl(controller: self).basic(titulo: "Erro no formulário", mensagem: "Campos não pôdem ficarem vazios.", label: "Fechar", action: .destructive, type: .alert)
            }
        }
    }
    
    @IBAction func Register(_ sender: Any) {
    }
}

