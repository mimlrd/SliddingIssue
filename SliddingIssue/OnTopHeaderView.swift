//
//  OnTopHeaderView.swift
//  SliddingIssue
//
//  Created by Mike Milord on 30/03/2017.
//  Copyright © 2017 Purple Pear. All rights reserved.
//

import UIKit

class OnTopHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var headerBgImageView: UIImageView!
    
    @IBOutlet weak var likeBtn: UIButton!
    
    @IBOutlet weak var settingBtn: UIButton!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupView()
    }
    
    
    
    func setupView() {
        
        
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
    }
    
    
    
    
    
    
    
    
}

