//
//  ListingMenuCell.swift
//  SliddingIssue
//
//  Created by Mike Milord on 30/03/2017.
//  Copyright © 2017 Purple Pear. All rights reserved.
//

import UIKit

class ListingMenuCell: BaseCell, UICollectionViewDelegate , UICollectionViewDataSource {
    
    @IBOutlet weak var listingMenuCV: UICollectionView!
    
    
    let menuCellID = "profileMenuCell"
    
    var titles = [String]()
    
    var profileItemCell: ProfileItemsCell?
    
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    
    
    fileprivate var layout: UICollectionViewFlowLayout? {
        return self.listingMenuCV?.collectionViewLayout as! UICollectionViewFlowLayout?
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // setupViews()
    }
    
    
    
    override func setupViews() {
        
        // print("**** Setup from the menu cell was called =======")
        
        
        
        
        self.listingMenuCV?.register(UINib(nibName: "ProfileMenuCell", bundle: nil), forCellWithReuseIdentifier: menuCellID)
        
        self.layout?.itemSize = CGSize(width: self.frame.width / 3, height: self.frame.height - 5)
        
        self.layout?.minimumLineSpacing = 0
        
        setDelegateView()
        
        
        setupHorizontalBar()
        
    }
    
    
    func setDelegateView() {
        
        
        self.listingMenuCV?.delegate = self
        self.listingMenuCV?.dataSource = self
        
        print("**** the delegate: \(self.listingMenuCV?.delegate)")
        print("**** the datasource: \(self.listingMenuCV?.dataSource)")
        
    }
    
    
    
    
    //Mark: setup the horizontal bar view to know which cell was selected
    
    func setupHorizontalBar() {
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = UIColor.rgb(255, green: 0, blue: 128)
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalBarView)
        
        horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
        horizontalBarLeftAnchorConstraint?.isActive = true
        horizontalBarLeftAnchorConstraint?.identifier = "HorizontalBarConstraint"
        
        horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        
        
    }
    
    
    func scrollToMenuIndex(_ menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        listingMenuCV?.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition(), animated: true)
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //print("**** the delegate from number of cell: \(listingMenuCV?.delegate)")
        
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let firstCell = collectionView.dequeueReusableCell(withReuseIdentifier: menuCellID, for: indexPath) as! ProfileMenuCell
        
        firstCell.titleForLabel = titles[indexPath.row]
        
        
        firstCell.setupViews()
        
        return firstCell
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let x = CGFloat(indexPath.item) * frame.width / 3
        horizontalBarLeftAnchorConstraint?.constant = x
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.layoutIfNeeded()
        }, completion: nil)
        
        
        
        
        
        
        
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        // When the user touch the cell
        
        
        let selectedCell = collectionView.cellForItem(at: indexPath)
        
        selectedCell?.backgroundColor = UIColor.cyan
        
        // print("the index touch: \(indexPath.row)")
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        //User release the cell
        
        
        let selectedCell = collectionView.cellForItem(at: indexPath)
        
        selectedCell?.backgroundColor = UIColor.clear
        
        // print("the index touch: \(indexPath.row)")
    }
    
    
    
    
    
    
}

