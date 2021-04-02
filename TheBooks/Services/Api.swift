//
//  Api.swift
//  TheBooks
//
//  Created by ArjMaster on 01/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class Api: NSObject {
    
    func getUrlService() -> String? {
        guard let pathPlist = Bundle.main.path(forResource: "Info", ofType: "plist") else {return nil}
        guard let dic = NSDictionary(contentsOfFile: pathPlist) else { return nil}
        guard let url = dic["urlService"] as? String else { return nil }
        
        return url
    }
}
