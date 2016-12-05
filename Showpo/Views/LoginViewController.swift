//
//  LoginViewController.swift
//  Showpo
//
//  Created by Thadz on 25/10/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import Foundation
import UIKit
import Neon
import HexColor

class LoginViewController: UIViewController {
    
    let textField_email = UITextField()
    let textField_password = UITextField()
    
    let scrollView_loginScroll = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareLoginUI()
        
        let fontFamilyNames = UIFont.familyNames()
        
        for familyName in fontFamilyNames {
            
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNamesForFamilyName(familyName)
            print("Font Names = [\(names)]")
        }
        
        view.backgroundColor = UIColor.whiteColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func prepareLoginUI(){
        
        
        let backgroundImage = UIImageView(image: UIImage(named: "showposplash"))
        view.addSubview(backgroundImage)
        backgroundImage.fillSuperview()
        
        //create top spacing
        let topSpring = UIView()
//        topSpring.backgroundColor = UIColor.blueColor()
        view.addSubview(topSpring)
        
        topSpring.anchorAndFillEdge(.Top, xPad: 0.0, yPad: 20.0, otherSize: 131.0)
        
        
//        let label_showpo = UILabel()
//        label_showpo.text = "SHOWPO"
//        label_showpo.sizeToFit()
//        topSpring.addSubview(label_showpo)
//        
//        label_showpo.anchorInCenter(width: label_showpo.frame.size.width, height: label_showpo.frame.size.width)
        
        let image_showpologo = UIImage(named: "showpo_logo-small")
        let imageView_showpologo = UIImageView(image: image_showpologo)
        topSpring.addSubview(imageView_showpologo)
        imageView_showpologo.anchorInCenter(width: (image_showpologo?.size.width)!, height: (image_showpologo?.size.height)!)
        
        let image_dismissButton = UIImage(named: "close")
        let dismissButton = UIButton(frame: CGRectZero)
        dismissButton.setImage(image_dismissButton, forState: .Normal)
        dismissButton.addTarget(self, action: #selector(dismissLogin), forControlEvents: .TouchUpInside)
        topSpring.addSubview(dismissButton)
        
        dismissButton.anchorInCorner(.TopRight, xPad: 20.0, yPad: 20.0, width: image_dismissButton!.size.width, height: image_dismissButton!.size.height)
        
        //create textField_email container with border
        let emailContainer = UIView()
        emailContainer.backgroundColor = UIColor.whiteColor()
        emailContainer.layer.borderColor = UIColor(0x9CBACF).CGColor
        emailContainer.layer.borderWidth = 1.0
        view.addSubview(emailContainer)
        
        emailContainer.align(.UnderCentered, relativeTo: topSpring, padding: 10.0, width: view.frame.width - 28.0, height: 44.0)
        
        textField_email.borderStyle = UITextBorderStyle.None
        textField_email.placeholder = "Email"
        textField_email.font = UIFont(name: "OpenSans", size: 16.0)
        emailContainer.addSubview(textField_email)
        
        let image_user = UIImage(named: "profile")
        let imageView_user = UIImageView(image: image_user)
        emailContainer.addSubview(imageView_user)
        
        imageView_user.anchorInCorner(.TopRight, xPad: 12.0, yPad: 12.0, width: image_user!.size.width, height: image_user!.size.height)
        textField_email.fillSuperview(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0)
        
        //create textField_password container with border
        
        let passwordContainer = UIView()
        passwordContainer.backgroundColor = UIColor.whiteColor()
        passwordContainer.layer.borderColor = UIColor(0x9CBACF).CGColor
        passwordContainer.layer.borderWidth = 1.0
        view.addSubview(passwordContainer)
        
        passwordContainer.align(.UnderCentered, relativeTo: emailContainer, padding: 10.0, width: view.frame.width - 28.0, height: 44.0)
        
        textField_password.borderStyle = .None
        textField_password.placeholder = "Password"
        textField_password.font = UIFont(name: "OpenSans", size: 16.0)
        passwordContainer.addSubview(textField_password)
        
        let image_password = UIImage(named: "password")
        let imageView_password = UIImageView(image: image_password)
        passwordContainer.addSubview(imageView_password)
        
        imageView_password.anchorInCorner(.TopRight, xPad: 12.0, yPad: 11.0, width: image_password!.size.width, height: image_password!.size.height)
        textField_password.fillSuperview(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0)
        
        let button_login = UIButton()
        button_login.addTarget(self, action: #selector(login), forControlEvents: .TouchUpInside)
        button_login.backgroundColor = UIColor(0x478DC4)
        button_login.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button_login.setTitle("LOGIN", forState: UIControlState.Normal)
        button_login.titleLabel?.font = UIFont(name: "OpenSans-Semibold", size: 16.0)
        view.addSubview(button_login)
        
        button_login.align(.UnderCentered, relativeTo: passwordContainer, padding: 40.0, width: view.frame.width - 28.0, height: 55.0)
        button_login.layer.cornerRadius = button_login.frame.size.width/128.0
        
        let button_register = UIButton()
        button_register.addTarget(self, action: #selector(register), forControlEvents: .TouchUpInside)
        button_register.backgroundColor = UIColor(0xF18373)
        button_register.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button_register.setTitle("REGISTER", forState: .Normal)
        button_register.titleLabel?.font = UIFont(name: "OpenSans-Semibold", size: 16.0)
        view.addSubview(button_register)
        
        button_register.align(.UnderCentered, relativeTo: button_login, padding: 5.0, width: view.frame.width - 28.0, height: 55.0)
        button_register.layer.cornerRadius = button_register.frame.size.width/128.0
        
        let label_or = UILabel()
        label_or.text = "OR"
        label_or.textAlignment = .Center
        label_or.font = UIFont(name: "OpenSans-Semibold", size: 16.0)
        label_or.sizeToFit()
        view.addSubview(label_or)
        
        label_or.align(.UnderCentered, relativeTo: button_register, padding: 30.0, width: view.frame.width - 20.0, height: label_or.frame.size.height)
        
        let button_facebook = UIButton()
        button_facebook.addTarget(self, action: #selector(register), forControlEvents: .TouchUpInside)
        button_facebook.backgroundColor = UIColor.blueColor()
        button_facebook.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button_facebook.setTitle("REGISTER WITH FACEBOOK", forState: .Normal)
        button_facebook.titleLabel?.font = UIFont(name: "OpenSans-Semibold", size: 16.0)
        view.addSubview(button_facebook)
        
        button_facebook.align(.UnderCentered, relativeTo: label_or, padding: 30.0, width: view.frame.width - 28.0, height: 55.0)
    }
    
    func setupScrollView(){
        
    }
    
    func dismissLogin(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func login(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func register(){
        let registrationView = RegistrationViewController()
        presentViewController(registrationView, animated: true, completion: nil)
    }
    
    //misc code
    
}
