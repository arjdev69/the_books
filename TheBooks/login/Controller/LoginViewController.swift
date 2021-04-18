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
    @IBOutlet weak var Loading: UIActivityIndicatorView!
    
    
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
        Utils().setColorBorderView(view: self.Email, border: 1, radius: 30)
        Utils().setColorBorderView(view: self.Password, border: 1, radius: 30)
        
        self.Scroll.showsHorizontalScrollIndicator = false
        self.Scroll.showsVerticalScrollIndicator = false
        
        self.btnLogin.layer.cornerRadius = 30
        
    }
    
    @objc func updateHeightScroll(notification:Notification){
        self.Scroll.contentSize = CGSize(width: self.Scroll.frame.width, height: self.Scroll.frame.height + 200)
    }
    
    @objc func updateHeightScrollMine(notification:Notification){
        self.Scroll.contentSize = CGSize(width: self.Scroll.frame.width, height: self.Scroll.frame.height - 200)
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
    
    func validationForm(data: Dictionary<String, Any>) -> Bool{
        var msg = ""
        guard let emailUser = data["email"] as? String else {return false}
        guard let passwordUser = data["password_hash"] as? String else {return false}
        
        if emailUser.isEmpty{
            msg = "Campo email não preenchido."
        }else if passwordUser.isEmpty{
            msg = "Campo Senha não preenchido."
        }
        
        if !msg.isEmpty{
            AlertControl(controller: self).basic(titulo: "Formulário", mensagem: "\(msg).", label: "Fechar", action: .destructive, type: .alert)
            return false
        }
        
        return true
    }
    
    
    //MARK: Actions
    @IBAction func ForgetPassword(_ sender: Any) {}
    
    @IBAction func Login(_ sender: Any) {
        let json = mountJsonServer()
        if validationForm(data: json){
            self.Loading.startAnimating()
            UserRepository().authUserService(json) { (add, data) in
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    self.Loading.stopAnimating()
                }
                guard data is Login.Users else {
                    AlertControl(controller: self).basic(titulo: "LOGIN", mensagem: "Erro ao efetuar login: \(data).", label: "Fechar", action: .destructive, type: .alert)
                    return
                }
                
                let HomeBook = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HomeBook") as? HomeBookViewController
                self.navigationController?.pushViewController(HomeBook ?? self, animated: true)
                
            }
        }
        
    }
}

