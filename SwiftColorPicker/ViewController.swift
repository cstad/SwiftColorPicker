//
//  ViewController.swift
//  SwiftColorPicker
//
//  Created by cstad on 12/24/14.
//
//

import UIKit

class ViewController: UIViewController {
    // UIView: ColorPicker reference
    @IBOutlet var colorPicker: ColorPicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call setColor on ColorPicker to a user defined color to illustrate how to startup the ColorPicker with a specific color.
        // The color used here is irrelevant and could be any color; possibly retrieved via stored settings or state of your app.
        colorPicker.setColor(UIColor(hue: 0.5, saturation: 0.5, brightness: 0.5, alpha: 1.0))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

