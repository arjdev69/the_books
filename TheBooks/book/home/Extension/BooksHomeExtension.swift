//
//  BooksHomeExtension.swift
//  TheBooks
//
//  Created by ArjMaster on 19/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

extension HomeBookViewController {
    
    //MARK: Layout
    func setupLayout(){
        self.SearchBarView.layer.cornerRadius = 15
        self.SearchField.setImage(UIImage(named: "searchImg"), for: .search, state: .normal)
        self.BoxBtn.layer.cornerRadius = 45
        self.addPlusBook.layer.cornerRadius = 35
        collectionBooks.dataSource = self
        collectionBooks.delegate = self
    }
    
    func setupCollectionView(){
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/2)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 1.5
        collectionBooks!.collectionViewLayout = layout
    }
    
    func getBooksList(){
        BooksApi().getAllBooksService { (books) in
            self.books = books.all
            self.collectionBooks.reloadData()
        }
    }
    
}
