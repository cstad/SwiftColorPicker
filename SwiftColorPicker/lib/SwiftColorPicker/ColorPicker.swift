//
//  ColorPicker.swift
//  SwiftColorPicker
//
//  This is the main entry point for the SwiftColorPicker control.
//  The UIView, in your app, that this class is attached to will dictate the dimensions of the ColorPicker.
//  Everything is created programmatically so there is no need to deal with Interface Builder to use this control.
//
//  Created by cstad on 12/10/14.
//

import UIKit

class ColorPicker: UIView {
    var crossHairView: CrossHairView!
    var colorView: ColorGradientView!
    var mainColorView: MainColorView!
    var selectedColorView: SelectedColorView!
    
    var color: UIColor!
    var hue: CGFloat = 1.0
    var percentSaturation: CGFloat = 1.0
    var percentBrightness: CGFloat = 1.0
    
    var smallestDim: CGFloat = 300.0
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Init the view with a black border
        // Set height and width based on what the dimensions of the view are
        if (self.frame.size.height > self.frame.size.width) {
            smallestDim = self.frame.size.width
        } else {
            smallestDim = self.frame.size.height
        }
// TODO: INIT WITH USER DEFINED COLOR
        // Init with default color of red
        color = UIColor.redColor()
        // Call startup method to create the subviews needed for the control
        startup()
    }
    
    func startup() {
        // Init new ColorGradientView subview
        colorView = ColorGradientView(frame: CGRect(x: 20, y: 20, width: smallestDim - 40, height: smallestDim - 40), color: color)
        // Add colorGradientView as a subview of this view
        self.addSubview(colorView)
        
        // Init new CrossHairView subview
        crossHairView = CrossHairView(frame: CGRect(x: 0, y: 0, width: smallestDim, height: smallestDim), color: color)
        crossHairView.delegate = self
        // Add crossHairView as a subview of this view
        self.addSubview(crossHairView)
        
        // Init new MainColorView subview
        mainColorView = MainColorView(frame: CGRect(x: smallestDim - 20, y: 10, width: 30, height: smallestDim - 20))
        mainColorView.delegate = self
        // Add crossHairView as a subview of this view
        self.addSubview(mainColorView)
        
        // Init new SelectedColorView subview
        selectedColorView = SelectedColorView(frame: CGRect(x: 20, y: smallestDim - 20, width: smallestDim - 40, height: 20), color: color)
        // Add crossHairView as a subview of this view
        self.addSubview(selectedColorView)
    }
    
    func mainColorSelected(_color: UIColor, point: CGPoint) {
        hue = (point.y - 11) / (smallestDim - 41)

        color = _color
        
        notifyViews(UIColor(hue: hue, saturation: percentSaturation, brightness: percentBrightness, alpha: 1.0))
    }
    
    func colorSaturationAndBrightnessSelected(point: CGPoint) {
        // Determine the brightness and saturation of the selected color based upon the selection coordinates and the dimensions of the container
        percentBrightness = point.x / (smallestDim - 40)
        percentSaturation = 1 - (point.y / (smallestDim - 40))
        
        notifyViews(UIColor(hue: hue, saturation: percentSaturation, brightness: percentBrightness, alpha: 1.0))
    }
    
    func notifyViews(selectedColor: UIColor) {
        colorView.setColor(color)
        crossHairView.setColor(selectedColor)
        selectedColorView.setColor(selectedColor)
    }
}
