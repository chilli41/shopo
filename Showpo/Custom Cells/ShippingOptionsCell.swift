//
//  ShippingOptionsCell.swift
//  Showpo
//
//  Created by Thadz on 18/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class ShippingOptionsCell: UITableViewCell {
    
    let label_shippingOption = UILabel()
    let button_shippingOption = UILabel()
    let view_shippingOptionIndicator = UIView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        label_shippingOption.textColor = UIColor(0x585858)
        label_shippingOption.font = UIFont(name: "OpenSans", size: 16.0)
        label_shippingOption.sizeToFit()
        contentView.addSubview(label_shippingOption)
        
        contentView.addSubview(view_shippingOptionIndicator)
        contentView.addSubview(button_shippingOption)
    }
    
    override func layoutSubviews() {
        label_shippingOption.anchorInCorner(.TopLeft, xPad: 35.0, yPad: 25.0, width: contentView.frame.size.width, height: AutoHeight)
        
        //25 39
        button_shippingOption.anchorInCorner(.TopRight, xPad: 39.0, yPad: 25.0, width: 17.0, height: 17.0)
        button_shippingOption.layer.cornerRadius = button_shippingOption.frame.size.width/2.0
        button_shippingOption.layer.borderWidth = 1.0
        button_shippingOption.layer.borderColor = UIColor(0x585858).CGColor
        
        view_shippingOptionIndicator.anchorInCorner(.TopRight, xPad: 42.0, yPad: 28.0, width: 11.0, height: 11.0)
        view_shippingOptionIndicator.layer.cornerRadius = view_shippingOptionIndicator.frame.size.width/2.0
        
        let lowerDivider = UIView(frame: CGRectZero)
        lowerDivider.backgroundColor = UIColor(0x585858)
        contentView.addSubview(lowerDivider)
        
        lowerDivider.anchorAndFillEdge(.Bottom, xPad: 0.0, yPad: 0.0, otherSize: 1.0)
    }

}
