//
//  BooksHomeExtension.swift
//  TheBooks
//
//  Created by ArjMaster on 19/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

extension HomeBookViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    //MARK: Layout
    func setupLayout(){
        self.SearchBarView.layer.cornerRadius = 15
        self.SearchField.setImage(UIImage(named: "searchImg"), for: .search, state: .normal)
        self.BoxBtn.layer.cornerRadius = 45
        self.addPlusBook.layer.cornerRadius = self.addPlusBook.bounds.width/2
        collectionBooks.dataSource = self
        collectionBooks.delegate = self
    }
    
    func setupCollectionView(){
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0)
        layout.itemSize = CGSize(width: screenWidth/3, height: screenWidth/2)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 1.5
        collectionBooks!.collectionViewLayout = layout
    }
    
    func getBooksList(){
        BooksApi().getAllBooksService { (books) in
            self.books = books.all
            
            self.reading = self.books.filter({ return $0.status == "Lendo"})
            self.done = self.books.filter({ return $0.status == "Já Lidos" })
            self.forRead = self.books.filter({ return $0.status == "Para Ler" })
            
            self.collectionBooks.reloadData()
        }
    }
    
    //MARK: SETUP-VIEW
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return reading.count
        } else if section == 1 {
            return forRead.count
        } else {
            return done.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BookCollectionViewCell;
        
        if indexPath.section == 0 {
            cell.setupCellCollection(book: reading[indexPath.item])
        }else if indexPath.section == 1 {
            cell.setupCellCollection(book: forRead[indexPath.item])
        } else {
            cell.setupCellCollection(book: done[indexPath.item])
        }
        

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenWidth/3-11, height: screenWidth/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "editBook") as! EditBookViewController
        
        controller.bookID = books[indexPath.item].book_id
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
      //  if (kind == UICollectionView.elementKindSectionHeader) {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionHeader", for: indexPath)
            // Customize headerView here
            
            headerView.largeContentTitle = "TITTITITITITITI"
            
            return headerView
    //    }
    //    fatalError()
    }
    
}
