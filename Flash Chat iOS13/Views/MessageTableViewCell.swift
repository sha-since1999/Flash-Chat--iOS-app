//
//  MessageTableViewCell.swift
//  Flash Chat iOS13
//
//  Created by Rohit sahu on 24/07/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var label: UILabel!
 
    @IBOutlet weak var senderImage: UIImageView!
    
    
}
