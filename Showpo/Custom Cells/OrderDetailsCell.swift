//
//  OrderDetailsCell.swift
//  Showpo
//
//  Created by Thadz on 20/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import HexColor
import Neon

class OrderDetailsCell: UITableViewCell {
    
    let label_orderNumber = UILabel()
    let label_purchaseDate = UILabel()
    let label_billingEmail = UILabel()
    let label_paymentMethod = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        label_orderNumber.textColor = UIColor(0x292828)
        label_orderNumber.font = UIFont(name: "OpenSans", size: 12.0)
        label_orderNumber.textAlignment = .Right
        contentView.addSubview(label_orderNumber)
        
        label_purchaseDate.textColor = UIColor(0x292828)
        label_purchaseDate.font = UIFont(name: "OpenSans", size: 12.0)
        label_purchaseDate.textAlignment = .Right
        contentView.addSubview(label_purchaseDate)
        
        label_billingEmail.textColor = UIColor(0x292828)
        label_billingEmail.font = UIFont(name: "OpenSans", size: 12.0)
        label_billingEmail.textAlignment = .Right
        contentView.addSubview(label_billingEmail)
        
        label_paymentMethod.textColor = UIColor(0x292828)
        label_paymentMethod.font = UIFont(name: "OpenSans", size: 12.0)
        label_paymentMethod.textAlignment = .Right
        contentView.addSubview(label_paymentMethod)
        
        let orderNumber = UILabel()
        orderNumber.text = "Order Number: "
        orderNumber.textColor = UIColor(0xAAADB5)
        orderNumber.font = UIFont(name: "OpenSans", size: 12.0)
        contentView.addSubview(orderNumber)
        orderNumber.sizeToFit()
        
        let purchaseDate = UILabel()
        purchaseDate.text = "Purchase Date: "
        purchaseDate.textColor = UIColor(0xAAADB5)
        purchaseDate.font = UIFont(name: "OpenSans", size: 12.0)
        contentView.addSubview(purchaseDate)
        purchaseDate.sizeToFit()
        
        let billingEmail = UILabel()
        billingEmail.text = "Billing Email: "
        billingEmail.textColor = UIColor(0xAAADB5)
        billingEmail.font = UIFont(name: "OpenSans", size: 12.0)
        contentView.addSubview(billingEmail)
        billingEmail.sizeToFit()
        
        let paymentMethod = UILabel()
        paymentMethod.text = "Payment Method: "
        paymentMethod.textColor = UIColor(0xAAADB5)
        paymentMethod.font = UIFont(name: "OpenSans", size: 12.0)
        contentView.addSubview(paymentMethod)
        paymentMethod.sizeToFit()
        
        orderNumber.anchorInCorner(.TopLeft, xPad: 14.0, yPad: 16.0, width: orderNumber.frame.size.width, height: AutoHeight)
        purchaseDate.align(.UnderMatchingLeft, relativeTo: orderNumber, padding: 16.0, width: purchaseDate.frame.size.width, height: AutoHeight)
        billingEmail.align(.UnderMatchingLeft, relativeTo: purchaseDate, padding: 16.0, width: billingEmail.frame.size.width, height: AutoHeight)
        paymentMethod.align(.UnderMatchingLeft, relativeTo: billingEmail, padding: 16.0, width: paymentMethod.frame.size.width, height: AutoHeight)
    }
    
    override func layoutSubviews() {
        label_orderNumber.anchorInCorner(.TopRight, xPad: 14.0, yPad: 16.0, width: contentView.frame.size.width, height: AutoHeight)
        label_purchaseDate.align(.UnderMatchingRight, relativeTo: label_orderNumber, padding: 16.0, width: contentView.frame.size.width, height: AutoHeight)
        label_billingEmail.align(.UnderMatchingRight, relativeTo: label_purchaseDate, padding: 16.0, width: contentView.frame.size.width, height: AutoHeight)
        label_paymentMethod.align(.UnderMatchingRight, relativeTo: label_billingEmail, padding: 16.0, width: contentView.frame.size.width, height: AutoHeight)
    }
}
