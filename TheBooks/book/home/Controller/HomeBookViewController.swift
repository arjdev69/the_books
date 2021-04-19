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
    
    //MARK: SETUP-VIEW
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BookCollectionViewCell;
        
        cell.setupCellCollection(book: books[indexPath.item])

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenWidth/3-11, height: screenWidth/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("click item")
    }
    
    //MARK: Funcs Actions
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addPlusBook(_ sender: UIButton) {
    }
}
