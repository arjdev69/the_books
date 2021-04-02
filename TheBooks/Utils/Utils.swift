//
//  RoundRadius.swift
//  TheBooks
//
//  Created by ArjMaster on 31/03/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

public class Utils: NSObject {
    
    public override init() {}
    
    // MARK: - LAYOUT
    func roundCorners(with CACornerMask: CACornerMask, radius: CGFloat, view: UIView) {
        view.layer.cornerRadius = radius
        view.layer.maskedCorners = [CACornerMask]
    }
    
    func roundedCorners(corners : UIRectCorner, radius : CGFloat, view: UIView) {
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        view.layer.mask = mask
        view.layer.masksToBounds = true
    }
    
    func generateJsonString(data: Data) -> String {
        let jsonObject = SetupService().generateJsonObject(object: data)
        let jsonData = SetupService().generateJsonData(object: jsonObject)
        let jsonString = SetupService().generateJsonString(data: jsonData)
        
        return jsonString
    }
}
