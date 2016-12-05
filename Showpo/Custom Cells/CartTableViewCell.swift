//
//  CartTableViewCell.swift
//  Showpo
//
//  Created by Thadz on 09/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon

class CartTableViewCell: UITableViewCell {
    
    var image_productImage: UIImageView!
    var label_productName: UILabel!
    var label_productQty: UILabel!
    var label_productSize: UILabel!
    var label_productPrice: UILabel!
    
    let label_qty = UILabel()
    let label_size = UILabel()
    let image_remove = UIImageView()
    
    let button_incQty = UIButton()
    let button_decQty = UIButton()
    
    var isConfirmation: Bool = false
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setupViews(){
        image_productImage = UIImageView(frame: CGRectZero)
        image_productImage.image = UIImage(named: "item_1_image.jpg")
        image_productImage.contentMode = .ScaleAspectFit
        contentView.addSubview(image_productImage)
        
        label_productName = UILabel(frame: CGRectZero)
        label_productName.font = UIFont(name: "OpenSans-Semibold", size: 12.0)
        //        label_productName.backgroundColor = UIColor.blueColor()
        label_productName.sizeToFit()
        contentView.addSubview(label_productName)
        
        label_productQty = UILabel(frame: CGRectZero)
        label_productQty.textAlignment = .Center
        label_productQty.font = UIFont(name: "OpenSans-Semibold", size: 12.0)
        contentView.addSubview(label_productQty)
        
        label_productSize = UILabel(frame: CGRectZero)
        label_productSize.font = UIFont(name: "OpenSans-Semibold", size: 12.0)
        label_productSize.sizeToFit()
        contentView.addSubview(label_productSize)
        
        label_productPrice = UILabel(frame: CGRectZero)
        label_productPrice.textAlignment = .Right
        label_productPrice.font = UIFont(name: "OpenSans-Bold", size: 16.0)
        contentView.addSubview(label_productPrice)
        
        label_qty.text = "QTY:"
        label_qty.font = UIFont(name: "OpenSans-Semibold", size: 12.0)
        label_qty.sizeToFit()
        contentView.addSubview(label_qty)
        
        label_size.text = "SIZE:"
        label_size.font = UIFont(name: "OpenSans-Semibold", size: 12.0)
        //        label_size.backgroundColor = UIColor.blueColor()
        label_size.sizeToFit()
        contentView.addSubview(label_size)
        
        image_remove.image = UIImage(named: "cart-delete-icn")
        image_remove.contentMode = .Center
        contentView.addSubview(image_remove)
        
        button_incQty.setTitle("+", forState: .Normal)
        button_incQty.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        button_decQty.setTitle("-", forState: .Normal)
        button_decQty.setTitleColor(UIColor.lightGrayColor(), forState: .Normal)
        contentView.addSubview(button_incQty)
        contentView.addSubview(button_decQty)
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        image_productImage.anchorInCorner(.TopLeft, xPad: 20.0, yPad: 20.0, width: 50.0, height: 70.0)
        
        label_productName.anchorInCorner(.TopLeft, xPad: image_productImage.frame.size.width + 30.0, yPad: 20.0, width: contentView.frame.size.width - image_productImage.frame.size.width - 30.0, height: AutoHeight)
        
        label_qty.align(.UnderMatchingLeft, relativeTo: label_productName, padding: 5.0, width: label_qty.frame.size.width, height: AutoHeight)
        
        label_size.align(.UnderMatchingLeft, relativeTo: label_qty, padding: 5.0, width: label_size.frame.size.width, height: AutoHeight)
        
        
        if isConfirmation{
            button_decQty.align(.ToTheRightCentered, relativeTo: label_qty, padding: 3.0, width: 0.0, height: 20.0)
        }
        else{
            button_decQty.align(.ToTheRightCentered, relativeTo: label_qty, padding: 10.0, width: 20.0, height: 20.0)
        }
        
        button_decQty.layer.borderWidth = 1.0
        button_decQty.layer.borderColor = UIColor.lightGrayColor().CGColor
        button_decQty.layer.cornerRadius = 10.0
        
        label_productQty.align(.ToTheRightMatchingBottom, relativeTo: button_decQty, padding: 2.0, width: 20.0, height: 20.0)
        label_productSize.align(.ToTheRightCentered, relativeTo: label_size, padding: 10.0, width: 20.0, height: 20.0)
        
        button_incQty.align(.ToTheRightCentered, relativeTo: button_decQty, padding: 24.0, width: 20.0, height: 20.0)
        button_incQty.layer.borderWidth = 1.0
        button_incQty.layer.borderColor = UIColor.lightGrayColor().CGColor
        button_incQty.layer.cornerRadius = 10.0
        
        label_productPrice.anchorInCorner(.TopRight, xPad: 20.0, yPad: 40.0, width: label_productPrice.frame.size.width, height: AutoHeight)
        image_remove.align(.ToTheLeftCentered, relativeTo: label_productPrice, padding: 2.0, width: 30.0, height: 30.0)
    }
}
