//
//  ProfileItemsCell.swift
//  SliddingIssue
//
//  Created by Mike Milord on 30/03/2017.
//  Copyright © 2017 Purple Pear. All rights reserved.
//

import UIKit

class ProfileItemsCell: BaseCell , UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var profileItemsCV: UICollectionView!
    
    let itemCellID = "cellItem"
    let mainCellID = "mainCell"
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupViews()
    }
    
    
    
    
    
    override func setupViews() {
        
        
        //Let set register the itemcell
        profileItemsCV!.register(UINib(nibName: "MainCell", bundle: nil), forCellWithReuseIdentifier: mainCellID)
        
    }
    
    //Mark: Var to access the other variable from the ListingMenu Cell
    lazy var listingBar: ListingMenuCell = {
        let lm = ListingMenuCell()
        lm.profileItemCell = self
        
        
        // print("lm is: \(lm)")
        return lm
    }()
    
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        // print("The menu is: \(listingBarMenu.menuCellID)")
        
        let xScrollValue = scrollView.contentOffset.x
        
        listingBar.horizontalBarLeftAnchorConstraint?.constant = xScrollValue / 3
        
        // print("ListingBar menu: \(listingBar.horizontalBarLeftAnchorConstraint?.constant)")
        
    }
    
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.pointee.x / frame.width
        
        let indexPath = IndexPath(item: Int(index), section: 0)
        
        
        
        /*********************** With this it will crash ********************************************/
        listingBar.listingMenuCV.selectItem(at: indexPath, animated: true, scrollPosition: UICollectionViewScrollPosition())
        
        // print("The menu bar list: \(listingBar.listingMenuCV)")
        
    }
    
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: mainCellID, for: indexPath)
        
        let colors: [UIColor] = [.blue, .green, UIColor.gray, .purple]
        
        cell.backgroundColor = colors[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // let height = (frame.width - 16 - 16) * 9 / 16
        
        // The size will need top adapt to the new flowlayout like the Pinterest
        
        return CGSize(width: frame.width, height: 270)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        
        
        return 0
    }
    
    
}
