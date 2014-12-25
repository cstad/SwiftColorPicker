//
//  Color.swift
//  SwiftColorPicker
//
//  Created by cstad on 12/3/14.
//

import UIKit

class Color {
    let colorLayer: CAGradientLayer!
    let colorLayerTop: UIColor!
    let colorLayerBottom: UIColor = UIColor.whiteColor()
    
    init(color: UIColor!) {
        colorLayerTop = color
        colorLayer = CAGradientLayer()
        colorLayer.colors = [colorLayerTop.CGColor, colorLayerBottom.CGColor]
        colorLayer.locations = [0.0, 1.0]
    }
}
