//
//  RegistrationViewController.swift
//  Showpo
//
//  Created by Thadz on 02/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import HexColor

class RegistrationViewController: UIViewController {
    
    let textField_email = UITextField()
    let textField_password = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareRegistrationUI()
        view.backgroundColor = UIColor.whiteColor()
    }
    
    func prepareRegistrationUI(){
        let backgroundImage = UIImageView(image: UIImage(named: "showposplash"))
        view.addSubview(backgroundImage)
        backgroundImage.fillSuperview()
        
        //create top spacing
        let topSpring = UIView()
        //        topSpring.backgroundColor = UIColor.blueColor()
        view.addSubview(topSpring)
        
        topSpring.anchorAndFillEdge(.Top, xPad: 0.0, yPad: 20.0, otherSize: 131.0)
        
        let image_showpologo = UIImage(named: "showpo_logo-small")
        let imageView_showpologo = UIImageView(image: image_showpologo)
        topSpring.addSubview(imageView_showpologo)
        imageView_showpologo.anchorInCenter(width: (image_showpologo?.size.width)!, height: (image_showpologo?.size.height)!)
        
        //create textField_email container with border
        let emailContainer = UIView()
        emailContainer.backgroundColor = UIColor.whiteColor()
        emailContainer.layer.borderColor = UIColor(0x9CBACF).CGColor
        emailContainer.layer.borderWidth = 1.0
        view.addSubview(emailContainer)
        
        emailContainer.align(.UnderCentered, relativeTo: topSpring, padding: 10.0, width: view.frame.width - 28.0, height: 44.0)
        
        textField_email.borderStyle = UITextBorderStyle.None
        textField_email.placeholder = "Email"
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
        passwordContainer.addSubview(textField_password)
        
        let image_password = UIImage(named: "password")
        let imageView_password = UIImageView(image: image_password)
        passwordContainer.addSubview(imageView_password)
        
        imageView_password.anchorInCorner(.TopRight, xPad: 12.0, yPad: 11.0, width: image_password!.size.width, height: image_password!.size.height)
        textField_password.fillSuperview(left: 10.0, right: 10.0, top: 10.0, bottom: 10.0)
        
        let button_register = UIButton()
        button_register.addTarget(self, action: #selector(register), forControlEvents: .TouchUpInside)
        button_register.backgroundColor = UIColor(0xF18373)
        button_register.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button_register.setTitle("REGISTER", forState: UIControlState.Normal)
        button_register.titleLabel?.font = UIFont(name: "OpenSans-Semibold", size: 16.0)
        button_register.addTarget(self, action: #selector(register), forControlEvents: .TouchUpInside)
        view.addSubview(button_register)
        
        button_register.align(.UnderCentered, relativeTo: passwordContainer, padding: 40.0, width: view.frame.width - 28.0, height: 55.0)
        button_register.layer.cornerRadius = button_register.frame.size.width/128.0
    }
    
    func register(){
        dismissViewControllerAnimated(true, completion: nil)
    }

}
