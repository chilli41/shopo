//
//  OrderCostCell.swift
//  Showpo
//
//  Created by Thadz on 20/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class OrderCostCell: UITableViewCell {
    let label_subtotal = UILabel()
    let label_shipping = UILabel()
    let label_total = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        label_subtotal.textColor = UIColor(0x292828)
        label_subtotal.font = UIFont(name: "OpenSans", size: 12.0)
        label_subtotal.textAlignment = .Right
        contentView.addSubview(label_subtotal)
        
        label_shipping.textColor = UIColor(0x292828)
        label_shipping.font = UIFont(name: "OpenSans", size: 12.0)
        label_shipping.textAlignment = .Right
        contentView.addSubview(label_shipping)
        
        label_total.textColor = UIColor(0x585858)
        label_total.font = UIFont(name: "OpenSans-Semibold", size: 16.0)
        label_total.textAlignment = .Right
        contentView.addSubview(label_total)
        
        let subtotal = UILabel()
        subtotal.text = "Subtotal: "
        subtotal.textColor = UIColor(0xAAADB5)
        subtotal.font = UIFont(name: "OpenSans", size: 12.0)
        contentView.addSubview(subtotal)
        subtotal.sizeToFit()
        
        let shipping = UILabel()
        shipping.text = "Shipping: "
        shipping.textColor = UIColor(0xAAADB5)
        shipping.font = UIFont(name: "OpenSans", size: 12.0)
        contentView.addSubview(shipping)
        shipping.sizeToFit()
        
        let total = UILabel()
        total.text = "Total: "
        total.textColor = UIColor(0x585858)
        total.font = UIFont(name: "OpenSans-Semibold", size: 16.0)
        contentView.addSubview(total)
        total.sizeToFit()
        
        
        subtotal.anchorInCorner(.TopLeft, xPad: 14.0, yPad: 16.0, width: subtotal.frame.size.width, height: AutoHeight)
        shipping.align(.UnderMatchingLeft, relativeTo: subtotal, padding: 16.0, width: shipping.frame.size.width, height: AutoHeight)
        total.align(.UnderMatchingLeft, relativeTo: shipping, padding: 20.0, width: total.frame.size.width, height: AutoHeight)
        
    }
    
    override func layoutSubviews() {
        label_subtotal.anchorInCorner(.TopRight, xPad: 14.0, yPad: 16.0, width: contentView.frame.size.width, height: AutoHeight)
        label_shipping.align(.UnderMatchingRight, relativeTo: label_subtotal, padding: 16.0, width: contentView.frame.size.width, height: AutoHeight)
        label_total.align(.UnderMatchingRight, relativeTo: label_shipping, padding: 20.0, width: contentView.frame.size.width, height: AutoHeight)
    }

}
