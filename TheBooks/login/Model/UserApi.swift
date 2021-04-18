//
//  UserApi.swift
//  TheBooks
//
//  Created by ArjMaster on 01/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

import Alamofire

class UserApi: NSObject {
    
    // MARK: - attributes
    lazy var urlService:String = {
        guard let url = Api().getUrlService() else { return "" }
        
        return url
    }()
    
    //MARK: - POST
    func authUserService(_ params:Dictionary<String, Any>, completion:@escaping(_ add:Bool, _ data:Any) -> Void) {
        guard let url = URL(string: urlService + "security/authenticate") else {return}
        
        AF.request(url, method: .post, parameters: params,encoding: JSONEncoding.default).responseJSON {
            AFdata in
            switch AFdata.result{
            case .success:
                let jsonString = Utils().generateJsonString(data: AFdata.data!)
                let user = try! JSONDecoder().decode(Login.Users.self, from: jsonString.data(using: .utf8)!)
                completion(true, user)
                break
            case .failure( _):
                completion(false, "User Not Found")
                break
            }
        }
    }
    
    func addUserService(_ params:Dictionary<String, Any>, completion:@escaping(_ add:Bool, _ data:Any) -> Void){
        guard let url = URL(string: urlService + "user") else {return}
        
        AF.request(url, method: .post, parameters: params,encoding: JSONEncoding.default).responseJSON {
            AFdata in
            switch AFdata.result{
            case .success:
                let jsonString = Utils().generateJsonString(data: AFdata.data!)
                let user = try! JSONDecoder().decode(Login.Users.self, from: jsonString.data(using: .utf8)!)
                completion(true, user)
                break
            case .failure( _):
                completion(false, "Failed in register user")
                break
            }
        }
    }
}
