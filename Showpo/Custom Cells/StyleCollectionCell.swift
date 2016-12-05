//
//  StyleCollectionCell.swift
//  Showpo
//
//  Created by Thadz on 20/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit

class StyleCollectionCell: UICollectionViewCell {
    
    let imageView_style = UIImageView()
    let label_stylePrice = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        
        imageView_style.contentMode = .ScaleAspectFill
        contentView.addSubview(imageView_style)
        
        label_stylePrice.backgroundColor = UIColor.whiteColor().alpha(0.5)
        label_stylePrice.font = UIFont(name: "OpenSans", size: 14.0)
        label_stylePrice.textAlignment = .Center
        contentView.addSubview(label_stylePrice)
    }
    
    override func layoutSubviews() {
        imageView_style.anchorAndFillEdge(.Top, xPad: 0.0, yPad: 0.0, otherSize: 160.0)
        label_stylePrice.anchorAndFillEdge(.Bottom, xPad: 0.0, yPad: 0.0, otherSize: 31.0)
    }
}
