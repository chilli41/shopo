//
//  ProductDescriptionCell.swift
//  Showpo
//
//  Created by Thadz on 08/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class ProductDescriptionCell: UITableViewCell {
    let label_itemDescriptionTitle = UILabel()
    var label_itemDescription: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        label_itemDescriptionTitle.frame = CGRectZero
        label_itemDescriptionTitle.text = "ITEM DESCRIPTION"
        label_itemDescriptionTitle.font = UIFont(name: "OpenSans-Semibold", size: 18.0)
        label_itemDescriptionTitle.sizeToFit()
        contentView.addSubview(label_itemDescriptionTitle)
        label_itemDescriptionTitle.anchorInCorner(.TopLeft, xPad: 5.0, yPad: 5.0, width: contentView.frame.size.width, height: AutoHeight)
        
        label_itemDescription = UILabel(frame: CGRectZero)
        label_itemDescription.font = UIFont(name: "OpenSans", size: 14.0)
        label_itemDescription.textColor = UIColor(0x585858)
        label_itemDescription.numberOfLines = 0
        contentView.addSubview(label_itemDescription)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        label_itemDescription.anchorToEdge(.Top, padding: label_itemDescriptionTitle.frame.origin.y + label_itemDescriptionTitle.frame.size.height, width: contentView.frame.size.width - 20.0, height: AutoHeight)
        
//        label_itemDescription.anchorInCorner(.TopLeft, xPad: 10.0, yPad: label_itemDescriptionTitle.frame.origin.y + label_itemDescriptionTitle.frame.size.height, width: contentView.frame.size.width - 5.0, height: AutoHeight)
    }
}
