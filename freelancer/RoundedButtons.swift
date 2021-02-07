//
//  RoundedButtons.swift
//  freelancer
//
//  Created by Ashlee Muscroft on 07/02/2021.
//

import UIKit
@IBDesignable
class RoundedButtons: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 8.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
}
