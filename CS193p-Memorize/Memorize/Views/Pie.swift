//
//  Pie.swift
//  Memorize
//
//  Created by Minh Dang on 1/24/21.
//

import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = false
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(startAngle.radians, endAngle.radians)
        }
        
        set {
            startAngle = Angle.radians(newValue.first)
            endAngle = Angle.radians(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        let center: CGPoint = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let startPoint = CGPoint(
            x: center.x + radius*cos(CGFloat(startAngle.radians)),
            y: center.y + radius*sin(CGFloat(startAngle.radians))
        )
        p.move(to: center)
        p.addLine(to: startPoint)
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise  )
        
        return p
    }
}

