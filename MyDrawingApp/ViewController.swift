//
//  ViewController.swift
//  MyDrawingApp
//
//  Created by Jordan Tyler Smith on 1/11/15.
//  Copyright (c) 2015 Jordan Tyler Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var drawView: DrawView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Clear the screen when clear button is tapped
    @IBAction func clearTapped() {
        var theDrawView : DrawView = drawView as DrawView
        // set the array of lines to nothing
        theDrawView.lines = []
        // redraw blank canvas
        theDrawView.setNeedsDisplay()
    }
    
    // change the color when the
    @IBAction func colorTapped(button: UIButton!) {
        var color : UIColor!
        if (button.titleLabel?.text == "Red") {
            color = UIColor.redColor()
        } else if (button.titleLabel?.text == "Black") {
            color = UIColor.blackColor()
        }
        drawView.drawColor = color
    }

}

