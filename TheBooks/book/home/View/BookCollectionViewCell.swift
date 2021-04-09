//
//  BookCollectionViewCell.swift
//  TheBooks
//
//  Created by ArjMaster on 02/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class BookCollectionViewCell: UICollectionViewCell {
    
    func setupCellCollection(){
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 1).cgColor
        layer.cornerRadius = 8
    }
    
}
