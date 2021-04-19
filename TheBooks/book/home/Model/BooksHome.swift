//
//  BooksHome.swift
//  TheBooks
//
//  Created by ArjMaster on 18/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

struct BooksHome:Decodable {
    let author_name:String;
    let book_id:String;
    let genre:String;
    let status:String;
    let title:String;
    
    enum CodingKeys: String, CodingKey {
        case author_name
        case book_id
        case genre
        case status
        case title
    }
}

struct BooksList: Decodable {
    let all: [BooksHome]
    
    enum CodingKeys: String, CodingKey {
        case all = "items"
    }
}


