//
//  CartTableViewController.swift
//  Showpo
//
//  Created by Thadz on 09/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class CartTableViewController: UITableViewController {
    
    let array_products = ["SUNSET LOVER PLAYSUIT IN NAVY PRINT", "THE COUNTESS DRESS IN MIDNIGHT"]
    let array_names = ["Jane Smith", "Jane Smith", "Jane Smith", "Jane Smith"]
    let array_street = ["8567 Golden Star Drive", "668 Newbridge Ave.", "8567 Golden Star Drive", "668 Newbridge Ave."]
    let array_city = ["Oceanside, NY 11572", "Winter Park, FL 32792", "Oceanside, NY 11572", "Winter Park, FL 32792"]
    let array_payment = ["Credit Card", "Paypal", "Afterpay"]
    let array_payImage = ["paymentopt-card", "paymentopt-paypal", "paymentopt-afterpay"]
    let array_shippingOptions = ["Express Shipping (Free)", "Leave Parcel Without Signature"]
    
    let array_style = ["item_1_image.jpg", "item_2_image.jpg", "item_3_image.jpg", "item_4_image.jpg", "item_1_image.jpg", "item_2_image.jpg", "item_3_image.jpg", "item_4_image.jpg", "item_1_image.jpg", "item_2_image.jpg"]
    let array_stylePrice = ["US$79.95", "US$21.95", "US$24.95", "US$72.95", "US$79.95", "US$21.95", "US$24.95", "US$79.95", "US$21.95", "US$24.95"]
    
    let nextIdentifier = "CheckOutProcessNextCell"
    
    private var isShowPayment: Bool = false
    private var isShowConfirmation: Bool = false
    private var isShowShipping: Bool = false
    private var isShowCart: Bool = true
    private var isCC: Bool = false
    private var isShowBillingAddress = false
    private var isShowSuccess = false
    
    private var paymentMode: Int = 3
    
    private let addressIdentifier = "ShippingAddressCellIdentifier"
    private let paymentIdentifier = "PaymentCellIdentifier"
    private let cartItemsIdentifier = "CartTableViewCellIdentifier"
    private let orderDetailsIdentifier = "OrderDetailsCellIdentifier"
    private let addAddressIdentifier = "AddAddressIdentifier"
    private let shippingOptionsIdentifier = "ShippingOptionsIdentifier"
    private let cartCellIdentifier = "CartTableViewCellIdentifier"
    private let orderCostCellIdentifier = "OrderCostCellIdentifier"
    private let creditCardDetailCellIdentifier = "CreditCardDetailCellIdentifier"
    private let billingDetailsCellIdentifier = "BillingDetailsCellIdentifier"
    private let newAddressTableViewCellIdentifier = "NewAddressTableViewCellIdentifier"
    private let confirmHeaderCellIdentifier = "ConfirmHeaderCellIdentifier"
    private let wantMoreCellIdentifier = "WantMoreCellIdentifier"
    
    private var paymentMethod: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 50.0, right: 0.0)
        tableView.registerClass(CheckOutCell.self, forCellReuseIdentifier: "CheckOutCellIdentifier")
        tableView.registerClass(CheckOutProcessNextCell.self, forCellReuseIdentifier: nextIdentifier)
        
        tableView.registerClass(CartTableViewCell.self, forCellReuseIdentifier: cartItemsIdentifier)
        tableView.registerClass(ShippingAddressCell.self, forCellReuseIdentifier: addressIdentifier)
        tableView.registerClass(PaymentCell.self, forCellReuseIdentifier: paymentIdentifier)
        tableView.registerClass(CheckOutProcessNextCell.self, forCellReuseIdentifier: nextIdentifier)
        tableView.registerClass(AddAddressCell.self, forCellReuseIdentifier: addAddressIdentifier)
        tableView.registerClass(ShippingOptionsCell.self, forCellReuseIdentifier: shippingOptionsIdentifier)
        tableView.registerClass(OrderDetailsCell.self, forCellReuseIdentifier: orderDetailsIdentifier)
        tableView.registerClass(OrderCostCell.self, forCellReuseIdentifier: orderCostCellIdentifier)
        tableView.registerClass(CreditCardDetailsCell.self, forCellReuseIdentifier: creditCardDetailCellIdentifier)
        tableView.registerClass(BillingDetailsCell.self, forCellReuseIdentifier: billingDetailsCellIdentifier)
        tableView.registerClass(AddressTableViewCell.self, forCellReuseIdentifier: newAddressTableViewCellIdentifier)
        tableView.registerClass(ConfirmHeaderCell.self, forCellReuseIdentifier: confirmHeaderCellIdentifier)
        tableView.registerClass(WantMoreCell.self, forCellReuseIdentifier: wantMoreCellIdentifier)
        
        tableView.separatorStyle = .None
        
        navigationController?.navigationBar.translucent = false
        navigationItem.titleView = UIImageView(image: UIImage(named: "showpo_logo-small"))
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        view.backgroundColor = UIColor.whiteColor()
    }
    
    func presentCheckOutProcess(){
        let checkOut = CheckoutProcessTableViewController()
        let checkOutNavigation = UINavigationController()
        checkOutNavigation.addChildViewController(checkOut)
        
        presentViewController(checkOutNavigation, animated: true, completion: nil)
        
    }
    
    func showCart(){
        isShowCart = true
        isShowPayment = false
        isShowShipping = false
        isShowConfirmation = false
        isCC = false
        isShowBillingAddress = false
        isShowSuccess = false
        tableView.reloadData()
    }
    
    func showPayment(){
        print("showPayment")
        isShowCart = false
        isShowPayment = true
        isShowShipping = false
        isShowConfirmation = false
        isCC = false
        isShowBillingAddress = false
        isShowSuccess = false
        tableView.reloadData()
    }
    
    func showShipping(){
        isShowCart = false
        isShowShipping = true
        isShowPayment = false
        isShowConfirmation = false
        isCC = false
        isShowBillingAddress = false
        isShowSuccess = false
        tableView.reloadData()
        print("showConfirmation")
    }
    
    func showConfirmation(){
        isShowCart = false
        isShowShipping = false
        isShowPayment = false
        isShowConfirmation = true
        isCC = false
        isShowBillingAddress = false
        isShowSuccess = false
        tableView.reloadData()
    }
    
    func showSuccess(){
        isShowCart = false
        isShowShipping = false
        isShowPayment = false
        isShowConfirmation = false
        isCC = false
        isShowBillingAddress = false
        isShowSuccess = true
        tableView.reloadData()
    }
    
    func showCCDetail(){
        
    }
    
    func hideAddAddress(){
        
    }
    
    func showNewAddress(){
        let newAddressNavigation = UINavigationController()
        let newAddressViewController = NewAddressTableViewController()
        
        newAddressNavigation.addChildViewController(newAddressViewController)
        navigationController?.pushViewController(newAddressViewController, animated: true)
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var headerHeight : CGFloat = 0.0
        
        if section == 0 && isShowCart{
            headerHeight = 56.0
        }
        else if section == 2 && isShowShipping{
            headerHeight = 96.0
        }
        else if section == 6 && isShowPayment{
            headerHeight = 96.0
        }
        else if section == 11 && isShowConfirmation{
            headerHeight = 56.0
        }
        
        
        return headerHeight
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 56.0)
        headerView.backgroundColor = UIColor.whiteColor()
        
        if section == 0{
            let image_progCart = UIImage(named: "prog_cart")
            let imageView_progCart = UIImageView(image: image_progCart)
            
            headerView.addSubview(imageView_progCart)
            imageView_progCart.fillSuperview(left: 8.0, right: 8.0, top: 2.0, bottom: 2.0)
        }
        else if section == 2 && isShowShipping{
            let image_progCart = UIImage(named: "prog_shipping")
            let imageView_progCart = UIImageView(image: image_progCart)
            
            headerView.addSubview(imageView_progCart)
            imageView_progCart.anchorToEdge(.Top, padding: 0.0, width: view.frame.size.width - 16.0, height: 56.0)
            
            let label_info = UILabel()
            label_info.text = "Use this information?"
            label_info.font = UIFont(name: "OpenSans-Semibold", size: 14.0)
            label_info.textColor = UIColor(0x585858)
            label_info.sizeToFit()
            
            headerView.addSubview(label_info)
            label_info.align(.UnderMatchingLeft, relativeTo: imageView_progCart, padding: 11.0, width: label_info.frame.size.width, height: AutoHeight)
            
            let button_cart = UIButton(frame: CGRectZero)
            button_cart.addTarget(self, action: #selector(showCart), forControlEvents: .TouchUpInside)
            headerView.addSubview(button_cart)
            
            button_cart.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: 90.0, height: 56.0)
        }
        else if section == 6 && isShowPayment || isCC{
            let image_progCart = UIImage(named: "prog_pay")
            let imageView_progCart = UIImageView(image: image_progCart)
            
            headerView.addSubview(imageView_progCart)
            imageView_progCart.anchorToEdge(.Top, padding: 0.0, width: view.frame.size.width - 16.0, height: 56.0)
            
            let label_info = UILabel()
            label_info.text = "Choose payment type"
            label_info.font = UIFont(name: "OpenSans-Semibold", size: 14.0)
            label_info.textColor = UIColor(0x585858)
            label_info.sizeToFit()
            
            headerView.addSubview(label_info)
            label_info.align(.UnderCentered, relativeTo: imageView_progCart, padding: 11.0, width: label_info.frame.size.width, height: AutoHeight)
            
            let button_shipping = UIButton(frame: CGRectZero)
            button_shipping.addTarget(self, action: #selector(showShipping), forControlEvents: .TouchUpInside)
            headerView.addSubview(button_shipping)
            
            button_shipping.anchorInCorner(.TopLeft, xPad: 90.0, yPad: 0, width: 90.0, height: 56.0)
        }
        
        else if section == 11 && isShowConfirmation{
            let image_progCart = UIImage(named: "prog_confirm")
            let imageView_progCart = UIImageView(image: image_progCart)
            
            headerView.addSubview(imageView_progCart)
            imageView_progCart.fillSuperview(left: 8.0, right: 8.0, top: 2.0, bottom: 2.0)
            
            let button_payment = UIButton(frame: CGRectZero)
            button_payment.addTarget(self, action: #selector(showPayment), forControlEvents: .TouchUpInside)
            headerView.addSubview(button_payment)
            
            button_payment.anchorInCorner(.TopRight, xPad: 90.0, yPad: 0, width: 90.0, height: 56.0)
        }
        
        return headerView
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("section: ", indexPath.section)
        if indexPath.section == 2{
            let selectedCell = tableView.cellForRowAtIndexPath(indexPath) as! ShippingAddressCell
            selectedCell.view_addressRadio.backgroundColor = UIColor.greenColor()
            let selectedIndex = indexPath.row
            
            var cellCounter: Int = 0
            for _ in array_names{
                let itemIndexPath = NSIndexPath(forItem: cellCounter, inSection: indexPath.section)
                
                
                if cellCounter != selectedIndex{
                    if let deselect = tableView.cellForRowAtIndexPath(itemIndexPath) as? ShippingAddressCell{
                        deselect.view_addressRadio.backgroundColor = UIColor.clearColor()
                    }
                }
                
                cellCounter += 1
                
            }
        }
            
        else if indexPath.section == 4{
            let selectedCell = tableView.cellForRowAtIndexPath(indexPath) as! ShippingOptionsCell
            selectedCell.view_shippingOptionIndicator.backgroundColor = UIColor.greenColor()
            let selectedIndex = indexPath.row
            
            var cellCounter: Int = 0
            for _ in array_shippingOptions{
                let itemIndexPath = NSIndexPath(forItem: cellCounter, inSection: indexPath.section)
                
                
                if cellCounter != selectedIndex{
                    if let deselect = tableView.cellForRowAtIndexPath(itemIndexPath) as? ShippingOptionsCell{
                        deselect.view_shippingOptionIndicator.backgroundColor = UIColor.clearColor()
                    }
                }
                
                cellCounter += 1
            }
        }
        else if indexPath.section == 6{
            let selectedCell = tableView.cellForRowAtIndexPath(indexPath) as! PaymentCell
            
            let selectedIndex = indexPath.row
            paymentMethod = array_payment[indexPath.row]
            
            if indexPath.row == 0{
                isCC = true
                tableView.reloadData()
            }
            else{
                isCC = false
                tableView.reloadData()
            }
            
            paymentMode = indexPath.row
            
            selectedCell.view_addressRadio.backgroundColor = UIColor.greenColor()
            
            var cellCounter: Int = 0
            for _ in array_payment{
                let itemIndexPath = NSIndexPath(forItem: cellCounter, inSection: indexPath.section)
                
                
                if cellCounter != selectedIndex{
                    if let deselect = tableView.cellForRowAtIndexPath(itemIndexPath) as? PaymentCell{
                        deselect.view_addressRadio.backgroundColor = UIColor.clearColor()
                    }
                }
                
                cellCounter += 1
            }
        }
        else if indexPath.section == 8{
            let selectedCell = tableView.cellForRowAtIndexPath(indexPath) as! BillingDetailsCell
            
            if isShowBillingAddress{
                isShowBillingAddress = false
            }
            else{
                isShowBillingAddress = true
            }
            
            if isShowBillingAddress {
                selectedCell.view_addressRadio.backgroundColor = UIColor.clearColor()
            }
            else{
                selectedCell.view_addressRadio.backgroundColor = UIColor.greenColor()
            }
            
            tableView.reloadData()
            
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var rowHeight: CGFloat!
        let nextCell: CGFloat = 100.0
        
        switch (indexPath.section) {
        case 0:
            rowHeight = 110.0
            break
            
        case 1:
            rowHeight = nextCell
            break
            
        case 2:
            rowHeight = 107.0
            break
            
        case 3:
            //            rowHeight = nextCell
            rowHeight = 130.0
            //            rowHeight = 69.0
            break
            
        case 4:
            rowHeight = 69.0
            break
            
        case 5:
            rowHeight = nextCell
            break
            
        case 6:
            rowHeight = 69.0
            
            break
            
        //cc details
        case 7:
            rowHeight = 400.0
            break
            
        //billing address
        case 8:
            rowHeight = 100.0
            break
            
        //same as shipping
        case 9:
            rowHeight = 500.0
            break
            
        case 10:
            rowHeight = nextCell
            
            break
            
        case 11:
            rowHeight = 110.0
            break
            
        case 12:
            rowHeight = 158.0
            break
            
        case 13:
            rowHeight = 140.0
            break
            
        case 14:
            rowHeight = nextCell
            break
            
        case 15:
            rowHeight = 290.0
            break
            
        case 16:
            rowHeight = 238.0
            break
            
        case 17:
            rowHeight = nextCell
            break
            
        default:
            break
        }
        
        
        return rowHeight
    }
    
    
    //UITableViewController DataSource Methods
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 18
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount: Int = 0
        
        switch (section){
        case 0:
            if isShowCart{
                rowCount = array_products.count
            }
            else{
                rowCount = 0
            }
            
            
            
            break
            
        case 1:
            if isShowCart{
                rowCount = 1
            }
            else{
                rowCount = 0
            }
            
            
            break
            
        //shipping: address table
        case 2:
            
            if isShowShipping{
                rowCount = array_city.count
            }
            else{
                rowCount = 0
            }
            
            break
            
        //shipping: next button
        case 3:
            if isShowShipping{
                rowCount = 1
            }
            else{
                rowCount = 0
            }
            break
            
        case 4:
            if isShowShipping{
                rowCount = array_shippingOptions.count
            }
            else{
                rowCount = 0
            }
            break
            
        case 5:
            if isShowShipping {
                rowCount = 1
            }
            else{
                rowCount = 0
            }
            
        //payment: payment modes
        case 6:
            if isShowPayment{
                rowCount = array_payment.count
            }
            else{
                rowCount = 0
            }
            
            break
            
        case 7:
            if isCC{
                rowCount = 1
            }
            else{
                rowCount = 0
            }
            break
            
        //billing address
        case 8:
            if isCC {
                rowCount = 1
            }
            else{
                rowCount = 0
            }
            break
            
        //same as shipping
        case 9:
            if isCC && !isShowBillingAddress{
                rowCount = 1
            }
            else{
                rowCount = 0
            }
            break
            
        //payment: next button
        case 10:
            if isShowPayment{
                rowCount = 1
            }
            else{
                rowCount = 0
            }
            
            break
            
        case 11:
            if isShowConfirmation{
                rowCount = array_products.count
            }
            else{
                rowCount = 0
            }
            break
            
        case 12:
            if isShowConfirmation{
                rowCount = 1
            }
            else{
                rowCount = 0
            }
            break
            
        case 13:
            if isShowConfirmation{
                rowCount = 1
            }
            else{
                rowCount = 0
            }
            break
            
        case 14:
            if isShowConfirmation{
                rowCount = 1
            }
            else{
                rowCount = 0
            }
            break
            
        case 15:
            if isShowSuccess{
                rowCount = 1
            }
            else{
                rowCount = 0
            }
            break
            
        case 16:
            if isShowSuccess{
                rowCount = 1
            }
            else{
                rowCount = 0
            }
            break
            
        case 17:
            if isShowSuccess{
                rowCount = 1
            }
            else{
                rowCount = 0
            }
            break
            
        default:
            break
        }
        
        return rowCount
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        switch (indexPath.section){
        case 0:
            let cartCell = prepareCartCell(indexPath)
            
            cartCell.isConfirmation = false
            
            cartCell.label_productName.text = array_products[indexPath.row]
            cartCell.label_productQty.text = "2"
            cartCell.label_productSize.text = "6"
            cartCell.label_productSize.sizeToFit()
            
            cartCell.label_productPrice.text = "US$59.95"
            cartCell.label_productPrice.sizeToFit()
            
            cartCell.selectionStyle = .None
            
            cartCell.layoutSubviews()
            
            cell = cartCell
            break
            
        case 1:
            let section1 = CheckOutCell(style: .Default, reuseIdentifier: "CheckOutCellIdentifier")
            let section2 = prepareNextProcessCell(indexPath)
            section2.button_next.setTitle("CHECKOUT", forState: .Normal)
            section2.button_next.addTarget(self, action: #selector(showShipping), forControlEvents: .TouchUpInside)
            
            cell = section2
            break
            
        case 2:
            let addressCell = prepareAddressCell(indexPath)
            cell = addressCell
            break
        
        case 3:
            let addAddressCell = prepareAddAddressCell(indexPath)
            cell = addAddressCell
            break
            
        case 4:
            let shippingOptionsCell = prepareShippingOptionsCell(indexPath)
            cell = shippingOptionsCell
            break
        
        case 5:
            let addressNextCell = prepareNextProcessCell(indexPath)
            addressNextCell.button_next.addTarget(self, action: #selector(showPayment), forControlEvents: .TouchUpInside)
            cell = addressNextCell
            break
            
        case 6:
            let paymentCell = preparePaymentCell(indexPath)
            
            switch paymentMode {
            case 0:
                if indexPath.row == 0{
                    paymentCell.view_addressRadio.backgroundColor = UIColor.greenColor()
                }
                else{
                    paymentCell.view_addressRadio.backgroundColor = UIColor.clearColor()
                }
                
                break
                
            case 1:
                if indexPath.row == 1{
                    paymentCell.view_addressRadio.backgroundColor = UIColor.greenColor()
                }
                else{
                    paymentCell.view_addressRadio.backgroundColor = UIColor.clearColor()
                }
                
                break
                
            case 2:
                if indexPath.row == 2{
                    paymentCell.view_addressRadio.backgroundColor = UIColor.greenColor()
                }
                else{
                    paymentCell.view_addressRadio.backgroundColor = UIColor.clearColor()
                }
                
                break
                
            default:
                break
            }
            
            cell = paymentCell
            break
            
            //cc details
        case 7:
            let ccDetailsCell = prepareCreditCardDetailsCell(indexPath)
            cell = ccDetailsCell
            break
            
            //billing address
        case 8:
            let sameAsShipping = prepareBillingDetailsCell(indexPath)
            if isShowBillingAddress{
                sameAsShipping.view_addressRadio.backgroundColor = UIColor.greenColor()
            }
            else{
                sameAsShipping.view_addressRadio.backgroundColor = UIColor.clearColor()
            }
            
            cell = sameAsShipping
            break
            
            //same as shipping
        case 9:
            let billingAddress = prepareNewAddresCell(indexPath)
            
            cell = billingAddress
            break
            
        case 10:
            let paymentNextCell = prepareNextProcessCell(indexPath)
            paymentNextCell.button_next.addTarget(self, action: #selector(showConfirmation), forControlEvents: .TouchUpInside)
            cell = paymentNextCell
            break
            
            
        case 11:
            let cartCell = prepareCartCell(indexPath)
            
            cartCell.isConfirmation = true
            
            cartCell.label_productName.text = array_products[indexPath.row]
            cartCell.label_productQty.text = "2"
            cartCell.label_productSize.text = "6"
            cartCell.label_productSize.sizeToFit()
            
            cartCell.label_productPrice.text = "US$59.95"
            cartCell.label_productPrice.sizeToFit()
            
            cartCell.button_incQty.hidden = true
            cartCell.image_remove.hidden = true
            cartCell.label_size.hidden = true
            cartCell.label_productSize.hidden = true
            
            cartCell.layoutSubviews()
            
            cell = cartCell
            break
            
        case 12:
            let orderDetail = prepareOrderDetailsCell(indexPath)
            
            orderDetail.label_orderNumber.text = "453568654"
            orderDetail.label_purchaseDate.text = "20-November-2016"
            orderDetail.label_billingEmail.text = "janesmith@gmail.com"
            orderDetail.label_paymentMethod.text = paymentMethod
            orderDetail.selectionStyle = .None
            
            cell = orderDetail
            break
            
        case 13:
            let orderCost = prepareOrderCostCell(indexPath)
            orderCost.label_shipping.text = "$ 10.00"
            orderCost.label_subtotal.text = "$ 129.90"
            orderCost.label_total.text = "$ 139.90"
            
            cell = orderCost
            
            break
            
        case 14:
            let orderConfirmCell = prepareNextProcessCell(indexPath)
            orderConfirmCell.button_next.addTarget(self, action: #selector(showSuccess), forControlEvents: .TouchUpInside)
            cell = orderConfirmCell
            break
            
        case 15:
            let confimCell = prepareConfirmHeaderCell(indexPath)
            
            cell = confimCell
            break
            
        case 16:
            let wantCell = prepareWantMoreCell(indexPath)
            
            wantCell.array_stylePrice = array_stylePrice
            wantCell.array_styleImage = array_style
            
            cell = wantCell
            break
            
        case 17:
            let browseAgainCell = prepareNextProcessCell(indexPath)
            browseAgainCell.button_next.setTitle("BROWSE AGAIN", forState: .Normal)
            browseAgainCell.button_next.addTarget(self, action: #selector(showCart), forControlEvents: .TouchUpInside)
            cell = browseAgainCell
            break
            
        default:
            break
        }
        
        
        
        return cell
    }
    
    func prepareOrderDetailsCell(indexPath: NSIndexPath) -> OrderDetailsCell{
        let orderDetailCell = OrderDetailsCell(style: .Default, reuseIdentifier: orderDetailsIdentifier)
        
        return orderDetailCell
    }
    
    func prepareCartCell(indexPath: NSIndexPath) -> CartTableViewCell{
        let cartCell = CartTableViewCell(style: .Default, reuseIdentifier: cartCellIdentifier)
        cartCell.label_productName.text = array_products[indexPath.row]
        
        cartCell.selectionStyle = .None
        
        return cartCell
    }
    
    //Prepare Cells
    func prepareWantMoreCell(indexPath: NSIndexPath) -> WantMoreCell {
        let wantCell = WantMoreCell(style: .Default, reuseIdentifier: wantMoreCellIdentifier)
        
        return wantCell
    }
    
    func prepareConfirmHeaderCell(indexPath: NSIndexPath) -> ConfirmHeaderCell{
        let confirmCell = ConfirmHeaderCell(style: .Default, reuseIdentifier: confirmHeaderCellIdentifier)
        
        return confirmCell
    }
    
    func prepareNewAddresCell(indexPath: NSIndexPath) -> AddressTableViewCell{
        let newAddressCell = AddressTableViewCell(style: .Default, reuseIdentifier: newAddressTableViewCellIdentifier)
        
        return newAddressCell
    }
    
    func prepareBillingDetailsCell(indexPath: NSIndexPath) -> BillingDetailsCell{
        let billingDetailCell = BillingDetailsCell(style: .Default, reuseIdentifier: billingDetailsCellIdentifier)
        
        return billingDetailCell
    }
    
    func prepareCreditCardDetailsCell(indexPath: NSIndexPath) -> CreditCardDetailsCell{
        let ccDetailCell = CreditCardDetailsCell(style: .Default, reuseIdentifier: creditCardDetailCellIdentifier)
        
        return ccDetailCell
    }
    
    func prepareOrderCostCell(indexPath: NSIndexPath) -> OrderCostCell{
        let orderCostCell = OrderCostCell(style: .Default, reuseIdentifier: orderCostCellIdentifier)
        
        return orderCostCell
    }
    
    func prepareAddressCell(indexPath: NSIndexPath) -> ShippingAddressCell{
        let addressCell = ShippingAddressCell(style: .Default, reuseIdentifier: addressIdentifier)
        
        addressCell.label_userName.text = array_names[indexPath.row].uppercaseString
        addressCell.label_userName.sizeToFit()
        
        addressCell.label_userStreetAddress.text = array_street[indexPath.row]
        addressCell.label_userStreetAddress.sizeToFit()
        
        addressCell.label_userCityAddress.text = array_city[indexPath.row]
        addressCell.label_userCityAddress.sizeToFit()
        
        addressCell.selectionStyle = .None
        
        return addressCell
    }
    
    func preparePaymentCell(indexPath: NSIndexPath) -> PaymentCell{
        let paymentCell = PaymentCell(style: .Default, reuseIdentifier: paymentIdentifier)
        
        paymentCell.label_modeOfPayment.text = array_payment[indexPath.row]
        paymentCell.image_modeOfPayment.image = UIImage(named: array_payImage[indexPath.row])
        
        paymentCell.selectionStyle = .None
        
        return paymentCell
    }
    
    func prepareAddAddressCell(indexPath: NSIndexPath) -> AddAddressCell{
        let addAddressCell = AddAddressCell(style: .Default, reuseIdentifier: addAddressIdentifier)
        addAddressCell.selectionStyle = .None
        
        addAddressCell.button_addAddress.addTarget(self, action: #selector(showNewAddress), forControlEvents: .TouchUpInside)
        return addAddressCell
    }
    
    func prepareShippingOptionsCell(indexPath: NSIndexPath) -> ShippingOptionsCell{
        let shippingOptionsCell = ShippingOptionsCell(style: .Default, reuseIdentifier: shippingOptionsIdentifier)
        
        shippingOptionsCell.label_shippingOption.text = array_shippingOptions[indexPath.row]
        shippingOptionsCell.selectionStyle = .None
        
        return shippingOptionsCell
    }
    
    func prepareNextProcessCell(indexPath: NSIndexPath) -> CheckOutProcessNextCell{
        let nextProcessCell = CheckOutProcessNextCell(style: .Default, reuseIdentifier: nextIdentifier)
        nextProcessCell.selectionStyle = .None
        nextProcessCell.button_next.layer.cornerRadius = nextProcessCell.button_next.frame.size.width/128
        
        return nextProcessCell
    }

}
