//
//  DropdownView.swift
//  TheBooks
//
//  Created by ArjMaster on 11/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

@IBDesignable
class DropdownView: XibView, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet private weak var ViewBox: UIView!
    
    @IBOutlet weak var dropdownViewComp: UITableView!
    
    override func setupView() {
        print("DFSGDHDHGD")
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "item.nome\(indexPath.row)"
        
        print("item.nome\(indexPath.row)")
        
        
        return cell
    }
    
}
