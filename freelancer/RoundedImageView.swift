//
//  RoundedImageView.swift
//  freelancer
//
//  Created by Ashlee Muscroft on 12/02/2021.
//

import UIKit

@IBDesignable
class RoundedImageView: UIImageView {
    @IBInspectable var cornerRadius: CGFloat = 8.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
}
