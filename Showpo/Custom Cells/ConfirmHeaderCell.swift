//
//  ConfirmHeaderCell.swift
//  Showpo
//
//  Created by Dongie on 21/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class ConfirmHeaderCell: UITableViewCell {
    
    let image_confirmCheck = UIImage(named: "confirm-check")
    
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
        let imageView_confirmCheck = UIImageView(image: image_confirmCheck!)
        contentView.addSubview(imageView_confirmCheck)
        
        imageView_confirmCheck.anchorInCorner(.TopLeft, xPad: contentView.frame.size.width/2 - image_confirmCheck!.size.width/2, yPad: 34.0, width: image_confirmCheck!.size.width, height: image_confirmCheck!.size.height)
        
        //17px
        let label_success = UILabel(frame: CGRectZero)
        label_success.text = "ORDER SUCCESSFUL"
        label_success.font = UIFont(name: "OpenSans-Semibold", size: 18.0)
        label_success.textColor = UIColor(0x22AE4D)
        label_success.sizeToFit()
        contentView.addSubview(label_success)
        
        label_success.align(.UnderCentered, relativeTo: imageView_confirmCheck, padding: 17.0, width: label_success.frame.size.width, height: label_success.frame.size.height)
        
        //8px
        let label_thankYou = UILabel(frame: CGRectZero)
        label_thankYou.text = "Thank you for your order!"
        label_thankYou.font = UIFont(name: "OpenSans", size: 16.0)
        label_thankYou.textColor = UIColor(0x9F9F9F)
        label_thankYou.sizeToFit()
        contentView.addSubview(label_thankYou)
        
        label_thankYou.align(.UnderCentered, relativeTo: label_success, padding: 8.0, width: label_thankYou.frame.size.width, height: label_thankYou.frame.size.height)
        
        let bottomDivider = UIView(frame: CGRectZero)
        bottomDivider.backgroundColor = UIColor(0x585858)
        contentView.addSubview(bottomDivider)
        
        //340
        bottomDivider.anchorToEdge(.Bottom, padding: 0.0, width: contentView.frame.size.width, height: 1.0)
    }
}
