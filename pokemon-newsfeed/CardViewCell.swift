//
//  PokemonCardViewCell.swift
//  pokemon-newsfeed
//
//  Created by Kolo on 1/17/16.
//  Copyright © 2016 Kolo. All rights reserved.
//

import UIKit

class CardViewCell: UITableViewCell {

  @IBOutlet weak var cardView: UIView!
  @IBOutlet weak var avatarLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      backgroundColor = UIColor.clearColor()
      contentView.backgroundColor = UIColor.clearColor()
      selectionStyle = .None
      
      setupCardView()
      setupAvatarLabel()
  }
  
  func setupCardView() {
    cardView.backgroundColor = UIColor.whiteColor()
    cardView.layer.masksToBounds = false
    cardView.layer.cornerRadius = 4
    cardView.layer.shadowColor = UIColor.grayColor().CGColor
    cardView.layer.shadowOffset = CGSize(width: 0, height: 1)
    cardView.layer.shadowOpacity = 0.5
    cardView.layer.shadowRadius = 1
  }
  
  func setupAvatarLabel() {
//    avatarLabel.textAlignment = .Center
//    avatarLabel.backgroundColor = Colors.brown
//    avatarLabel.textColor = UIColor.whiteColor()
//    avatarLabel.clipsToBounds = true
//    avatarLabel.layer.cornerRadius = avatarLabel.frame.size.height / 2
  }
  
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
