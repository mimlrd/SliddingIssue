//
//  ProfileVC.swift
//  SliddingIssue
//
//  Created by Mike Milord on 30/03/2017.
//  Copyright © 2017 Purple Pear. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    

    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    @IBOutlet var topBarView: UIView!
    
    let profileCell1 = "profileCell1"
    let profileCell2 = "profileCell2"
    let profileHeaderCell = "profileHeaderCell"
    let profileMenuCell = "profileMenuCell"
    let profileItemsCell = "profileItemsCell"
    
    fileprivate var layoutHeader : UICollectionViewFlowLayout? {
        return self.profileCollectionView?.collectionViewLayout as! UICollectionViewFlowLayout?
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        
        
        registerCells()
        
        
    }
    
    
    private func registerCells() {
        
        //add the cell to the collection view
        profileCollectionView!.register(UINib(nibName: "ProfileDetailsCell", bundle: nil), forCellWithReuseIdentifier: profileCell1)
        profileCollectionView!.register(UINib(nibName: "ContactCell", bundle: nil), forCellWithReuseIdentifier: profileCell2)
        profileCollectionView!.register(UINib(nibName: "ListingMenuCell", bundle: nil), forCellWithReuseIdentifier: profileMenuCell)
        profileCollectionView!.register(UINib(nibName: "ProfileItemsCell", bundle: nil), forCellWithReuseIdentifier: profileItemsCell)
        
        // Setup Section Header
        profileCollectionView.register(UINib(nibName: "OnTopHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: profileHeaderCell)
        self.layoutHeader?.headerReferenceSize = CGSize(width: self.view.frame.size.width, height: 300)
        
    }
    
    //Mark: The Follow button was touch
    
    
    @IBAction func followButtonTouched() {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func contactButtonTouched() {
        
        print("Contact Button touched")
    }
    
    
    
    
    
    
    

    
    
    


  


}

