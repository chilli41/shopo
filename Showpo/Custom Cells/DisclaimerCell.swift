//
//  DisclaimerCell.swift
//  Showpo
//
//  Created by Thadz on 20/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class DisclaimerCell: UITableViewCell {
    
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
        let label_disclaimer = UILabel(frame: CGRectZero)
        label_disclaimer.text = "ABN: 30156041913 COPYRIGHT (C) 2016 SHOWPO \nALL RIGHTS RESERVED\nShow Pony Group Pty Ltd"
        label_disclaimer.numberOfLines = 0
        label_disclaimer.textAlignment = .Center
        label_disclaimer.font = UIFont(name: "OpenSans", size: 10.0)
        label_disclaimer.sizeToFit()
        contentView.addSubview(label_disclaimer)
        label_disclaimer.anchorInCenter(width: contentView.frame.size.width - 40.0, height: AutoHeight)
    }

}
