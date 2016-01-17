//
//  Color.swift
//  pokemon-newsfeed
//
//  Created by Kolo on 1/17/16.
//  Copyright © 2016 Kolo. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
  convenience init(hex: Int, alpha: CGFloat) {
    let red = CGFloat((hex >> 16) & 0xff) / 255
    let green = CGFloat((hex >> 8) & 0xff) / 255
    let blue = CGFloat(hex & 0xff) / 255
    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}