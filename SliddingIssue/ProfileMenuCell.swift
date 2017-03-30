//
//  ProfileMenuCell.swift
//  SliddingIssue
//
//  Created by Mike Milord on 30/03/2017.
//  Copyright © 2017 Purple Pear. All rights reserved.
//

import UIKit

class ProfileMenuCell: BaseCell {
    
    
    @IBOutlet weak var titlrLbl: UILabel!
    
    
    var titleForLabel: String!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    
    
    
    override func setupViews() {
        
        titlrLbl.text = titleForLabel
    }
    
}
