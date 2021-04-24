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
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        1
    }
    

}
