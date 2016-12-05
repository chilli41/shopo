//
//  SizesCollectionCell.swift
//  Showpo
//
//  Created by Thadz on 21/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class SizesCollectionCell: UICollectionViewCell {
    
    let label_size = UILabel()
    let view_size = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(label_size)
        contentView.addSubview(view_size)
        
    }
    
    override func layoutSubviews() {
        view_size.fillSuperview()
        view_size.layer.cornerRadius = view_size.frame.size.width/2.0
        view_size.layer.borderColor = UIColor(0x585858).CGColor
        view_size.layer.borderWidth = 1.0
        
        label_size.font = UIFont(name: "OpenSans", size: 14.0)
        label_size.textColor = UIColor(0x585858)
        label_size.sizeToFit()
        label_size.anchorInCenter(width: label_size.frame.size.width, height: label_size.frame.size.height)
    }

}
