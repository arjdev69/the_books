//
//  DropdownView.swift
//  TheBooks
//
//  Created by ArjMaster on 11/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

@IBDesignable
class DropdownView: XibView, UIPickerViewDelegate, UIPickerViewDataSource {
 
    @IBOutlet private weak var ViewBox: UIView!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    var dataList: [String] = []
    var selected:String = ""
        
    override func setupView() {
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.dataList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selected = dataList[row]
    }
    
}
