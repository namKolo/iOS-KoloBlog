//
//  CircleLabel.swift
//  mrkolo-newsfeed
//
//  Created by Kolo on 1/17/16.
//  Copyright © 2016 Kolo. All rights reserved.
//

import UIKit

@IBDesignable class CircleLabel: UILabel {
  func setupCircleLabel() {
    textAlignment = .Center
    backgroundColor = Colors.brown
    textColor = UIColor.whiteColor()
    clipsToBounds = true
    layer.cornerRadius = frame.size.height / 2
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder:aDecoder)
    setupCircleLabel()
    
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupCircleLabel()
  }
}
