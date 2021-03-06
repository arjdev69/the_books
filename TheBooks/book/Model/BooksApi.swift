//
//  BooksApi.swift
//  TheBooks
//
//  Created by ArjMaster on 18/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

import Alamofire

class BooksApi: NSObject {
    
    // MARK: - attributes
    lazy var urlService:String = {
        guard let url = Api().getUrlService() else { return "" }
        
        return url
    }()
    
    
    func addBooksService(_ params:Dictionary<String, Any>, completion:@escaping(_ add:Bool, _ data:Any) -> Void){
        guard let url = URL(string: urlService + "book") else {return}
        
        AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON {
            AFdata in
            switch AFdata.result{
            case .success:
                let jsonString = Utils().generateJsonString(data: AFdata.data!)
                let book = try! JSONDecoder().decode(BooksModel.Books.self, from: jsonString.data(using: .utf8)!)
                completion(true, book)
                break
            case .failure( _):
                completion(false, "Failed register book")
                break
            }
        }
    }
    
    func editBookService(id:String, _ params:Dictionary<String, Any>, completion:@escaping(_ add:Bool, _ data:Any) -> Void){
        
        guard let url = URL(string: urlService + "book/\(id)") else {return}
        
        AF.request(url, method: .put, parameters: params, encoding: JSONEncoding.default).responseJSON {
            AFdata in
            switch AFdata.result{
            case .success:
                let jsonString = Utils().generateJsonString(data: AFdata.data!)
                let book = try! JSONDecoder().decode(BooksModel.Books.self, from: jsonString.data(using: .utf8)!)
                completion(true, book)
                break
            case .failure( _):
                completion(false, "Failed register book")
                break
            }
        }
        
    }
    
    func getAllBooksService(completion:@escaping(_ data:BooksList) -> Void){
        guard let url = URL(string: urlService + "books") else {return}
        
        let request = AF.request(url)

        request.responseDecodable(of: BooksList.self) { (response) in
          guard let books = response.value else { return }
            completion(books)
        }

    }
    
    func getBookById(id:String, completion:@escaping(_ data:BooksHome) -> Void){
        guard let url = URL(string: urlService + "book/\(id)") else {return}
        
        let request = AF.request(url)

        request.responseDecodable(of: BooksHome.self) { (response) in
          guard let book = response.value else { return }
            completion(book)
        }
    }
    
}
