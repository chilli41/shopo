//
//  ProductDetailsTableViewController.swift
//  Showpo
//
//  Created by Thadz on 07/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class ProductDetailsTableViewController: UITableViewController {

    let array_color = [UIColor.blueColor(), UIColor.purpleColor(), UIColor.greenColor(), UIColor.redColor(), UIColor.lightGrayColor()]
    let array_size = ["2", "4", "6", "8", "10"]
    let productDescription = "a sunset lover playsuit print for a summer time in a beach or just a walk around town. made of light fabric with wear resistant print. wash in cold water and less bleach. return if there are factory defects. made somewhere. with some additional information to increase label/text length to test if uilabel.frame.size.height is dynamic and to test if row height of uitableviewcell is also dynamic."
     
     let array_style = ["item_1_image.jpg", "item_2_image.jpg", "item_3_image.jpg", "item_4_image.jpg", "item_1_image.jpg", "item_2_image.jpg", "item_3_image.jpg", "item_4_image.jpg", "item_1_image.jpg", "item_2_image.jpg"]
     let array_stylePrice = ["US$79.95", "US$21.95", "US$24.95", "US$72.95", "US$79.95", "US$21.95", "US$24.95", "US$79.95", "US$21.95", "US$24.95"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ProductDetailsTableViewController")
        
        tableView.registerClass(ProductImageCell.self, forCellReuseIdentifier: "ProductImageCellIdentifier")
        tableView.registerClass(ProductVariationCell.self, forCellReuseIdentifier: "ProductVariationCellIdentifier")
        tableView.registerClass(ProductDescriptionCell.self, forCellReuseIdentifier: "ProductDescriptionCellIdentifier")
     
        tableView.separatorStyle = .None
        view.backgroundColor = UIColor.whiteColor()
    }
     
     func calcTextHeight(text: String, withWidth width: CGFloat, andFont font: UIFont) -> CGFloat {
          if text.isEmpty {
               return 0
          }
          
          let attributes = [NSFontAttributeName: font]
          let textAS = NSAttributedString(string: text, attributes: attributes)
          let tmpSize = CGSize(width: width, height: 100000)
          let textRect = textAS.boundingRectWithSize(tmpSize, options: [.UsesFontLeading, .UsesLineFragmentOrigin], context: nil)
          
          return textRect.height
     }
    
    //UITableViewController Delegate Methods
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var rowHeight: CGFloat!
        
        switch (indexPath.section){
        case 0:
            rowHeight = 410.0
            break
            
        case 1:
            rowHeight = 130.0
            break
            
        case 2:
            //description
            rowHeight = calcTextHeight(productDescription, withWidth: view.frame.size.width - 10.0, andFont: UIFont(name: "OpenSans", size: 14.0)!) + 40.0
            
            print(rowHeight)
            break
            
        case 3:
            rowHeight = 190.0
            break
            
        case 4:
            rowHeight = 80.0
            break
            
        default:
            break
        }
        
        
        
        return rowHeight
    }
    
    //UITableViewController Data Source Methods
    
    //UITableViewController DataSource Methods
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
     
     func setTextWithLineSpacing(label:UILabel,text:String,lineSpacing:CGFloat)
     {
          let paragraphStyle = NSMutableParagraphStyle()
          paragraphStyle.lineSpacing = lineSpacing
          
          let attrString = NSMutableAttributedString(string: text)
          attrString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
          
          label.attributedText = attrString
     }
    
    //add cell params in args
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        switch (indexPath.section){
        case 0:
            let section0 = ProductImageCell(style: .Default, reuseIdentifier: "ProductImageCellIdentifier")
            section0.backgroundColor = UIColor.whiteColor()
            
            section0.image_productImage.backgroundColor = UIColor.blackColor()
            section0.label_productName.text = "SUNSET LOVER PLAYSUIT IN NAVY PRINT"
            section0.image_productImage.image = UIImage(named: "item_1_image.jpg")
//            section0.image_productImage.contentMode = .Center
            section0.label_productName.numberOfLines = 0
            section0.label_productName.font = UIFont(name: "OpenSans-Semibold", size: 18.0)
            section0.label_productName.sizeToFit()
            section0.label_productPrice.text = "US$59.95"
            section0.label_productPrice.font = UIFont(name: "OpenSans-Bold", size: 18.0)
            section0.label_downpaymentNotice.text = "Or for 4 payments of US$14.99. Available at Afterpay"
            section0.label_downpaymentNotice.font = UIFont(name: "OpenSans", size: 12.0)
            
            cell = section0
            break
            
        case 1:
            let section1 = ProductVariationCell(style: .Default, reuseIdentifier: "ProductVariationCellIdentifier")
            
            let colorSpring = UIView(frame: CGRectZero)
            section1.contentView.addSubview(colorSpring)
//            section1.backgroundColor = UIColor.lightGrayColor()
            colorSpring.anchorInCorner(.TopLeft, xPad: 60.0, yPad: 5.0, width: 10.0, height: 10.0)
            
            let sizeSpring = UIView(frame: CGRectZero)
            section1.contentView.addSubview(sizeSpring)
//            sizeSpring.backgroundColor = UIColor.greenColor()
            sizeSpring.anchorInCorner(.TopLeft, xPad: 60.0, yPad: section1.label_size.frame.origin.y + section1.label_size.frame.size.height + 23.0, width: 10.0, height: 10.0)
            
            
            var colorCounter: Int = 0
            var xColorValue: CGFloat = 0.0
            for color in array_color{
                let colorButton = UIButton(frame: CGRectZero)
                colorButton.tag = colorCounter
                colorButton.backgroundColor = color
                section1.contentView.addSubview(colorButton)
               
                if colorCounter == 0{
                    let border = UIView(frame: CGRectZero)
                    border.backgroundColor = UIColor.clearColor()
                    border.layer.borderColor = UIColor.blackColor().CGColor
                    border.layer.borderWidth = 2.0
                    section1.addSubview(border)
                    
                    border.align(.ToTheRightCentered, relativeTo: colorSpring, padding: -3.0, width: 36.0, height: 16.0)
                    colorButton.align(.ToTheRightCentered, relativeTo: colorSpring, padding: 0.0, width: 30.0, height: 10.0)
                    
                    xColorValue = colorButton.frame.origin.x - 30.0
                }
                else{
                    colorButton.align(.ToTheRightCentered, relativeTo: colorSpring, padding: xColorValue, width: 30.0, height: 10.0)
                    
                    xColorValue = colorButton.frame.origin.x - 30.0
                }
                
                colorCounter += 1
            }
            
            var sizeCounter: Int = 0
            var xSizeValue: CGFloat = 0.0
            
            for size in array_size{
               let sizeButton = UIButton(frame: CGRectZero)
               sizeButton.tag = sizeCounter
               section1.contentView.addSubview(sizeButton)
               
               if sizeCounter == 0{
                    sizeButton.align(.ToTheRightCentered, relativeTo: sizeSpring, padding: 0.0, width: 20.0, height: 20.0)
                    sizeButton.setTitle(size, forState: .Normal)
                    sizeButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
                    sizeButton.titleLabel?.font = UIFont.systemFontOfSize(10.0)
                    sizeButton.layer.borderColor = UIColor.darkGrayColor().CGColor
                    sizeButton.layer.borderWidth = 1.0
                    sizeButton.layer.cornerRadius = 10.0
                    
                    xSizeValue = sizeButton.frame.origin.x - 35.0
               }
               else{
                    sizeButton.align(.ToTheRightCentered, relativeTo: sizeSpring, padding: xSizeValue, width: 20.0, height: 20.0)
                    sizeButton.setTitle(size, forState: .Normal)
                    sizeButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
                    sizeButton.titleLabel?.font = UIFont.systemFontOfSize(10.0)
                    sizeButton.layer.borderColor = UIColor.darkGrayColor().CGColor
                    sizeButton.layer.borderWidth = 1.0
                    sizeButton.layer.cornerRadius = 10.0
                    
                    xSizeValue = sizeButton.frame.origin.x - 35.0
               }
               
               sizeCounter += 1
            }
            
//            let button_addToCart = UIButton(frame: CGRectZero)
//            button_addToCart.backgroundColor = UIColor(0x478DC4)
//            button_addToCart.setTitle("ADD TO CART", forState: .Normal)
//            section1.contentView.addSubview(button_addToCart)
            
            
            cell = section1
            break
            
        case 2:
            let section2 = ProductDescriptionCell(style: .Default, reuseIdentifier: "ProductDescriptionCellIdentifier")
            section2.backgroundColor = UIColor.whiteColor()
            
            section2.label_itemDescription.text = productDescription
            
            cell = section2
            break
            
        case 3:
            let section3 = StyleWithCell(style: .Default, reuseIdentifier: "Section3")
            section3.backgroundColor = UIColor.whiteColor()
            section3.array_styleImage = array_style
            section3.array_stylePrice = array_stylePrice
            
//            let subView = UIScrollView(frame: CGRect(x: 0, y: 0, width: section3.frame.size.width, height: 80.0))
//            subView.backgroundColor = UIColor.whiteColor()
//            
//            
//            section3.addSubview(subView)
//            
//            
//            //        let scrollView = UIScrollView()
//            //        scrollView.backgroundColor = UIColor.blueColor()
//            //
//            let array = [0,1,2,3,4,5,6,7,8,9]
//            
//            subView.contentSize = CGSize(width: 80.0 * CGFloat(array.count), height: subView.frame.size.height)
//            for itgr in array{
//               let view = UIView(frame: CGRect(x: CGFloat(itgr)*80.0, y: 0, width: subView.frame.size.width, height: subView.frame.size.height))
//               view.contentMode = .ScaleToFill
//               view.tag = itgr + 1
//               
//               if itgr%2 == 0{
//                    view.backgroundColor = UIColor.blackColor()
//               }
//               else{
//                    view.backgroundColor = UIColor.whiteColor()
//               }
//               
//               subView.addSubview(view)
//            }
            
            cell = section3
            break
            
        case 4:
            let section4 = DisclaimerCell(style: .Default, reuseIdentifier: "Section4")
            section4.backgroundColor = UIColor.whiteColor()
            
//            let label_disclaimer = UILabel(frame: CGRectZero)
//            label_disclaimer.text = "ABN: 30156041913 COPYRIGHT (C) 2016 SHOWPO \nALL RIGHTS RESERVED\nShow Pony Group Pty Ltd"
//            label_disclaimer.numberOfLines = 0
//            label_disclaimer.textAlignment = .Center
//            label_disclaimer.font = UIFont(name: "OpenSans", size: 10.0)
//            label_disclaimer.sizeToFit()
//            section4.contentView.addSubview(label_disclaimer)
//            label_disclaimer.anchorInCenter(width: view.frame.size.width - 40.0, height: AutoHeight)
            
            cell = section4
            break
            
        default:
            break
        }
        
        
        
        
        return cell
    }
}
