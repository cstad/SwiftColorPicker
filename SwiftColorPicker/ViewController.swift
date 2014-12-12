//
//  ViewController.swift
//  SwiftColorPicker
//
//  Created by cstad on 12/1/14.
//

import UIKit

class ViewController: UIViewController {
    var colorView: ColorGradientView!
    
    var color: Color!
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var selectedColorView: UIView!
    
    @IBAction func sliderChange(AnyObject) {
// TODO: MOVE TO COLORPICKER
        println("VC ==> sliderChange")
        var val: Float = slider.value
        println("Value: \(val)")
        if (val == 0) {
            println("full red")
            selectedColorView.backgroundColor = UIColor.redColor()
        } else if (val < 1) {
            println("between red and green")
            var arr: Dictionary = getColor(val);
println("arr: \(arr)")
            selectedColorView.backgroundColor = UIColor(red: arr["red"]!, green: arr["green"]!, blue: arr["blue"]!, alpha: arr["alpha"]!)
        } else if (val == 1) {
            println("full green")
            selectedColorView.backgroundColor = UIColor.greenColor()
        } else if (val < 2) {
            println("between green and blue")
            var arr: Dictionary = getColor(val);
            selectedColorView.backgroundColor = UIColor(red: arr["red"]!, green: arr["green"]!, blue: arr["blue"]!, alpha: arr["alpha"]!)
        } else {
            println("full blue")
            selectedColorView.backgroundColor = UIColor.blueColor()
        }
println("\(selectedColorView.backgroundColor)")
        color = Color(color: selectedColorView.backgroundColor)
        colorChange()
    }
    
    func colorChange() {
        colorView.color = color;
    }

    func getColor(val: Float) -> Dictionary<String, CGFloat> {
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

