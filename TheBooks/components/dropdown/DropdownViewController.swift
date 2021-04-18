//
//  DropdownViewController.swift
//  TheBooks
//
//  Created by ArjMaster on 17/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class DropdownViewController: UIViewController {
    
    @IBOutlet weak var dropView: DropdownView!
    
    @IBOutlet weak var btnClose: UIButton!

    
    var listData:[String] = []
    var selectedItem:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dropView.dataList = listData
    }
    
    func getItem(_ item: String) -> Any {
        return selectedItem
    }
    
    @IBAction func btnClose(_ sender: Any) {
       // DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
        self.navigationController?.popViewController(animated: true)
       // }
    }
    
}
