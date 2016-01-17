//
//  NewsfeedViewController.swift
//  mrkolo-newsfeed
//
//  Created by Kolo on 1/17/16.
//  Copyright © 2016 Kolo. All rights reserved.
//

import UIKit

class NewsfeedViewController: UIViewController {
  
  @IBOutlet weak var newsfeedTable: UITableView!
  let menuTransitionManager = MenuTransitionManager()
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    NSBundle.mainBundle().loadNibNamed("NewsfeedViewController", owner: self, options: nil)
    newsfeedTable.registerNib(UINib(nibName: "CardViewCell", bundle: nil), forCellReuseIdentifier: "cardCell")
    
  }
  
  @IBAction func openSettingMenu(sender: AnyObject) {
    performSegueWithIdentifier("showSettingViewController", sender: sender)
    
  }
}




extension NewsfeedViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = cellForPokemon(cellForRowAtIndexPath: indexPath)
    return cell
  }
}

extension NewsfeedViewController {
  private func cellForPokemon(cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = newsfeedTable.dequeueReusableCellWithIdentifier("cardCell", forIndexPath: indexPath) as! CardViewCell
    return cell
  }
}


extension NewsfeedViewController {
  private func setupNewsfeedTable() {
    newsfeedTable.dataSource = self
    newsfeedTable.delegate = self
    newsfeedTable.estimatedRowHeight = 30
    newsfeedTable.rowHeight = UITableViewAutomaticDimension
    newsfeedTable.backgroundColor = Colors.backgroundColor
    newsfeedTable.separatorStyle = .None
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNewsfeedTable()
    menuTransitionManager.sourceViewController = self
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
    let menu = segue.destinationViewController as! SettingViewController
    menu.transitioningDelegate = menuTransitionManager
  }
}

