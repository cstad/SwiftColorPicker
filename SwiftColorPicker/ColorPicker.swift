//
//  ColorPicker.swift
//  SwiftColorPicker
//
//  This is the main entry point for the SwiftColorPicker control.
//  The UIView, in your app, that this class is attached to will dictate the demensions of the ColorPicker.
//  Everything is created programmatically so there is no need to deal with Interface Builder to use this control.
//
//  Created by Christopher Stadler on 12/10/14.
//  Copyright (c) 2014 Epiphanic Studios. All rights reserved.
//

import UIKit

class ColorPicker: UIView {
    var crossHairView: CrossHairView!
    var colorView: ColorGradientView!
    
    var color: UIColor!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Init the view with a black border
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.layer.borderWidth = 1
// TODO: INIT WITH USER DEFINED COLOR
        // Init with default color of red
        color = UIColor.redColor()
        // Call startup method to create the subviews needed for the control
        startup()
    }
    
    func startup() {
        // Init new ColorGradientView subview
        colorView = ColorGradientView(frame: CGRect(x: 0, y: 0, width: 300, height: 300), color: color)
        // Add colorGradientView as a subview of this view
        self.addSubview(colorView)
        
        // Init new CrossHairView subview
        crossHairView = CrossHairView(frame: CGRect(x: 0, y: 0, width: 300, height: 300), color: color)
        crossHairView.delegate = self
        // Add crossHairView as a subview of this view
        self.addSubview(crossHairView)
    }
    
    func colorSelected(point: CGPoint) {
println("colorSelected \(point)")
// TODO: DETERMINE THE SELECTED COLOR
        // Call notifyViews to notify them of the color selection change
        notifyViews()
    }
    
    func notifyViews() {
println("ColorPicker notifyViews")
        colorView.setColor(color);
        crossHairView.setColor(color);
    }
    
    func getColor(val: Float) -> Dictionary<String, CGFloat> {
println("ColorPicker getColor")
        var color: UIColor!
        var hue = val % 1
        var dic: Dictionary<String, CGFloat> = Dictionary<String, CGFloat>()
        println("hue: \(hue) \(255 - (255 * hue)) \(255 - (255 - (255 * hue)))")
        dic["alpha"] = CGFloat(1)
        if (val < 1) {
            println("between red and green")
            dic["red"] = CGFloat((255 - (255 * hue)) / 255)
            dic["green"] = CGFloat((255 - (255 - (255 * hue))) / 255)
            dic["blue"] = CGFloat(0)
        } else if (val < 2) {
            println("between green and blue")
            dic["red"] = CGFloat(0)
            dic["green"] = CGFloat((255 - (255 * hue)) / 255)
            dic["blue"] = CGFloat((255 - (255 - (255 * hue))) / 255)
        }
        
        return dic
    }
    
    func refreshColorView() {
println("ColorPickerView refreshColorView")
        // Set colorView sublayers to nil to remove any existing sublayers
        colorView.layer.sublayers = nil;
        // Set the colorView backgroundColor to clearColor
        colorView.backgroundColor = UIColor.clearColor()
        
        var backgroundLayer = Color(color: color).colorLayer
        
        backgroundLayer.frame = CGRect(x: 0, y: 0, width: colorView.frame.size.width, height: colorView.frame.size.width)
        
        colorView.layer.insertSublayer(backgroundLayer, atIndex: 0)
    }
}
