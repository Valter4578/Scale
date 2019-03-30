//
//  ScaleView.swift
//  Scale
//
//  Created by Максим Алексеев on 10/11/2018.
//  Copyright © 2018 Pineapple team. All rights reserved.
//

import UIKit
@IBDesignable
class ScaleView: UIView {
    
    override func draw(_ rect: CGRect) {
        // Большой круг
        let context = UIGraphicsGetCurrentContext() //
        context?.setStrokeColor(UIColor.green.cgColor) // Цвет
        context?.setLineWidth(12.0) // Ширина линии
        context?.addArc(center: CGPoint(x: 375 / 2, y: 375 / 2), radius: 375 / 2 - 12, startAngle: 0, endAngle: 2 * CGFloat(M_PI), clockwise: true)
        // Маленький круг
        context?.strokePath()
        context?.setLineWidth(3.0)// Ширина линии
        context?.setStrokeColor(UIColor.cyan.cgColor) // Цвет
        context?.addArc(center: CGPoint(x: 375 / 2, y: 375 / 2), radius: 375 / 4 - 14, startAngle: 0, endAngle: 2 * CGFloat(M_PI), clockwise: true)// Рисование круга
        context?.strokePath()// Вывод нарисованого
    }
}
