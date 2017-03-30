//
//  BaseCell.swift
//  SliddingIssue
//
//  Created by Mike Milord on 30/03/2017.
//  Copyright © 2017 Purple Pear. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    

    
}
