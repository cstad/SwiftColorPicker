//
//  DrawView.swift
//  SwiftColorPicker
//
//  Created by Christopher Stadler on 12/1/14.
//  Copyright (c) 2014 Epiphanic Studios. All rights reserved.
//

import UIKit

class DrawView: UIView {
    var point: CGPoint!
    
//    init(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        point = touches.anyObject()?.locationInView(self)
        self.setNeedsDisplay()
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        point = touches.anyObject()?.locationInView(self)
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        println("==> drawRect")
        if (point != nil) {
            var context = UIGraphicsGetCurrentContext()
            CGContextSetLineWidth(context, 1)
            
            CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
            // Draw horizontal line
            CGContextBeginPath(context)
            CGContextMoveToPoint(context, 0, point.y)
            CGContextAddLineToPoint(context, self.bounds.width, point.y)
            CGContextStrokePath(context)
            // Draw vertical line
            CGContextBeginPath(context)
            CGContextMoveToPoint(context, point.x, 0)
            CGContextAddLineToPoint(context, point.x, self.bounds.height)
            CGContextStrokePath(context)
            // Draw color box
            var p = CGPoint(x: point.x - 5, y: point.y - 5)
            var rect = CGRect(origin: p, size: CGSize(width: 10, height: 10))
            CGContextSetFillColorWithColor(context, UIColor.redColor().CGColor)
            CGContextFillRect(context, rect)
            CGContextAddRect(context, rect)
            CGContextBeginPath(context)
            CGContextMoveToPoint(context, point.x - 5, point.y - 5)
            CGContextAddLineToPoint(context, point.x - 5, point.y + 5)
            CGContextAddLineToPoint(context, point.x + 5, point.y + 5)
            CGContextAddLineToPoint(context, point.x + 5, point.y - 5)
            CGContextAddLineToPoint(context, point.x - 5, point.y - 5)
            CGContextStrokePath(context)
        }
    }
}
