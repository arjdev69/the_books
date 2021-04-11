//
//  SetupService.swift
//  TheBooks
//
//  Created by ArjMaster on 01/04/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

public class SetupService: NSObject {
    
    //MARK: - API
    public func generateJsonData(object: Any) -> Data {
        let data = Data()
        
        guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: object, options: .prettyPrinted) else {
            print("Error: Cannot convert JSON object to Pretty JSON data")
            return data
        }
        
        return prettyJsonData
    }
    
    public func generateJsonObject(object: Data) -> [String: Any] {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: object, options: []) as? [String: Any] else {
            print("Error: Cannot convert data to JSON object")
            return [:]
        }
        
        return jsonObject;
    }
    
    public func generateJsonString(data: Data) -> String {
        guard let prettyPrintedJson = String(data: data, encoding: .utf8) else {
            print("Error: Could print JSON in String")
            return ""
        }
        
        return prettyPrintedJson
    }
}
