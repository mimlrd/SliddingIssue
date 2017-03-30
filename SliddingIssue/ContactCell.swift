//
//  ContactCell.swift
//  SliddingIssue
//
//  Created by Mike Milord on 30/03/2017.
//  Copyright © 2017 Purple Pear. All rights reserved.
//

import UIKit

class ContactCell: BaseCell {
    
    
    @IBOutlet weak var followBtn: UIButton!
    
    @IBOutlet weak var contactBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupViews()
    }
    
    
    override func setupViews() {
        followBtn.layer.cornerRadius = followBtn.frame.height / 2
        contactBtn.layer.borderWidth = 1.5
        contactBtn.layer.borderColor = UIColor.rgb(0, green: 128, blue: 255).cgColor
        contactBtn.layer.cornerRadius = followBtn.frame.height / 2
    }
    
}
