//
//  DrawView.swift
//  SwiftColorPicker
//
//  Created by cstad on 12/09/14.
//

import UIKit

class CrossHairView: UIView {
    var point: CGPoint!
    var circleRadius: CGFloat = 10.0
    var color: UIColor!
    
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
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        circleRadius = 20.0
        // Set reference to the location of the touch in member point
        point = touches.anyObject()?.locationInView(self)
        // Notify delegate of the new new color selection
        delegate?.colorSaturationAndBrightnessSelected(point)
        // Update display when possible
        setNeedsDisplay()
    }
    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        // Set reference to the location of the touchesMoved in member point
        point = touches.anyObject()?.locationInView(self)
        // Notify delegate of the new new color selection
        delegate?.colorSaturationAndBrightnessSelected(point)
        // Update display when possible
        setNeedsDisplay()
    }
    
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        circleRadius = 10.0
        // Set reference to the location of the touch in member point
        point = touches.anyObject()?.locationInView(self)
        // Notify delegate of the new new color selection
        delegate?.colorSaturationAndBrightnessSelected(point)
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
            CGContextMoveToPoint(context, 0, getCoordinate(point.y))
            CGContextAddLineToPoint(context, (self.bounds.width - 20), getCoordinate(point.y))
            CGContextStrokePath(context)
            // Draw black vertical crosshair line
            CGContextBeginPath(context)
            CGContextMoveToPoint(context, getCoordinate(point.x), 0)
            CGContextAddLineToPoint(context, getCoordinate(point.x), (self.bounds.height - 20))
            CGContextStrokePath(context)
            
            // Set color to white
            CGContextSetStrokeColorWithColor(context, UIColor.whiteColor().CGColor)
            
            // Draw white horizontal crosshair line
            CGContextBeginPath(context)
            CGContextMoveToPoint(context, 0, getCoordinate(point.y) + 1)
            CGContextAddLineToPoint(context, (self.bounds.width - 20), getCoordinate(point.y) + 1)
            CGContextStrokePath(context)
            // Draw white vertical crosshair line
            CGContextBeginPath(context)
            CGContextMoveToPoint(context, getCoordinate(point.x) + 1, 0)
            CGContextAddLineToPoint(context, getCoordinate(point.x) + 1, (self.bounds.height - 20))
            CGContextStrokePath(context)
            
            // Set color to black
            CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
            
            // Draw selected color circle
            // Set the coordinates for the circle origin
            var p = CGPoint(x: getCoordinate(point.x) - circleRadius, y: getCoordinate(point.y) - circleRadius)
            var rect = CGRect(origin: p, size: CGSize(width: circleRadius * 2, height: circleRadius * 2))
            // Add a circle to the previously defined rect
            CGContextAddEllipseInRect(context, rect)
            // Fill with color
            CGContextSetFillColorWithColor(context, color.CGColor)
            CGContextFillEllipseInRect(context, rect)
            // Add the rect to the drawing context
            CGContextAddRect(context, rect)
        }
    }
    
    func setColor(_color: UIColor!) {
        // Set member color to the new UIColor coming in
        color = _color
        
        point = getPointFromColor()
        
        // Update display when possible
        setNeedsDisplay()
    }
    
    func getCoordinate(coord: CGFloat) -> CGFloat {
        if (coord < 20) {
            return 20
        }
        if (coord > (frame.size.height - 20)) {
            return (frame.size.height - 20)
        }
        return coord
    }
    // Determine crosshair coordinates from a color
    func getPointFromColor() -> CGPoint {
        var hue: CGFloat = 0.0, saturation: CGFloat = 0.0, brightness: CGFloat = 0.0, alpha: CGFloat = 0.0
        var ok: Bool = color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        if (!ok) {
            println("ColorPicker: exception <The color provided to ColorPicker is not convertible to HSB>")
        }
        return CGPoint(x: brightness * frame.height, y: frame.height - (saturation * frame.height))
    }
}
