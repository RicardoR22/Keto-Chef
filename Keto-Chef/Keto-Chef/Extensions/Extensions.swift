//
//  Extensions.swift
//  Keto-Chef
//
//  Created by Ricardo Rodriguez on 3/19/19.
//  Copyright © 2019 Ricardo Rodriguez. All rights reserved.
//

import UIKit

extension UITextField {
    func leftPadding(space: CGFloat) {
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: space, height: self.frame.size.height))
        self.leftView = padding
        self.leftViewMode = .always
    }
}


