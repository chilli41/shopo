//
//  CheckOutProcessNextCell.swift
//  Showpo
//
//  Created by Thadz on 15/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon

class CheckOutProcessNextCell: UITableViewCell {
    
    let button_next = UIButton()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        button_next.backgroundColor = UIColor(0x478DC4)
        button_next.setTitle("N E X T", forState: .Normal)
        button_next.titleLabel?.font = UIFont(name: "OpenSans-Semibold", size: 18.0)
        contentView.addSubview(button_next)
    }
    
    override func layoutSubviews() {
        button_next.fillSuperview(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0)
        button_next.layer.cornerRadius = button_next.frame.size.width/128
    }
}
