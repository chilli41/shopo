//
//  WantMoreCell.swift
//  Showpo
//
//  Created by Thadz on 21/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class WantMoreCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    var array_styleImage: [String] = []
    var array_stylePrice: [String] = []
    private let styleCollectionCellIdentifier = "StyleCollectionCellIdentifier"

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let styleCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.clearColor()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    func setupViews() {
        backgroundColor = UIColor.clearColor()
        
        addSubview(styleCollectionView)
        
        styleCollectionView.dataSource = self
        styleCollectionView.delegate = self
        
        styleCollectionView.registerClass(StyleCollectionCell.self, forCellWithReuseIdentifier: styleCollectionCellIdentifier)
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array_styleImage.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(styleCollectionCellIdentifier, forIndexPath: indexPath) as! StyleCollectionCell
        cell.imageView_style.image = UIImage(named: array_styleImage[indexPath.row])
        cell.label_stylePrice.text = array_stylePrice[indexPath.row]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(101.0, 160.0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    override func layoutSubviews() {
        let label_wantMore = prepareLabel("WANT MORE?", font: UIFont(name: "OpenSans-Semibold", size: 18.0)!)
        contentView.addSubview(label_wantMore)
        label_wantMore.anchorAndFillEdge(.Top, xPad: 0.0, yPad: 15.0, otherSize: AutoHeight)
        
        let label_treatSelf = prepareLabel("Go Ahead And Treat Yourself!", font: UIFont(name: "OpenSans", size: 16.0)!)
        contentView.addSubview(label_treatSelf)
        label_treatSelf.align(.UnderCentered, relativeTo: label_wantMore, padding: 5.0, width: label_treatSelf.frame.size.width, height: AutoHeight)
        
        styleCollectionView.align(.UnderCentered, relativeTo: label_treatSelf, padding: 14.0, width: contentView.frame.size.width, height: 160.0)
    }
    
    func prepareLabel(text: String, font: UIFont) -> UILabel{
        let label = UILabel(frame: CGRectZero)
        label.text = text
        label.font = font
        label.textColor = UIColor(0x585858)
        label.textAlignment = .Center
        label.sizeToFit()
        
        return label
    }

}
