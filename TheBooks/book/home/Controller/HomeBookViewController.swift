//
//  HomeBookViewController.swift
//  TheBooks
//
//  Created by ArjMaster on 01/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class HomeBookViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var Header: UIView!
    @IBOutlet weak var SearchBarView: UIView!
    @IBOutlet weak var BoxBtn: UIView!
    
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var SearchField: UISearchBar!
    @IBOutlet weak var collectionBooks: UICollectionView!
    @IBOutlet weak var addPlusBook: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLayout()
    }
    
    //MARK: FUNC-SETUP
    func setupLayout(){
        self.SearchBarView.layer.cornerRadius = 15
        self.SearchField.setImage(UIImage(named: "searchImg"), for: .search, state: .normal)
        self.BoxBtn.layer.cornerRadius = 45
        self.addPlusBook.layer.cornerRadius = 35
        collectionBooks.dataSource = self
        collectionBooks.delegate = self
    }
    
    //MARK: SETUP-VIEW
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BookCollectionViewCell;
        return celulaPacote
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 25)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addPlusBook(_ sender: UIButton) {
        print("1454545")
    }
}
