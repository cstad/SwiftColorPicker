//
//  DrawView.swift
//  SwiftColorPicker
//
//  Created by cstad on 12/09/14.
//

import UIKit

class CrossHairView: UIView {
    var point: CGPoint!
    var color: Color!
    var view: UIView = UIView()
    
    var delegate: ColorPicker?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }

    init(frame: CGRect, color: UIColor!) {
        super.init(frame: frame)
        // Set this views backgroundColor to clear to ensure that the color gradient underneath it is visible
        backgroundColor = UIColor.clearColor()
        // Call setColor passing it the color that this view was init with
        setColor(color);
    }

    func setColor(_color: UIColor!) {
        // Set member color to the new UIColor coming in
        self.color = Color(color: _color)
        // Update display when possible
        setNeedsDisplay()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        // Set reference to the location of the touch in member point
        point = touches.anyObject()?.locationInView(self)
        // Notify delegate of the new new color selection
        delegate?.colorSelected(point)
        // Update display when possible
        setNeedsDisplay()
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        // Set reference to the location of the touchesMoved in member point
        point = touches.anyObject()?.locationInView(self)
        // Notify delegate of the new new color selection
        delegate?.colorSelected(point)
        // Update display when possible
        setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        if (point != nil) {
            var context = UIGraphicsGetCurrentContext()
            // Drawing properties:
            // Set line width to 1
            CGContextSetLineWidth(context, 1)
            // Set color to black
            CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
            
            // Draw black horizontal crosshair line
            CGContextBeginPath(context)
            CGContextMoveToPoint(context, 0, point.y)
            CGContextAddLineToPoint(context, self.bounds.width, point.y)
            CGContextStrokePath(context)
            // Draw black vertical crosshair line
            CGContextBeginPath(context)
            CGContextMoveToPoint(context, point.x, 0)
            CGContextAddLineToPoint(context, point.x, self.bounds.height)
            CGContextStrokePath(context)
            
            // Set color to white
            CGContextSetStrokeColorWithColor(context, UIColor.whiteColor().CGColor)
            
            // Draw white horizontal crosshair line
            CGContextBeginPath(context)
            CGContextMoveToPoint(context, 0, point.y + 1)
            CGContextAddLineToPoint(context, self.bounds.width, point.y + 1)
            CGContextStrokePath(context)
            // Draw white vertical crosshair line
            CGContextBeginPath(context)
            CGContextMoveToPoint(context, point.x + 1, 0)
            CGContextAddLineToPoint(context, point.x + 1, self.bounds.height)
            CGContextStrokePath(context)
            
            // Set color to black
            CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
            
            // Draw selected color box
            var p = CGPoint(x: point.x - 5, y: point.y - 5)
            var rect = CGRect(origin: p, size: CGSize(width: 10, height: 10))
            CGContextSetFillColorWithColor(context, color.colorLayerTop.CGColor)
            CGContextFillRect(context, rect)
            CGContextAddRect(context, rect)
            
            // Draw color box black outline
            CGContextBeginPath(context)
            CGContextMoveToPoint(context, point.x - 5, point.y - 5)
            CGContextAddLineToPoint(context, point.x - 5, point.y + 5)
            CGContextAddLineToPoint(context, point.x + 5, point.y + 5)
            CGContextAddLineToPoint(context, point.x + 5, point.y - 5)
            CGContextAddLineToPoint(context, point.x - 5, point.y - 5)
            CGContextStrokePath(context)
            
            CGContextSetStrokeColorWithColor(context, UIColor.whiteColor().CGColor)

            // Draw color box white outline
            CGContextBeginPath(context)
            CGContextMoveToPoint(context, point.x - 6, point.y - 6)
            CGContextAddLineToPoint(context, point.x - 6, point.y + 6)
            CGContextAddLineToPoint(context, point.x + 6, point.y + 6)
            CGContextAddLineToPoint(context, point.x + 6, point.y - 6)
            CGContextAddLineToPoint(context, point.x - 6, point.y - 6)
            CGContextStrokePath(context)
        }
    }
}
