//
//  BooksModel.swift
//  TheBooks
//
//  Created by ArjMaster on 18/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class BooksModel: NSObject {
    
    struct Books: Codable {
        var title:String?
        var author_name:String?
        var genre:String?
        var status:String?
        var book_id:String?
        var reading_start_date:String?
        var reading_done:BooleanLiteralType?
        var reading_end_date:String?
    }
}
