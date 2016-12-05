//
//  SettingsViewController.swift
//  Showpo
//
//  Created by Thadz on 21/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class SettingsViewController: UIViewController {
    
    let label_user = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        navigationController?.navigationBarHidden = false
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.translucent = false
        navigationController?.navigationBar.barTintColor = UIColor(0xAED9FB)
        
        view.backgroundColor = UIColor.whiteColor()
    }
    
    func setupViews(){
        let view_header = UIView(frame: CGRectZero)
        view_header.backgroundColor = UIColor(0xAED9FB)
        view.addSubview(view_header)
        
        view_header.anchorAndFillEdge(.Top, xPad: 0.0, yPad: 0.0, otherSize: 118.0)
        
        label_user.text = "Hi, Jane!"
        label_user.font = UIFont(name: "OpenSans-Semibold", size: 24.0)
        label_user.textColor = UIColor(0x282929)
        label_user.sizeToFit()
        view_header.addSubview(label_user)
        
        label_user.anchorInCorner(.BottomLeft, xPad: 20.0, yPad: 14.0, width: label_user.frame.size.width, height: AutoHeight)
        
        let label_settings = UILabel(frame: CGRectZero)
        label_settings.text = "Settings"
        label_settings.font = UIFont(name: "OpenSans", size: 20.0)
        label_settings.sizeToFit()
        view.addSubview(label_settings)
        label_settings.align(.UnderCentered, relativeTo: view_header, padding: 14.0, width: view.frame.size.width - 44.0, height: AutoHeight)
        
        let view_divider = UIView(frame: CGRectZero)
        view_divider.backgroundColor = UIColor(0xBDBDBD)
        view.addSubview(view_divider)
        view_divider.align(.UnderCentered, relativeTo: label_settings, padding: 10.0, width: view.frame.size.width - 8.0, height: 1.0)
        
        let label_country = UILabel(frame: CGRectZero)
        label_country.text = "Country"
        label_country.font = UIFont(name: "OpenSans", size: 16.0)
        label_country.sizeToFit()
        view.addSubview(label_country)
        label_country.align(.UnderMatchingLeft, relativeTo: label_settings, padding: 20.0, width: view.frame.size.width, height: AutoHeight)
        
        let view_countryContainer = setupContainer()
        view.addSubview(view_countryContainer)
        view_countryContainer.align(.UnderMatchingLeft, relativeTo: label_country, padding: 10.0, width: view.frame.size.width - 44.0, height: 44.0)
        
        let label_countryName = setupLabel("United States Of America")
        view_countryContainer.addSubview(label_countryName)
        label_countryName.anchorInCenter(width: view_countryContainer.frame.size.width - 26.0, height: AutoHeight)
        
        let label_selectCurrency = UILabel(frame: CGRectZero)
        label_selectCurrency.text = "Select Currency"
        label_selectCurrency.font = UIFont(name: "OpenSans", size: 16.0)
        label_selectCurrency.sizeToFit()
        view.addSubview(label_selectCurrency)
        label_selectCurrency.align(.UnderMatchingLeft, relativeTo: view_countryContainer, padding: 10.0, width: view.frame.size.width, height: AutoHeight)
        
        let view_currencyContainer = setupContainer()
        view.addSubview(view_currencyContainer)
        view_currencyContainer.align(.UnderMatchingLeft, relativeTo: label_selectCurrency, padding: 10.0, width: view_countryContainer.frame.size.width, height: 44.0)
        
        let label_currencyName = setupLabel("US Dollars")
        view_currencyContainer.addSubview(label_currencyName)
        label_currencyName.anchorInCenter(width: view_currencyContainer.frame.size.width - 26.0, height: AutoHeight)
        
        let button_clearHistory = setupButton("Clear History")
        view.addSubview(button_clearHistory)
        button_clearHistory.align(.UnderMatchingLeft, relativeTo: view_currencyContainer, padding: 6.0, width: button_clearHistory.frame.size.width, height: AutoHeight)
        
        let button_signOut = setupButton("Sign Out")
        view.addSubview(button_signOut)
        button_signOut.align(.UnderMatchingLeft, relativeTo: button_clearHistory, padding: 6.0, width: button_signOut.frame.size.width, height: AutoHeight)
        
        let view_bottomDivider = UIView(frame: CGRectZero)
        view_bottomDivider.backgroundColor = UIColor(0xBDBDBD)
        view.addSubview(view_bottomDivider)
        view_bottomDivider.align(.UnderMatchingLeft, relativeTo: view_divider, padding: button_signOut.frame.origin.y + button_signOut.frame.size.height + 5.0 - view_divider.frame.origin.y, width: view_divider.frame.size.width, height: 1.0)
        
        let label_disclaimer = UILabel(frame: CGRectZero)
        label_disclaimer.text = "ABN: 30156041913 COPYRIGHT (C) 2016 SHOWPO \nALL RIGHTS RESERVED\nShow Pony Group Pty Ltd"
        label_disclaimer.numberOfLines = 0
        label_disclaimer.textAlignment = .Center
        label_disclaimer.font = UIFont(name: "OpenSans", size: 10.0)
        label_disclaimer.sizeToFit()
        view.addSubview(label_disclaimer)
        label_disclaimer.align(.UnderCentered, relativeTo: view_bottomDivider, padding: 18.0, width: view.frame.size.width - 40.0, height: AutoHeight)
    }
    
    func setupButton(text: String) -> UIButton{
        let button = UIButton(frame: CGRectZero)
        button.setTitle(text, forState: .Normal)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.titleLabel?.font = UIFont(name: "OpenSans-Semibold", size: 16.0)
        button.sizeToFit()
        
        return button
    }
    
    func setupContainer() -> UIView{
        let view_container = UIView(frame: CGRectZero)
        view_container.backgroundColor = UIColor(0xF8F8F8)
        view_container.layer.borderColor = UIColor(0xBDBDBD).CGColor
        view_container.layer.borderWidth = 1.0
        
        return view_container
    }
    
    func setupLabel(text: String) -> UILabel{
        let label = UILabel(frame: CGRectZero)
        label.font = UIFont(name: "OpenSans", size: 16.0)
        label.textColor = UIColor(0xBDBDBD)
        label.text = text
        label.sizeToFit()
        
        return label
    }
}
