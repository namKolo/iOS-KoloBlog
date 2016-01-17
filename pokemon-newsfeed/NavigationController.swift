//
//  NavigationController.swift
//  pokemon-newsfeed
//
//  Created by Kolo on 1/17/16.
//  Copyright © 2016 Kolo. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationBar.backgroundColor = Colors.primaryColor
    navigationBar.barTintColor = Colors.primaryColor
  }
}
