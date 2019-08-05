//
//  HangmanDrawing.swift
//  Hello World
//
//  Created by Doug Rowley on 6/26/19.
//  Copyright © 2019 Doug Rowley. All rights reserved.
//

import UIKit

enum Shape {
    case noose
    case head
    case body
    case oneLeg
    case twoLegs
    case oneArm
    case twoArms
    case oneEye
    case twoEyes
    case frown
}

extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
}



class HangmanDrawing: UIView {

    var currentShape: Shape?
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        guard let currentContext = UIGraphicsGetCurrentContext()
            else {
              print("cound not get current context")
              return
        }
        
        switch self.currentShape {
        case .head?:
            self.drawNoose(using: currentContext)
            self.drawHead(using: currentContext)
        case .body?:
            self.drawNoose(using: currentContext)
            self.drawHead(using: currentContext)
            self.drawBody(using: currentContext)
        case .oneLeg?:
            self.drawNoose(using: currentContext)
            self.drawHead(using: currentContext)
            self.drawBody(using: currentContext)
            self.drawOneLeg(using: currentContext)
        case .twoLegs?:
            self.drawNoose(using: currentContext)
            self.drawHead(using: currentContext)
            self.drawBody(using: currentContext)
            self.drawOneLeg(using: currentContext)
            self.drawTwoLegs(using: currentContext)
        case .oneArm?:
            self.drawNoose(using: currentContext)
            self.drawHead(using: currentContext)
            self.drawBody(using: currentContext)
            self.drawOneLeg(using: currentContext)
            self.drawTwoLegs(using: currentContext)
            self.drawOneArm(using: currentContext)
        case .twoArms?:
            self.drawNoose(using: currentContext)
            self.drawHead(using: currentContext)
            self.drawBody(using: currentContext)
            self.drawOneLeg(using: currentContext)
            self.drawTwoLegs(using: currentContext)
            self.drawOneArm(using: currentContext)
            self.drawTwoArms(using: currentContext)
        case .oneEye?:
            self.drawNoose(using: currentContext)
            self.drawHead(using: currentContext)
            self.drawBody(using: currentContext)
            self.drawOneLeg(using: currentContext)
            self.drawTwoLegs(using: currentContext)
            self.drawOneArm(using: currentContext)
            self.drawTwoArms(using: currentContext)
            self.drawOneEye(using: currentContext)
        case .twoEyes?:
            self.drawNoose(using: currentContext)
            self.drawHead(using: currentContext)
            self.drawBody(using: currentContext)
            self.drawOneLeg(using: currentContext)
            self.drawTwoLegs(using: currentContext)
            self.drawOneArm(using: currentContext)
            self.drawTwoArms(using: currentContext)
            self.drawOneEye(using: currentContext)
            self.drawTwoEyes(using: currentContext)
        case .frown?:
            self.drawNoose(using: currentContext)
            self.drawHead(using: currentContext)
            self.drawBody(using: currentContext)
            self.drawOneLeg(using: currentContext)
            self.drawTwoLegs(using: currentContext)
            self.drawOneArm(using: currentContext)
            self.drawTwoArms(using: currentContext)
            self.drawOneEye(using: currentContext)
            self.drawTwoEyes(using: currentContext)
            self.drawFrown(using: currentContext)
        default:
            self.drawNoose(using: currentContext)
        }
        
    }
    
    private func drawNoose(using context: CGContext) {
        let centerPoint = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        
        let headPoint = CGPoint(x: centerPoint.x, y: centerPoint.y - CGFloat(60))
        let topRightPoint = CGPoint(x: centerPoint.x, y: centerPoint.y - CGFloat(80))
        let topLeftPoint = CGPoint(x: centerPoint.x - CGFloat(80), y: centerPoint.y - CGFloat(80))
        let basePoint = CGPoint(x: centerPoint.x - CGFloat(80), y: centerPoint.y + 65)
        let rightBasePoint = CGPoint(x: centerPoint.x - CGFloat(30), y: centerPoint.y + 65)
        let leftBasePoint = CGPoint(x: centerPoint.x - CGFloat(130), y: centerPoint.y + 65)
        
        context.move(to: headPoint)
        context.addLine(to: topRightPoint)
        context.addLine(to: topLeftPoint)
        context.addLine(to: basePoint)
        context.addLine(to: leftBasePoint)
        context.addLine(to: rightBasePoint)
        
        context.setLineCap(.round)
        context.setLineWidth(3.0)
        context.setStrokeColor(UIColor.gray.cgColor)
        context.strokePath()
        
    }
    
    private func drawHead(using context: CGContext) {
        let centerPoint = CGPoint(x: (bounds.size.width/2), y: (bounds.size.height/2) - CGFloat(48))
        
        context.addArc(center: centerPoint, radius: 12, startAngle: CGFloat(0).degreesToRadians, endAngle: CGFloat(360).degreesToRadians, clockwise: true)
        
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.strokePath()
        
    }
    
    private func drawBody(using context: CGContext) {
        let centerPoint = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        
        let topPoint = CGPoint(x: centerPoint.x, y: centerPoint.y - CGFloat(36))
        let bottomPoint = CGPoint(x: centerPoint.x, y: centerPoint.y)
        
        context.move(to: topPoint)
        context.addLine(to: bottomPoint)
        
        context.setLineCap(.square)
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.strokePath()
    }
    
    private func drawOneLeg(using context: CGContext) {
        let centerPoint = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        
        let buttPoint = CGPoint(x: centerPoint.x, y: centerPoint.y)
        let leftPoint = CGPoint(x: centerPoint.x - CGFloat(12), y: centerPoint.y + CGFloat(20))
        
        context.move(to: buttPoint)
        context.addLine(to: leftPoint)
        
        context.setLineCap(.square)
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.strokePath()

    }
    
    private func drawTwoLegs(using context: CGContext) {
        let centerPoint = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        
        let buttPoint = CGPoint(x: centerPoint.x, y: centerPoint.y)
        let rightPoint = CGPoint(x: centerPoint.x + CGFloat(12), y: centerPoint.y + CGFloat(20))
        
        context.move(to: buttPoint)
        context.addLine(to: rightPoint)
        
        context.setLineCap(.square)
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.strokePath()
        
    }
    
    private func drawOneArm(using context: CGContext) {
        let centerPoint = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        
        let chestPoint = CGPoint(x: centerPoint.x, y: centerPoint.y - CGFloat(20))
        let leftPoint = CGPoint(x: centerPoint.x - CGFloat(15), y: centerPoint.y - CGFloat(20))
        
        context.move(to: chestPoint)
        context.addLine(to: leftPoint)
        
        context.setLineCap(.square)
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.strokePath()
    }
    
    private func drawTwoArms(using context: CGContext) {
        let centerPoint = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        
        let chestPoint = CGPoint(x: centerPoint.x, y: centerPoint.y - CGFloat(20))
        let rightPoint = CGPoint(x: centerPoint.x + CGFloat(15), y: centerPoint.y - CGFloat(20))
        
        context.move(to: chestPoint)
        context.addLine(to: rightPoint)
        
        context.setLineCap(.square)
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.strokePath()
    }
    
    private func drawOneEye(using context: CGContext) {
        let centerPoint = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        
        let eyePoint = CGPoint(x: centerPoint.x - CGFloat(4), y: centerPoint.y - CGFloat(50))
        
        context.move(to: eyePoint)
        context.addLine(to: eyePoint)
        
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.strokePath()
    }
    
    private func drawTwoEyes(using context: CGContext) {
        let centerPoint = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        
        let eyePoint = CGPoint(x: centerPoint.x + CGFloat(4), y: centerPoint.y - CGFloat(50))
        
        context.move(to: eyePoint)
        context.addLine(to: eyePoint)
        
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.strokePath()
    }
    
    private func drawFrown(using context: CGContext) {
        let centerPoint = CGPoint(x: bounds.size.width/2, y: (bounds.size.height/2) - 41)

        context.addArc(center: centerPoint, radius: 5, startAngle: CGFloat(-15).degreesToRadians, endAngle: CGFloat(195).degreesToRadians, clockwise: true)
        
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        context.strokePath()
    }
    
    func drawShape(selectedShape: Shape) {
        self.currentShape = selectedShape
        self.setNeedsDisplay()
    }
 

}
