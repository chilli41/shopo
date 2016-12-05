//
//  CreditCardDetailsCell.swift
//  Showpo
//
//  Created by Thadz on 21/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class CreditCardDetailsCell: UITableViewCell {
    
    let button_scan = UIButton()
    
    var textField_ccName: UITextField!
    var textField_cardNumber: UITextField!
    var button_amEx: UIButton!
    var button_master: UIButton!
    var button_visa: UIButton!
    var textField_expMonth: UITextField!
    var textField_expYear: UITextField!
    var textField_secCode: UITextField!
    
    private let image_cc = UIImage(named: "paymentopt-card")
    private let image_visaVis = UIImage(named: "card_visa-vis")
    private let image_visa = UIImage(named: "card_visa")
    private let image_amexVis = UIImage(named: "card_amex-vis")
    private let image_amex = UIImage(named: "card_amex")
    private let image_mcVis = UIImage(named: "card_mc-vis")
    private let image_mc = UIImage(named: "card_mc")
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        button_visa = setupCCButton(image_visaVis!, deselected: image_visa!)
        contentView.addSubview(button_visa)
        
        button_amEx = setupCCButton(image_amexVis!, deselected: image_amex!)
        contentView.addSubview(button_amEx)
        
        button_master = setupCCButton(image_mcVis!, deselected: image_mc!)
        contentView.addSubview(button_master)
    }
    
    override func layoutSubviews() {
        let label_paymentDetails = UILabel(frame: CGRectZero)
        label_paymentDetails.text = "PAYMENT DETAILS"
        label_paymentDetails.font = UIFont(name: "OpenSans-Semibold", size: 16.0)
        label_paymentDetails.textColor = UIColor(0x585858)
        label_paymentDetails.sizeToFit()
        label_paymentDetails.textAlignment = .Center
        
        contentView.addSubview(label_paymentDetails)
        label_paymentDetails.anchorAndFillEdge(.Top, xPad: 0.0, yPad: 8.0, otherSize: AutoHeight)
        
        let view_scan = setupTextFieldContainer()
        contentView.addSubview(view_scan)
        view_scan.align(.UnderCentered, relativeTo: label_paymentDetails, padding: 11.0, width: contentView.frame.size.width - 24.0, height: 55.0)
        
        
        let imageView_cc = UIImageView(image: image_cc)
        view_scan.addSubview(imageView_cc)
        imageView_cc.anchorToEdge(.Top, padding: 8.0, width: image_cc!.size.width, height: image_cc!.size.height)
        
        let label_scan = setupLabel("Scan Your Card")
        view_scan.addSubview(label_scan)
        label_scan.align(.UnderCentered, relativeTo: imageView_cc, padding: 3.0, width: view_scan.frame.size.width, height: AutoHeight)
        
        view_scan.addSubview(button_scan)
        button_scan.fillSuperview()
        
        let label_or = setupLabel("OR")
        label_or.textColor = UIColor(0x585858)
        contentView.addSubview(label_or)
        label_or.align(.UnderCentered, relativeTo: view_scan, padding: 6.0, width: contentView.frame.size.width, height: AutoHeight)
        
        let view_ccName = setupTextFieldContainer()
        contentView.addSubview(view_ccName)
        view_ccName.align(.UnderCentered, relativeTo: label_or, padding: 8.0, width: contentView.frame.size.width - 24.0, height: 44.0)
        
        textField_ccName = setupTextField("Credit Card Name*")
        view_ccName.addSubview(textField_ccName)
        textField_ccName.anchorInCenter(width: view_ccName.frame.size.width - 24.0, height: view_ccName.frame.size.height - 12.0)
        
        button_visa.align(.UnderMatchingRight, relativeTo: view_ccName, padding: 12.0, width: image_visa!.size.width, height: image_visa!.size.height)
        button_master.align(.ToTheLeftCentered, relativeTo: button_visa, padding: 4.0, width: image_mc!.size.width, height: image_mc!.size.height)
        button_amEx.align(.ToTheLeftCentered, relativeTo: button_master, padding: 4.0, width: image_amex!.size.width, height: image_amex!.size.height)
        
        let view_ccNumber = setupTextFieldContainer()
        contentView.addSubview(view_ccNumber)
        view_ccNumber.align(.UnderMatchingRight, relativeTo: button_visa, padding: 6.0, width: view_ccName.frame.size.width, height: view_ccName.frame.size.height)
        
        textField_cardNumber = setupTextField("Card Number*")
        view_ccNumber.addSubview(textField_cardNumber)
        textField_cardNumber.anchorInCenter(width: view_ccNumber.frame.size.width - 24.0, height: view_ccNumber.frame.size.height - 12.0)
        
        let view_expContainer = UIView(frame: CGRectZero)
        contentView.addSubview(view_expContainer)
        view_expContainer.align(.UnderCentered, relativeTo: view_ccNumber, padding: 0.0, width: contentView.frame.size.width, height: 66.0)
        
        let view_expMonth = setupTextFieldContainer()
        view_expContainer.addSubview(view_expMonth)
        
        let view_expYear = setupTextFieldContainer()
        view_expContainer.addSubview(view_expYear)
        
        view_expContainer.groupAndFill(group: .Horizontal, views: [view_expMonth, view_expYear], padding: 11.0)
        
        textField_expMonth = setupTextField("Expiration Month*")
        view_expMonth.addSubview(textField_expMonth)
        textField_expMonth.anchorInCenter(width: view_expMonth.frame.size.width - 24.0, height: view_expMonth.frame.size.height - 12.0)
        
        textField_expYear = setupTextField("Expiration Year*")
        view_expYear.addSubview(textField_expYear)
        textField_expYear.anchorInCenter(width: view_expYear.frame.size.width - 24.0, height: view_expMonth.frame.size.height - 12.0)
        
        let view_securityCode = setupTextFieldContainer()
        contentView.addSubview(view_securityCode)
        view_securityCode.align(.UnderCentered, relativeTo: view_expContainer, padding: 0.0, width: view_ccNumber.frame.size.width, height: view_ccNumber.frame.size.height)
        
        textField_secCode = setupTextField("Security Code*")
        view_securityCode.addSubview(textField_secCode)
        textField_secCode.anchorInCenter(width: view_securityCode.frame.size.width - 24.0, height: view_securityCode.frame.size.height - 12.0)
    }
    
    func setupCCButton(selected: UIImage, deselected: UIImage) -> UIButton{
        let button = UIButton(frame: CGRectZero)
        button.setImage(deselected, forState: .Normal)
        button.setImage(selected, forState: .Selected)
        
        return button
    }
    
    func setupLabel(textLabel: String) -> UILabel{
        let label = UILabel(frame: CGRectZero)
        label.text = textLabel
        label.textColor = UIColor(0x9F9F9F)
        label.font = UIFont(name: "OpenSans", size: 16.0)
        label.textAlignment = .Center
        label.sizeToFit()
        
        return label
    }
    
    func setupTextFieldContainer() -> UIView{
        let view_container = UIView(frame: CGRectZero)
        view_container.backgroundColor = UIColor(0xF8F8F8)
        view_container.layer.borderColor = UIColor(0xBDBDBD).CGColor
        view_container.layer.borderWidth = 1.0
        
        return view_container
    }
    
    func setupTextField(placeholder: String) -> UITextField{
        let textField = UITextField(frame: CGRectZero)
        textField.borderStyle = .None
        textField.placeholder = placeholder
        textField.font = UIFont(name: "OpenSans", size: 16.0)
        
        return textField
    }
    
}
