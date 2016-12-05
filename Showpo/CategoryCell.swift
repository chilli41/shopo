//
//  CategoryCell.swift
//  Showpo
//
//  Created by Thadz on 18/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class CategoryCell: UICollectionViewCell {
    
    var image_category: UIImageView!
    var label_category: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        image_category = UIImageView(frame: CGRectZero)
        contentView.addSubview(image_category)
        
        label_category = UILabel(frame: CGRectZero)
        label_category.font = UIFont(name: "OpenSans-Semibold", size: 12.0)
        label_category.textAlignment = .Center
        contentView.addSubview(label_category)
        
        backgroundColor = UIColor.whiteColor()
        let rightDivider = UIView()
        rightDivider.backgroundColor = UIColor(0x585858)
        contentView.addSubview(rightDivider)
        
        rightDivider.anchorAndFillEdge(.Right, xPad: 0.0, yPad: 0.0, otherSize: 1.0)
    }
    
    override func layoutSubviews() {
        image_category.anchorInCenter(width: 45.0, height: 45.0)
        label_category.align(.UnderCentered, relativeTo: image_category, padding: 5.0, width: contentView.frame.size.width, height: AutoHeight)
    }
}
