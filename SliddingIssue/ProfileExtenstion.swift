//
//  ProfileExtenstion.swift
//  SliddingIssue
//
//  Created by Mike Milord on 30/03/2017.
//  Copyright © 2017 Purple Pear. All rights reserved.
//


import UIKit

extension ProfileVC: UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout   {
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: profileHeaderCell, for: indexPath) as! OnTopHeaderView
        
        
        if kind == UICollectionElementKindSectionHeader {
            return headerCell
        }
        
        return UICollectionReusableView()
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if indexPath.row == 0 {
            let cellBio = collectionView.dequeueReusableCell(withReuseIdentifier: profileCell1, for: indexPath) as! ProfileDetailsCell
            
            return cellBio
        }
            
         

            
        else if indexPath.row == 1 {
            let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: profileMenuCell, for: indexPath) as! ListingMenuCell
            
            menuCell.titles = ["My Listing","Favs","Sold"]
            
            print("+++++++++++= Calling setup +++++++++++++==")
            
            menuCell.setupViews()
            
            return menuCell
        }
            
        else {
            
            //Listing Items cell
            let itemsCell = collectionView.dequeueReusableCell(withReuseIdentifier: profileItemsCell, for: indexPath) as! ProfileItemsCell
            
            //itemsCell.setupViews()
            
            return itemsCell
            
            
        }
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if indexPath.row == 0 {
            
            
            //Cell for the bio and name
            return CGSize(width: profileCollectionView.frame.width, height: 100)
        }
            
   
 
            
        else if indexPath.row == 1  {
            
            //Listing Menu cell
            return CGSize(width: profileCollectionView.frame.width, height: 50)
        }
            
        else {
            
            //Listing Items cells
            return CGSize(width: profileCollectionView.frame.width, height: 300)
        }
        
        
        
        
    }
    
    
}

