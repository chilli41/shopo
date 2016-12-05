//
//  PaymentCell.swift
//  Showpo
//
//  Created by Thadz on 14/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class PaymentCell: UITableViewCell {
    
    var image_modeOfPayment: UIImageView!
    var label_modeOfPayment: UILabel!
    let view_addressRadio = UIView(frame: CGRectZero)
    let view_radioContainer = UIView(frame: CGRectZero)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        //radio button 24x24
        
        view_radioContainer.layer.borderColor = UIColor.lightGrayColor().CGColor
        view_radioContainer.layer.borderWidth = 1.0
        contentView.addSubview(view_radioContainer)
        
        view_radioContainer.addSubview(view_addressRadio)
        
        
        image_modeOfPayment = UIImageView(frame: CGRectZero)
        image_modeOfPayment.contentMode = .Center
        contentView.addSubview(image_modeOfPayment)
        
        label_modeOfPayment = UILabel(frame: CGRectZero)
        label_modeOfPayment.font = UIFont(name: "OpenSans", size: 16.0)
        label_modeOfPayment.textColor = UIColor(0x585858)
        contentView.addSubview(label_modeOfPayment)
    }
    
    override func layoutSubviews() {
        image_modeOfPayment.anchorInCorner(.TopLeft, xPad: 12.0, yPad: 25.0, width: 30.0, height: 30.0)
        label_modeOfPayment.align(.ToTheRightCentered, relativeTo: image_modeOfPayment, padding: 14.0, width: 100.0, height: AutoHeight)
        
        view_radioContainer.anchorInCorner(.TopRight, xPad: 39.0, yPad: 25.0, width: 24.0, height: 24.0)
        view_radioContainer.layer.cornerRadius = view_radioContainer.frame.size.width/2.0
        
        view_addressRadio.fillSuperview(left: 3.0, right: 3.0, top: 3.0, bottom: 3.0)
        view_addressRadio.layer.cornerRadius = view_addressRadio.frame.size.width/2.0
    }
}
