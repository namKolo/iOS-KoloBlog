//
//  SettingViewController.swift
//  mrkolo-newsfeed
//
//  Created by Kolo on 1/17/16.
//  Copyright © 2016 Kolo. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
  @IBOutlet weak var kLabel: CircleLabel!
  @IBOutlet weak var lLabel: CircleLabel!
  @IBOutlet weak var foLabel: CircleLabel!
  @IBOutlet weak var soLabel: CircleLabel!

  
  @IBOutlet weak var menuView: UIView!
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    NSBundle.mainBundle().loadNibNamed("SettingViewController", owner: self, options: nil)
  }

  @IBAction func unwindToNewsfeedViewController(sender: AnyObject) {
     self.dismissViewControllerAnimated(true, completion: nil)
    
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor(hex: 0x000, alpha: 0.75)
    view.tintColor = Colors.whiteColor
  }
}
