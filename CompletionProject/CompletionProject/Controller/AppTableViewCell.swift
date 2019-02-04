//
//  AppTableViewCell.swift
//  CompletionProject
//
//  Created by Jean Carlos Antonio Pereira dos Santos on 04/02/19.
//  Copyright © 2019 Jean Carlos Antonio Pereira dos Santos. All rights reserved.
//

import UIKit

class AppTableViewCell: UITableViewCell {
  
  // MARK: Outlets
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var price: UILabel!
  @IBOutlet weak var imageGame: UIImageView!
  @IBOutlet weak var stackStars: UIStackView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
      
        // Configure the view for the selected state
      if(selected) {
        // Animation when selected
//        if(animated){
          UIView.animate(withDuration: 0.5) {
            self.imageGame.alpha = 0.4
          }
//        } else {
//          self.imageGame.alpha = 0.4
//        }
//        
      } else {
        // Animation when not selected
//        if(animated){
          UIView.animate(withDuration: 0.05) {
            self.imageGame.alpha = 1
          }
//        } else {
//          self.imageGame.alpha = 1
//        }
      }
    }

}
