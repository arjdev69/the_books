//
//  BookCollectionViewCell.swift
//  TheBooks
//
//  Created by ArjMaster on 02/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var titleBook: UILabel!
    @IBOutlet weak var authorName: UILabel!
    
    
    func setupCellCollection(book:BooksHome){
        self.titleBook.text = book.title
        self.authorName.text = book.author_name
    }
    
}
