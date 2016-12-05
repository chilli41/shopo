//
//  ShippingAddressCell.swift
//  Showpo
//
//  Created by Thadz on 11/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon

class ShippingAddressCell: UITableViewCell {
    
    let view_addressRadio = UIView(frame: CGRectZero)
    let bottom_divider = UIView(frame: CGRectZero)
    var label_userName: UILabel!
    var label_userStreetAddress: UILabel!
    var label_userCityAddress: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        contentView.backgroundColor = UIColor(0xF8F8F8)
        bottom_divider.backgroundColor = UIColor.lightGrayColor()
        contentView.addSubview(bottom_divider)
        
        //radio button 24x24
        let view_radioContainer = UIView(frame: CGRectZero)
        view_radioContainer.layer.borderColor = UIColor.lightGrayColor().CGColor
        view_radioContainer.layer.borderWidth = 1.0
        contentView.addSubview(view_radioContainer)
        view_radioContainer.anchorInCorner(.TopLeft, xPad: 16.0, yPad: 41.0, width: 24.0, height: 24.0)
        view_radioContainer.layer.cornerRadius = view_radioContainer.frame.size.width/2.0
        
//        view_addressRadio.backgroundColor = UIColor.greenColor()
        view_radioContainer.addSubview(view_addressRadio)
        view_addressRadio.fillSuperview(left: 3.0, right: 3.0, top: 3.0, bottom: 3.0)
        view_addressRadio.layer.cornerRadius = view_addressRadio.frame.size.width/2.0
        
        label_userName = UILabel(frame: CGRectZero)
        label_userName.font = UIFont(name: "OpenSans-Semibold", size: 22.0)
        contentView.addSubview(label_userName)
        
        label_userStreetAddress = UILabel(frame: CGRectZero)
        label_userStreetAddress.font = UIFont(name: "OpenSans", size: 14.0)
        contentView.addSubview(label_userStreetAddress)
        
        label_userCityAddress = UILabel(frame: CGRectZero)
        label_userCityAddress.font = UIFont(name: "OpenSans", size: 14.0)
        contentView.addSubview(label_userCityAddress)
    }
    
    override func layoutSubviews() {
        label_userName.anchorInCorner(.TopLeft, xPad: 64.0, yPad: 21.0, width: contentView.frame.size.width, height: AutoHeight)
        label_userStreetAddress.align(.UnderMatchingLeft, relativeTo: label_userName, padding: 2.0, width: contentView.frame.size.width, height: AutoHeight)
        label_userCityAddress.align(.UnderMatchingLeft, relativeTo: label_userStreetAddress, padding: 1.0, width: contentView.frame.size.width, height: AutoHeight)
        bottom_divider.anchorToEdge(.Top, padding: 107.0, width: contentView.frame.size.width, height: 1.0)
    }

}
