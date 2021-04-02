//
//  UserRepository.swift
//  TheBooks
//
//  Created by ArjMaster on 01/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class UserRepository: NSObject {
    
    func authUserService(_ user:Dictionary<String, Any>, completion:@escaping(_ auth:Bool, _ data:Any) -> Void){
        UserApi().authUserService(user) { (auth, data) in
            completion(auth, data)
        }
    }
    
    func addUserService(_ user:Dictionary<String, Any>, completion:@escaping(_ add:Bool, _ data:Any) -> Void){
        UserApi().addUserService(user) { (add, data) in
            completion(add, data)
        }
    }
}
