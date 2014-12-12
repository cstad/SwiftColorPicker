//
//  ColorGradientView.swift
//  SwiftColorPicker
//
//  Created by cstad on 12/10/14.
//

import UIKit

class ColorGradientView: UIView {
    var color: Color!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
    init(frame: CGRect, color: UIColor!) {
        super.init(frame: frame)
        // Call setColor passing it the color that this view was init with
        setColor(color)
    }

    func setColor(_color: UIColor!) {
        // Set member color to the new UIColor coming in
        color = Color(color: _color)
        // Set colorView sublayers to nil to remove any existing sublayers
        layer.sublayers = nil;
        // Use the size and position of this views frame to create a new frame for the color.colorLayer
        color.colorLayer.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.width)
        // Insert the color.colorLayer into this views layer as a sublayer
        layer.insertSublayer(color.colorLayer, atIndex: 0)
        // Init new CAGradientLayer to be used as the grayScale overlay
        var grayScaleLayer = CAGradientLayer()
        // Set the grayScaleLayer colors to black and clear
        grayScaleLayer.colors = [UIColor.blackColor().CGColor, UIColor.clearColor().CGColor]
        // Display gradient left to right
        grayScaleLayer.startPoint = CGPointMake(0.0, 0.5)
        grayScaleLayer.endPoint = CGPointMake(1.0, 0.5)
        // Use the size and position of this views frame to create a new frame for the grayScaleLayer
        grayScaleLayer.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.width)
        // Insert the grayScaleLayer into this views layer as a sublayer
        self.layer.insertSublayer(grayScaleLayer, atIndex: 1)
    }
}

