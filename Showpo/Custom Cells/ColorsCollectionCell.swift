//
//  ColorsCollectionCell.swift
//  Showpo
//
//  Created by Dongie on 21/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class ColorsCollectionCell: UICollectionViewCell {

    let view_colorVariation = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(view_colorVariation)
    }
    
    override func layoutSubviews() {
        view_colorVariation.layer.borderWidth = 1.0
        view_colorVariation.layer.borderColor = UIColor(0xBDBDBD).CGColor
        view_colorVariation.fillSuperview()
    }
}
