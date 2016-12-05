//
//  AccountViewController.swift
//  Showpo
//
//  Created by Thadz on 25/10/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class AccountViewController: UIViewController {
    
    let scrollView_account = UIScrollView()
    
    let imageView_signIn = UIImageView()
    let label_signIn = UILabel()
    let label_userName = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Account"
        
        view.backgroundColor = UIColor.whiteColor()
        
        setupViews()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBarHidden = true
    }
    
    func setupViews(){
        //header height 158
        
        view.addSubview(scrollView_account)
        scrollView_account.fillSuperview()
        
        scrollView_account.contentSize = CGSize(width: view.frame.size.width, height: 750.0)
        
        let view_header = UIView(frame: CGRectZero)
        view_header.backgroundColor = UIColor(0xAED9FB)
        scrollView_account.addSubview(view_header)
        
        view_header.anchorAndFillEdge(.Top, xPad: 0.0, yPad: 0.0, otherSize: 158.0)
        
        let image_signIn = UIImage(named: "sign_in_icn")
        imageView_signIn.frame = CGRectZero
        imageView_signIn.image = image_signIn
        view_header.addSubview(imageView_signIn)
        
        imageView_signIn.anchorInCorner(.BottomLeft, xPad: 20.0, yPad: 14.0, width: (image_signIn?.size.width)!, height: (image_signIn?.size.height)!)
        
        label_signIn.text = "SIGN IN"
        label_signIn.font = UIFont(name: "OpenSans-Semibold", size: 24.0)
        label_signIn.textColor = UIColor(0x282929)
        label_signIn.sizeToFit()
        view_header.addSubview(label_signIn)
        
        label_signIn.align(.ToTheRightCentered, relativeTo: imageView_signIn, padding: 12.0, width: view.frame.size.width - imageView_signIn.frame.size.width - 20.0, height: AutoHeight)
        
        let button_signIn = UIButton()
        
        view_header.addSubview(button_signIn)
        button_signIn.addTarget(self, action: #selector(presentLogin), forControlEvents: .TouchUpInside)
        button_signIn.anchorInCorner(.BottomLeft, xPad: 20.0, yPad: 14.0, width: imageView_signIn.frame.size.width + label_signIn.frame.size.width + 12.0, height: imageView_signIn.frame.size.height)
        
        
        let openSans16 = UIFont(name: "OpenSans", size: 16.0)
        let openSans12 = UIFont(name: "OpenSans", size: 12.0)
        
        //button vertical spacing 19.0
        let button_categories = setButton("Categories", size: 16.0)
        scrollView_account.addSubview(button_categories)
        
        button_categories.anchorInCorner(.TopLeft, xPad: 22.0, yPad: view_header.frame.size.height + 19.0, width: button_categories.frame.size.width, height: labelHeight("Categories", font: openSans16!))
        
        let button_orders = setButton("Your Orders", size: 16.0)
        scrollView_account.addSubview(button_orders)
        
        button_orders.anchorInCorner(.TopLeft, xPad: 22.0, yPad: button_categories.frame.origin.y + button_categories.frame.size.height + 19.0, width: button_orders.frame.size.width, height: labelHeight("Your Orders", font: openSans16!))
        
        let button_favorites = setButton("Favorites", size: 16.0)
        scrollView_account.addSubview(button_favorites)
        
        button_favorites.anchorInCorner(.TopLeft, xPad: 22.0, yPad: button_orders.frame.origin.y + button_orders.frame.size.height + 19.0, width: button_favorites.frame.size.width, height: labelHeight("Favorites", font: openSans16!))
        
        let button_settings = setButton("Settings", size: 16.0)
        button_settings.addTarget(self, action: #selector(pushSettings), forControlEvents: .TouchUpInside)
        scrollView_account.addSubview(button_settings)
        
        button_settings.anchorInCorner(.TopLeft, xPad: 22.0, yPad: button_favorites.frame.origin.y + button_favorites.frame.size.height + 19.0, width: button_settings.frame.size.width, height: labelHeight("Settings", font: openSans16!))
        
        let aboutDivider = UIView(frame: CGRectZero)
        aboutDivider.backgroundColor = UIColor.lightGrayColor()
        scrollView_account.addSubview(aboutDivider)
        
        aboutDivider.anchorAndFillEdge(.Top, xPad: 0.0, yPad: button_settings.frame.origin.y + button_settings.frame.size.height + 29.0, otherSize: 1.0)
        
        let button_about = setButton("About", size: 12.0)
        scrollView_account.addSubview(button_about)
        
        button_about.anchorInCorner(.TopLeft, xPad: 22.0, yPad: aboutDivider.frame.origin.y + 24.0, width: button_about.frame.size.width, height: labelHeight("About", font: openSans12!))
        
        let button_feedback = setButton("Give Feedback", size: 12.0)
        scrollView_account.addSubview(button_feedback)
        
        button_feedback.anchorInCorner(.TopLeft, xPad: 22.0, yPad: button_about.frame.origin.y + button_about.frame.size.height + 19.0, width: button_feedback.frame.size.width, height: labelHeight("Give Feedback", font: openSans12!))
        
        let button_rate = setButton("Rate App", size: 12.0)
        scrollView_account.addSubview(button_rate)
        
        button_rate.anchorInCorner(.TopLeft, xPad: 22.0, yPad: button_feedback.frame.origin.y + button_feedback.frame.size.height + 19.0, width: button_rate.frame.size.width, height: labelHeight("Rate App", font: openSans12!))
        
        let button_support = setButton("Help & Support", size: 12.0)
        scrollView_account.addSubview(button_support)
        
        button_support.anchorInCorner(.TopLeft, xPad: 22.0, yPad: button_rate.frame.origin.y + button_rate.frame.size.height + 19.0, width: button_support.frame.size.width, height: labelHeight("Help & Support", font: openSans12!))
        
        let button_orderLocate = setButton("Where's my order?", size: 12.0)
        scrollView_account.addSubview(button_orderLocate)
        
        button_orderLocate.anchorInCorner(.TopLeft, xPad: 22.0, yPad: button_support.frame.origin.y + button_support.frame.size.height + 19.0, width: button_orderLocate.frame.size.width, height: labelHeight("Where's my order?", font: openSans12!))
        
        let button_return = setButton("How to make a return?", size: 12.0)
        scrollView_account.addSubview(button_return)
        
        button_return.anchorInCorner(.TopLeft, xPad: 22.0, yPad: button_orderLocate.frame.origin.y + button_orderLocate.frame.size.height + 19.0, width: button_return.frame.size.width, height: labelHeight("How to make a return?", font: openSans12!))
        
        print("y total: ", button_return.frame.origin.y + button_return.frame.size.height)
        
        let disclaimerDivider = UIView(frame: CGRectZero)
        disclaimerDivider.backgroundColor = UIColor.lightGrayColor()
        scrollView_account.addSubview(disclaimerDivider)
        
        disclaimerDivider.anchorAndFillEdge(.Top, xPad: 0.0, yPad: button_return.frame.origin.y + button_return.frame.size.height + 29.0, otherSize: 1.0)
        
        let label_disclaimer = UILabel(frame: CGRectZero)
        label_disclaimer.text = "ABN: 30156041913 COPYRIGHT (C) 2016 SHOWPO \nALL RIGHTS RESERVED\nShow Pony Group Pty Ltd"
        label_disclaimer.numberOfLines = 0
        label_disclaimer.textAlignment = .Center
        label_disclaimer.font = UIFont(name: "OpenSans", size: 10.0)
        label_disclaimer.textColor = UIColor(0x282929)
        label_disclaimer.sizeToFit()
        scrollView_account.addSubview(label_disclaimer)
        
        label_disclaimer.anchorInCorner(.TopLeft, xPad: 0.0, yPad: disclaimerDivider.frame.origin.y + 19.0, width: view.frame.size.width, height: AutoHeight)
    }
    
    func pushSettings(){
        let settingsVC = SettingsViewController()
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
    func setButton(buttonTitle: String, size: CGFloat) -> UIButton{
        let button = UIButton(frame: CGRectZero)
        button.setTitle(buttonTitle, forState: .Normal)
        button.titleLabel?.font = UIFont(name: "OpenSans", size: size)
        button.titleLabel?.textAlignment = .Right
        button.setTitleColor(UIColor(0x282929), forState: .Normal)
        button.sizeToFit()
        
        return button
    }
    
    func labelHeight(textLabel: String, font: UIFont) -> CGFloat{
        let label = UILabel(frame: CGRectZero)
        label.text = textLabel
        label.font = font
        label.sizeToFit()
        
        return label.frame.size.height
    }
    
    func presentLogin(){
        let loginViewController = LoginViewController()
        presentViewController(loginViewController, animated: true, completion: nil)
    }
}
