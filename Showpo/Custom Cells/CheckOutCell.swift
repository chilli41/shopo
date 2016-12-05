//
//  CheckOutCell.swift
//  Showpo
//
//  Created by Thadz on 09/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit

class CheckOutCell: UITableViewCell {

    
    let button_checkout = UIButton()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        button_checkout.frame = CGRectZero
        button_checkout.backgroundColor = UIColor(0x478DC4)
        button_checkout.titleLabel?.font = UIFont(name: "OpenSans-Bold", size: 18.0)
        button_checkout.titleLabel?.textColor = UIColor.whiteColor()
        button_checkout.setTitle("C H E C K O U T", forState: .Normal)
        
        contentView.addSubview(button_checkout)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        button_checkout.fillSuperview(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0)
        button_checkout.layer.cornerRadius = button_checkout.frame.size.height/16
    }
}
