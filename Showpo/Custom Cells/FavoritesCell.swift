//
//  FavoritesCell.swift
//  Showpo
//
//  Created by Thadz on 20/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class FavoritesCell: UITableViewCell {
    
    let imageView_remove = UIImageView()
    let image_remove = UIImage(named: "cart-delete-icn")
    let label_productName = UILabel()
    var imageView_productImage: UIImageView!
    let image_cart = UIImage(named: "addtocart")
    let imageView_cart = UIImageView()
    let label_productPrice = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        imageView_productImage = UIImageView(frame: CGRectZero)
        imageView_productImage.image = UIImage(named: "item_1_image.jpg")
        imageView_productImage.contentMode = .ScaleAspectFit
        contentView.addSubview(imageView_productImage)
        
        imageView_remove.image = UIImage(named: "cart-delete-icn")
        imageView_remove.contentMode = .Center
        contentView.addSubview(imageView_remove)
        
        imageView_cart.image = image_cart
        contentView.addSubview(imageView_cart)
        
        label_productName.font = UIFont(name: "OpenSans-Semibold", size: 12.0)
        label_productName.textColor = UIColor(0x292828)
        label_productName.numberOfLines = 2
        label_productName.textAlignment = .Left
        contentView.addSubview(label_productName)
        
        label_productPrice.font = UIFont(name: "OpenSans-Semibold", size: 16.0)
        label_productPrice.textColor = UIColor(0x292828)
        contentView.addSubview(label_productPrice)
    }
    
    override func layoutSubviews() {
        imageView_productImage.anchorInCorner(.TopLeft, xPad: 41.0, yPad: 10.0, width: 45.0, height: 70.0)
        imageView_remove.align(.ToTheLeftCentered, relativeTo: imageView_productImage, padding: 12.0, width: image_remove!.size.width, height: image_remove!.size.height)
        imageView_cart.anchorInCorner(.TopRight, xPad: 12.0, yPad: imageView_remove.frame.origin.y, width: image_cart!.size.width, height: image_cart!.size.height)
        
        label_productName.anchorInCorner(.TopLeft, xPad: imageView_productImage.frame.origin.x + imageView_productImage.frame.size.width + 12.0, yPad: 12.0, width: 200.0, height: AutoHeight)
        label_productPrice.align(.UnderMatchingLeft, relativeTo: label_productName, padding: 5.0, width: 200.0, height: AutoHeight)
        
        let bottomDivider = UIView(frame: CGRectZero)
        bottomDivider.backgroundColor = UIColor.lightGrayColor()
        contentView.addSubview(bottomDivider)
        
        bottomDivider.anchorAndFillEdge(.Bottom, xPad: 0.0, yPad: 0.0, otherSize: 1.0)
    }
}
