//
//  HomeBookViewController.swift
//  TheBooks
//
//  Created by ArjMaster on 01/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class HomeBookViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var Header: UIView!
    @IBOutlet weak var SearchBarView: UIView!
    @IBOutlet weak var BoxBtn: UIView!
    
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var SearchField: UISearchBar!
    @IBOutlet weak var collectionBooks: UICollectionView!
    @IBOutlet weak var addPlusBook: UIButton!
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    var books:Array<BooksHome> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupCollectionView()
        getBooksList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getBooksList()
    }
    
    //MARK: Funcs Actions
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addPlusBook(_ sender: UIButton) {
    }
}
