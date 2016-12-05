//
//  ProductVariationCell.swift
//  Showpo
//
//  Created by Thadz on 07/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon

class ProductVariationCell: UITableViewCell {
    var label_color: UILabel!
    var label_size: UILabel!
    let colorSpring = UIView()
    let sizeSpring = UIView()
    let button_addToCart = UIButton()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        label_color = UILabel(frame: CGRectZero)
        label_color.text = "COLOR"
        label_color.font = UIFont(name: "OpenSans-Semibold", size: 13.0)
        colorSpring.frame = CGRectZero
        label_color.sizeToFit()
        label_size = UILabel(frame: CGRectZero)
        label_size.text = "SIZE"
        label_size.font = UIFont(name: "OpenSans-Semibold", size: 13.0)
        sizeSpring.frame = CGRectZero
        label_size.sizeToFit()
        
        button_addToCart.backgroundColor = UIColor(0x478DC4)
        button_addToCart.titleLabel?.font = UIFont(name: "OpenSans-Bold", size: 19.0)
        button_addToCart.setTitle("ADD TO CART", forState: .Normal)
        
        contentView.addSubview(button_addToCart)

        contentView.addSubview(label_color)
        contentView.addSubview(label_size)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label_color.anchorInCorner(.TopLeft, xPad: 5.0, yPad: 5.0, width: 70.0, height: 10.0)
        label_size.anchorInCorner(.TopLeft, xPad: 5.0, yPad: label_color.frame.size.height + 30.0, width: 70.0, height: 10.0)
        
        colorSpring.anchorInCorner(.TopLeft, xPad: 5.0, yPad: 5.0, width: 70.0, height: 10.0)
        sizeSpring.anchorInCorner(.TopLeft, xPad: 5.0, yPad: label_color.frame.size.height + 30.0, width: 70.0, height: 10.0)
        
//        button_addToCart.anchorToEdge(.Top, padding: 70.0, width: contentView.frame.size.width - 40.0, height: 50.0)
        
        button_addToCart.anchorAndFillEdge(.Bottom, xPad: 20.0, yPad: 20.0, otherSize: 40.0)
        button_addToCart.layer.cornerRadius = button_addToCart.frame.size.width/128.0
    }
}
