//
//  LinkButton.swift
//  freelancer
//
//  Created by Ashlee Muscroft on 07/02/2021.
//

import UIKit

@IBDesignable
class LinkButton: UIButton {

    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = 0
            layer.backgroundColor = .none
        }
    }

}
