//
//  BooksRepository.swift
//  TheBooks
//
//  Created by ArjMaster on 18/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class BooksRepository: NSObject {

    func addBooksService(_ books:Dictionary<String, Any>, completion:@escaping(_ add:Bool, _ data:Any) -> Void){
        BooksApi().addBooksService(books) { (add, data) in
            completion(add, data)
        }
    }
    
    func getAllBooksService(completion:@escaping(_ data:Any) -> Void){
        BooksApi().getAllBooksService { (data) in
            completion(data)
        }
    }
    
}
