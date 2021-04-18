//
//  BookPickerExtension.swift
//  TheBooks
//
//  Created by ArjMaster on 18/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

extension AddBookViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
            btnGenre.setTitle(combo.list[row], for: .normal)
        } else {
            btnStatus.setTitle(combo.list[row], for: .normal)
        }
        
        pickerView.removeFromSuperview()
    }
}
