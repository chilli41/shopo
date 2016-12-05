//
//  BillingDetailsCell.swift
//  Showpo
//
//  Created by Thadz on 21/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class BillingDetailsCell: UITableViewCell {
    
    let view_addressRadio = UIView(frame: CGRectZero)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        
    }
    
    override func layoutSubviews() {
        let label_billingDetails = UILabel(frame: CGRectZero)
        prepareLabel(label_billingDetails, text: "BILLING DETAILS")
        contentView.addSubview(label_billingDetails)
        
        label_billingDetails.anchorAndFillEdge(.Top, xPad: 0.0, yPad: 0.0, otherSize: AutoHeight)
        
        //radio button 24x24
        let view_radioContainer = UIView(frame: CGRectZero)
        view_radioContainer.layer.borderColor = UIColor.lightGrayColor().CGColor
        view_radioContainer.layer.borderWidth = 1.0
        contentView.addSubview(view_radioContainer)
        view_radioContainer.anchorInCorner(.TopLeft, xPad: 60.0, yPad: 41.0, width: 24.0, height: 24.0)
        view_radioContainer.layer.cornerRadius = view_radioContainer.frame.size.width/2.0
        
        //        view_addressRadio.backgroundColor = UIColor.greenColor()
        view_radioContainer.addSubview(view_addressRadio)
        view_addressRadio.fillSuperview(left: 3.0, right: 3.0, top: 3.0, bottom: 3.0)
        view_addressRadio.layer.cornerRadius = view_addressRadio.frame.size.width/2.0
        
        let label_shipAddress = UILabel(frame: CGRectZero)
        prepareLabel(label_shipAddress, text: "Same As Shipping Address")
        contentView.addSubview(label_shipAddress)
        
        label_shipAddress.align(.ToTheRightCentered, relativeTo: view_radioContainer, padding: 8.0, width: label_shipAddress.frame.size.width, height: AutoHeight)
    }
    
    func prepareLabel(label: UILabel, text: String){
        label.text = text
        label.textColor = UIColor(0x585858)
        label.font = UIFont(name: "OpenSans-Semibold", size: 16.0)
        label.textAlignment = .Center
        label.sizeToFit()
    }
}
