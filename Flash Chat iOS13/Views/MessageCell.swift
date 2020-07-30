//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Rohit sahu on 24/07/20.

import UIKit

class MessageCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }

    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var messageBubble: UIView!
    @IBOutlet weak var imageViewField: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        messageBubble.layer.cornerRadius = 10
    }
    
}

