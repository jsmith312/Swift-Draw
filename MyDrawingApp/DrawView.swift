//
//  DrawView.swift
//  MyDrawingApp
//
//  Created by Jordan Tyler Smith on 1/11/15.
//  Copyright (c) 2015 Jordan Tyler Smith. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    var lines: [Line]=[]
    var lastPoint: CGPoint!
    var drawColor = UIColor.blackColor()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func touchesBegan(touches: (NSSet!), withEvent event: UIEvent) {
        // get the point that is touched
        lastPoint = touches.anyObject()?.locationInView(self)
    }
    
    override func touchesMoved (touches: (NSSet!), withEvent event: UIEvent) {
        var newPoint = touches.anyObject()?.locationInView(self)
        lines.append(Line(start: lastPoint, end: newPoint!, color: drawColor))
        lastPoint = newPoint
        // draw everything over again
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        var context = UIGraphicsGetCurrentContext()
        CGContextSetLineCap(context, kCGLineCapRound)
        CGContextSetLineWidth(context, 5)
        for line in lines {
            CGContextBeginPath(context)
            CGContextMoveToPoint(context, line.startX, line.startY)
            CGContextAddLineToPoint(context, line.endX, line.endY)
            CGContextSetStrokeColorWithColor(context, line.color.CGColor)
            CGContextStrokePath(context)
        }
    }

    
}
