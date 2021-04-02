//
//  User.swift
//  TheBooks
//
//  Created by ArjMaster on 01/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class Login: NSObject {

    struct Users: Codable {
        var password_hash:String
        var email:String
        var user_id:String
    }
}
