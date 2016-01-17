//
//  ToolBar.swift
//  mrkolo-newsfeed
//
//  Created by Kolo on 1/17/16.
//  Copyright © 2016 Kolo. All rights reserved.
//

import UIKit

class CustomToolbar: UIToolbar {
  override func awakeFromNib() {
    super.awakeFromNib()
    
    barTintColor = Colors.primaryColor
    tintColor = Colors.whiteColor
  }
}