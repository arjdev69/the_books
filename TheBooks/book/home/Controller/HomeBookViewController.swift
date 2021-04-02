//
//  HomeBookViewController.swift
//  TheBooks
//
//  Created by ArjMaster on 01/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class HomeBookViewController: UIViewController {
    
    
    @IBOutlet weak var Header: UIView!
    @IBOutlet weak var SearchBarView: UIView!
    
    @IBOutlet weak var SearchField: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }
    
    //MARK: FUNC-SETUP
    func setupLayout(){
        self.SearchBarView.layer.cornerRadius = 15
        self.SearchField.setImage(UIImage(named: "searchImg"), for: .search, state: .normal)
    }
    
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
