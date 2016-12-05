//
//  HomeHeaderTableViewCell.swift
//  Showpo
//
//  Created by Thadz on 28/10/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit

class HomeHeaderTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var array_newArrivals: NSArray!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    let newArrivalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    func setupViews(){
        contentView.addSubview(newArrivalCollectionView)
        newArrivalCollectionView.fillSuperview()
        
        newArrivalCollectionView.dataSource = self
        newArrivalCollectionView.delegate = self
    }
    
    
    //Collection View Delegate Methods
    
    //Collection View Data Source Delegates
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array_newArrivals.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCellWithReuseIdentifier("NewArrivalCollectionViewCellIdentifier", forIndexPath: indexPath)
    }
    
}

class NewArrivalCollectionViewCell: UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}
