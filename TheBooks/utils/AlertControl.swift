//
//  AlertControl.swift
//  TheBooks
//
//  Created by ArjMaster on 01/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class AlertControl {
    
    
    let controller: UIViewController
    
    init(controller: UIViewController){
        self.controller = controller
    }
    
    func basic(titulo: String = "Alerta", mensagem: String, label: String, action: UIAlertAction.Style, type: UIAlertController.Style){
        let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: type)
        let ok = UIAlertAction(title: label, style: action, handler: nil)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }

}
