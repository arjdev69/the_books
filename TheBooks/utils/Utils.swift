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
    
    func setColorBorderView(view: UIView, border: Int, radius: Int, _ color: CGColor = #colorLiteral(red: 0.7882352941, green: 0.7882352941, blue: 0.8039215686, alpha: 1)){
        view.layer.borderWidth = CGFloat(border);
        view.layer.borderColor = color;
        view.layer.cornerRadius = CGFloat(radius);
        view.layer.masksToBounds = true
    }
    
    func openPickerView(pickerView: UIPickerView, height: CGFloat) -> UIPickerView{
        pickerView.backgroundColor = UIColor.orange
        pickerView.setValue(UIColor.white, forKey: "textColor")
        pickerView.autoresizingMask = .flexibleWidth
        pickerView.contentMode = .center
        pickerView.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - height, width: UIScreen.main.bounds.size.width, height: height)
        pickerView.reloadAllComponents()

        return pickerView
    }
    
    
    
    //MARK: - API
    func generateJsonString(data: Data) -> String {
        let jsonObject = SetupService().generateJsonObject(object: data)
        let jsonData = SetupService().generateJsonData(object: jsonObject)
        let jsonString = SetupService().generateJsonString(data: jsonData)
        
        return jsonString
    }
}
