//
//  HomeTableViewCell.swift
//  Showpo
//
//  Created by Thadz on 26/10/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon

class HomeTableViewCell: UITableViewCell {
    
    var image_leftItem: UIImageView!
    var image_rightItem: UIImageView!
    var label_leftDescription: UILabel!
    var label_rightDescription: UILabel!
    var label_leftPrice: UILabel!
    var label_rightPrice: UILabel!
    
    let button_leftItem = UIButton()
    let button_rightItem = UIButton()
    
    let button_leftFavorite = UIButton()
    let button_rightFavorite = UIButton()
    let button_leftCart = UIButton()
    let button_rightCart = UIButton()
    
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
        backgroundColor = UIColor.clearColor()
        selectionStyle = .None
        
        image_leftItem = UIImageView(frame: CGRectZero)
        image_leftItem.backgroundColor = UIColor.redColor()
        contentView.addSubview(image_leftItem)
        image_rightItem = UIImageView(frame: CGRectZero)
        image_rightItem.backgroundColor = UIColor.blueColor()
        contentView.addSubview(image_rightItem)
        
        button_leftCart.setImage(UIImage(named:"addtocart"), forState: .Normal)
        button_rightCart.setImage(UIImage(named:"addtocart"), forState: .Normal)
        
        contentView.addSubview(button_leftCart)
        contentView.addSubview(button_rightCart)
        
        contentView.addSubview(button_leftItem)
        contentView.addSubview(button_rightItem)
        
        label_leftDescription = UILabel(frame: CGRectZero)
        label_leftDescription.numberOfLines = 0
        label_leftDescription.textAlignment = .Center
        label_leftDescription.font = UIFont(name: "OpenSans", size: 12.0)
        //        label_leftDescription.backgroundColor = UIColor.greenColor()
        contentView.addSubview(label_leftDescription)
        label_rightDescription = UILabel(frame: CGRectZero)
        label_rightDescription.numberOfLines = 0
        label_rightDescription.textAlignment = .Center
        label_rightDescription.font = UIFont(name: "OpenSans", size: 12.0)
        contentView.addSubview(label_rightDescription)
        
        label_leftPrice = UILabel(frame: CGRectZero)
        label_leftPrice.textAlignment = .Center
        label_leftPrice.font = UIFont(name: "OpenSans", size: 16.0)
        //        label_leftPrice.backgroundColor = UIColor.blueColor()
        contentView.addSubview(label_leftPrice)
        label_rightPrice = UILabel(frame: CGRectZero)
        label_rightPrice.textAlignment = .Center
        label_rightPrice.font = UIFont(name: "OpenSans", size: 16.0)
        contentView.addSubview(label_rightPrice)
        
        button_leftFavorite.backgroundColor = UIColor.whiteColor().alpha(0.5)
        button_leftFavorite.setImage(UIImage(named:"fave-now" ), forState: .Normal)
        button_leftFavorite.setImage(UIImage(named: "fave-color"), forState: .Selected)
        button_leftFavorite.contentHorizontalAlignment = .Center
        button_leftFavorite.contentVerticalAlignment = .Center
        contentView.addSubview(button_leftFavorite)
        
        button_rightFavorite.backgroundColor = UIColor.whiteColor().alpha(0.5)
        button_rightFavorite.setImage(UIImage(named:"fave-now" ), forState: .Normal)
        button_rightFavorite.setImage(UIImage(named: "fave-color"), forState: .Selected)
        button_rightFavorite.contentHorizontalAlignment = .Center
        button_rightFavorite.contentVerticalAlignment = .Center
        contentView.addSubview(button_rightFavorite)
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width_item = contentView.frame.size.width/2.0 - 10.0
        
        image_leftItem.anchorInCorner(.TopLeft, xPad: 5.0, yPad: 5.0, width: width_item, height: 288.0)
        button_leftItem.anchorInCorner(.TopLeft, xPad: 5.0, yPad: 5.0, width: width_item, height: 288.0)
        image_rightItem.anchorInCorner(.TopRight, xPad: 5.0, yPad: 5.0, width: width_item, height: 288.0)
        button_rightItem.anchorInCorner(.TopRight, xPad: 5.0, yPad: 5.0, width: width_item, height: 288.0)
        
        label_leftDescription.align(.UnderMatchingLeft, relativeTo: image_leftItem, padding: 5.0, width: image_leftItem.frame.size.width, height: AutoHeight)
        label_rightDescription.align(.UnderMatchingLeft, relativeTo: image_rightItem, padding: 5.0, width: image_rightItem.frame.size.width, height: AutoHeight)
        
        label_leftPrice.align(.UnderMatchingLeft, relativeTo: label_leftDescription, padding: 0.0, width: image_leftItem.frame.size.width, height: AutoHeight)
        label_rightPrice.align(.UnderMatchingLeft, relativeTo: label_rightDescription, padding: 0.0, width: image_rightItem.frame.size.width, height: AutoHeight)
        
        button_leftFavorite.anchorInCorner(.TopLeft, xPad: width_item - 30.0, yPad: 10.0, width: 30.0, height: 30.0)
        button_leftFavorite.layer.cornerRadius = button_leftFavorite.frame.size.width/2.0
        button_rightFavorite.anchorInCorner(.TopRight, xPad: 10.0, yPad: 10.0, width: 30.0, height: 30.0)
        button_rightFavorite.layer.cornerRadius = button_rightFavorite.frame.size.width/2.0
        
        button_leftCart.anchorInCorner(.BottomRight, xPad: image_rightItem.frame.size.width + 15.0, yPad: 5.0, width: 21.0, height: 23.0)
        button_rightCart.anchorInCorner(.BottomRight, xPad: 5.0, yPad: 5.0, width: 21.0, height: 23.0)
    }
}
