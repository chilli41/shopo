//
//  AddAddressCell.swift
//  Showpo
//
//  Created by Thadz on 18/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class AddAddressCell: UITableViewCell {

    let button_addAddress = UIButton()
    let label_deliveryOptions = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        button_addAddress.setTitle("ADD ANOTHER ADDRESS", forState: .Normal)
        button_addAddress.titleLabel?.font = UIFont(name: "OpenSans-Semibold", size: 18.0)
        button_addAddress.setTitleColor(UIColor(0x585858), forState: .Normal)
        button_addAddress.layer.borderColor = UIColor(0x585858).CGColor
        button_addAddress.layer.borderWidth = 1.0
        contentView.addSubview(button_addAddress)
        
        label_deliveryOptions.text = "DELIVERY OPTIONS"
        label_deliveryOptions.textColor = UIColor(0x585858)
        label_deliveryOptions.font = UIFont(name: "OpenSans-Semibold", size: 16.0)
        label_deliveryOptions.sizeToFit()
        label_deliveryOptions.textAlignment = .Center
        contentView.addSubview(label_deliveryOptions)
        
    }
    
    override func layoutSubviews() {
        button_addAddress.anchorAndFillEdge(.Top, xPad: 5.0, yPad: 16.0, otherSize: 50.0)
        label_deliveryOptions.align(.UnderCentered, relativeTo: button_addAddress, padding: 24.0, width: contentView.frame.size.width, height: AutoHeight)
        
        let upperDivider = UIView(frame: CGRectZero)
        upperDivider.backgroundColor = UIColor(0x585858)
        contentView.addSubview(upperDivider)
        
        upperDivider.align(.UnderCentered, relativeTo: label_deliveryOptions, padding: 15.0, width: contentView.frame.size.width, height: 1.0)
    }
}
