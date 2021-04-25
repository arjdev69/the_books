//
//  EditBookExtension.swift
//  TheBooks
//
//  Created by ArjMaster on 19/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

extension EditBookViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return combo.list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return combo.list[row].capitalized
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if combo.type == "genre" {
            genreFieldForm.setTitle(combo.list[row], for: .normal)
        } else {
            statusFieldForm.setTitle(combo.list[row], for: .normal)
        }
        
        pickerView.removeFromSuperview()
    }
    

}
