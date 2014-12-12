//
//  Color.swift
//  SwiftColorPicker
//
//  Created by Christopher Stadler on 12/3/14.
//  Copyright (c) 2014 Epiphanic Studios. All rights reserved.
//

import UIKit

class Color {
    let colorLayer: CAGradientLayer!
    let colorLayerTop: UIColor!
    let colorLayerBottom: UIColor = UIColor.whiteColor()

//    let grayScaleLayerLayer: CAGradientLayer!
//    let grayScaleLayerLeft: UIColor = UIColor.blackColor()
    
    init(color: UIColor!) {
        colorLayerTop = color
        colorLayer = CAGradientLayer()
        colorLayer.colors = [colorLayerTop.CGColor, colorLayerBottom.CGColor]
        colorLayer.locations = [0.0, 1.0]
    }
}
