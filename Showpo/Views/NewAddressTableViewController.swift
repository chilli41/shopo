//
//  NewAddressTableViewController.swift
//  Showpo
//
//  Created by Thadz on 11/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class NewAddressTableViewController: UIViewController {
    
    let addressCellIdentifier = "AddressTableViewCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        navigationController?.navigationBar.translucent = false
        navigationItem.titleView = UIImageView(image: UIImage(named: "showpo_logo-small"))
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        view.backgroundColor = UIColor.whiteColor()
    }

    func setupTextFieldContainer() -> UIView{
        let view_container = UIView(frame: CGRectZero)
        view_container.backgroundColor = UIColor(0xF8F8F8)
        view_container.layer.borderColor = UIColor.blackColor().CGColor
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
    
    func confirmAddress(){
        navigationController?.popViewControllerAnimated(true)
    }
    
    func setupViews(){
        let label_AddressHeader = UILabel(frame: CGRectZero)
        label_AddressHeader.text = "Enter your Shipping Information"
        label_AddressHeader.font = UIFont(name: "OpenSans-Semibold", size: 16.0)
        label_AddressHeader.textAlignment = .Center
        label_AddressHeader.sizeToFit()
        
        view.addSubview(label_AddressHeader)
        label_AddressHeader.anchorAndFillEdge(.Top, xPad: 40.0, yPad: 30.0, otherSize: AutoHeight)
        
        let view_firstNameContainer = setupTextFieldContainer()
        view.addSubview(view_firstNameContainer)
        view_firstNameContainer.anchorAndFillEdge(.Top, xPad: 20.0, yPad: label_AddressHeader.frame.size.height + 40.0, otherSize: 50.0)
        
        let textField_firstName = setupTextField("First Name")
        view_firstNameContainer.addSubview(textField_firstName)
        textField_firstName.fillSuperview(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0)
        
        let view_lastNameContainer = setupTextFieldContainer()
        view.addSubview(view_lastNameContainer)
        view_lastNameContainer.anchorAndFillEdge(.Top, xPad: 20.0, yPad: view_firstNameContainer.frame.origin.y + view_firstNameContainer.frame.size.height + 10.0, otherSize: 50.0)
        
        let textField_lastName = setupTextField("Last Name")
        view_lastNameContainer.addSubview(textField_lastName)
        textField_lastName.fillSuperview(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0)
        
        let view_address1Container = setupTextFieldContainer()
        view.addSubview(view_address1Container)
        view_address1Container.anchorAndFillEdge(.Top, xPad: 20.0, yPad: view_lastNameContainer.frame.origin.y + view_lastNameContainer.frame.size.height + 10.0, otherSize: 50.0)
        
        let textField_address1 = setupTextField("Address 1*")
        view_address1Container.addSubview(textField_address1)
        textField_address1.fillSuperview(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0)
        
        let view_address2Container = setupTextFieldContainer()
        view.addSubview(view_address2Container)
        view_address2Container.anchorAndFillEdge(.Top, xPad: 20.0, yPad: view_address1Container.frame.origin.y + view_address1Container.frame.size.height + 10.0, otherSize: 50.0)
        
        let textField_address2 = setupTextField("Address 2 (optional)")
        view_address2Container.addSubview(textField_address2)
        textField_address2.fillSuperview(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0)
        
        let view_cityContainer = setupTextFieldContainer()
        view.addSubview(view_cityContainer)
        view_cityContainer.anchorAndFillEdge(.Top, xPad: 20.0, yPad: view_address2Container.frame.origin.y + view_address2Container.frame.size.height + 10.0, otherSize: 50.0)
        
        let textField_city = setupTextField("City/Town*")
        view_cityContainer.addSubview(textField_city)
        textField_city.fillSuperview(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0)
        
        let view_countryContainer = setupTextFieldContainer()
        view.addSubview(view_countryContainer)
        view_countryContainer.anchorAndFillEdge(.Top, xPad: 20.0, yPad: view_cityContainer.frame.origin.y + view_cityContainer.frame.size.height + 10.0, otherSize: 50.0)
        
        let textField_country = setupTextField("Country*")
        view_countryContainer.addSubview(textField_country)
        textField_country.fillSuperview(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0)
        
        let view_zipCodeContainer = setupTextFieldContainer()
        view.addSubview(view_zipCodeContainer)
        view_zipCodeContainer.anchorAndFillEdge(.Top, xPad: 20.0, yPad: view_countryContainer.frame.origin.y + view_countryContainer.frame.size.height + 10, otherSize: 50.0)
        
        let textField_zipCode = setupTextField("Zip/Postal Code*")
        view_zipCodeContainer.addSubview(textField_zipCode)
        textField_zipCode.fillSuperview(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0)
        
        let button_next = UIButton(frame: CGRectZero)
        button_next.backgroundColor = UIColor(0x478DC4)
        button_next.setTitle("CONFIRM", forState: .Normal)
        button_next.titleLabel?.font = UIFont(name: "OpenSans-Semibold", size: 18.0)
        button_next.addTarget(self, action: #selector(confirmAddress), forControlEvents: .TouchUpInside)
        view.addSubview(button_next)
        
        button_next.align(.UnderCentered, relativeTo: view_zipCodeContainer, padding: 20.0, width: view.frame.width - 40.0, height: 50.0)
        button_next.layer.cornerRadius = button_next.frame.size.width/128
    }
    
}
