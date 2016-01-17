//
//  UIView.swift
//  mrkolo-newsfeed
//
//  Created by Kolo on 1/17/16.
//  Copyright © 2016 Kolo. All rights reserved.
//

import UIKit

extension UIView {
  func xibSetup(nibName nibName: String!) {
    let view = loadViewFromNib(nibName: nibName)
    view.frame = bounds
    view.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
    
    addSubview(view)
  }
  
  func loadViewFromNib(nibName nibName: String!) -> UIView {
    let bundle = NSBundle(forClass: self.dynamicType)
    let nib = UINib(nibName: nibName, bundle: bundle)
    let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
    return view
  }
}