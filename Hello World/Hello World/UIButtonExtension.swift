//
//  UIButtonExtension.swift
//  Hello World
//
//  Created by Doug Rowley on 7/2/19.
//  Copyright © 2019 Doug Rowley. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func flyAway() {
        let fly = CABasicAnimation(keyPath: "position")
        fly.duration = 2.0 
        
        let fromPoint = CGPoint(x: center.x, y: center.y)
        let fromValue = NSValue(cgPoint: fromPoint)
        
        let toPoint = CGPoint(x: center.x, y: center.y +
            800)
        let toValue = NSValue(cgPoint: toPoint)
        
        fly.fromValue = fromValue
        fly.toValue = toValue
        layer.add(fly, forKey: "position")
        
    }
    
    
}
