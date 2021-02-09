//
//  UIShapes.swift
//  freelancer
//
//  Created by Ashlee Muscroft on 06/02/2021.
//

import Foundation
import UIKit

protocol UIShapeLayerProtocol {
    func makeShape()
}
struct UIAPPConstants {
    static let DefaultLogoSize: Int = 64
}
// Half circle
@IBDesignable
class HalfCircle: UIView, UIShapeLayerProtocol {
    var shadowLayer: CALayer = CALayer()
    var shapeLayer: CAShapeLayer = CAShapeLayer()
    @IBInspectable var layerColor: UIColor = UIColor.black {
        didSet {
            makeShape()
        }
    }
    
    // MARK: default right facing
    @IBInspectable var startAngleFromRadians: CGFloat = .pi * 1.5
    @IBInspectable var endAngleFromRadians: CGFloat = .pi / 2
    @IBInspectable var clockWise: Bool = true
    @IBInspectable var enableShadow: Bool = true {
        didSet {
            makeShape()
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeShape()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeShape()
    }

    func makeShape() {
        let myView = self
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: 0, y: self.bounds.midY),
                                      radius: self.bounds.midY,
                                      startAngle: self.startAngleFromRadians,
                                      endAngle: self.endAngleFromRadians,
                                      clockwise: self.clockWise)
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = layerColor.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 1
        // shadowPath
        if enableShadow {
            let layer = self.layer
            let shadowPath = UIBezierPath(arcCenter: CGPoint(x: self.bounds.midY * 0.1, y: self.bounds.midY),
                                          radius: self.bounds.midY,
                                          startAngle: self.startAngleFromRadians,
                                          endAngle: self.endAngleFromRadians,
                                          clockwise: true)
            layer.shadowPath = shadowPath.cgPath
            layer.shadowOffset = .zero
            layer.shadowOpacity = 0.5
            layer.shadowRadius = 2
        }
        myView.layer.addSublayer(shapeLayer)

    }
}

// Rhombus
@IBDesignable
class Rhombus: UIView, UIShapeLayerProtocol {
    @IBInspectable
    var angle: CGFloat = 30 {
        didSet {
            makeShape()
        }
    }
    @IBInspectable var layerColor: UIColor = UIColor(named: "AppRed") ?? UIColor.red {
        didSet {
            makeShape()
        }
    }
    var shapeLayer: CAShapeLayer = CAShapeLayer()
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeShape()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeShape()
    }

    func makeShape() {
        self.translatesAutoresizingMaskIntoConstraints = false
        // parent start
        let origin = self.bounds.origin
        let maxX = self.bounds.maxX
        let maxY = self.bounds.maxY
        // draw shap with UIBezierPath()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: origin.x, y: origin.y + angle ))
        path.addLine(to: CGPoint(x: maxX, y: origin.y))
        path.addLine(to: CGPoint(x: maxX, y: maxY - angle))
        path.addLine(to: CGPoint(x: origin.x, y: maxY))
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = layerColor.cgColor
        shapeLayer.lineWidth = 0
        self.layer.addSublayer(shapeLayer)
    }
}
