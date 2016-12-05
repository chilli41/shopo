//
//  CheckoutProcessTableViewController.swift
//  Showpo
//
//  Created by Thadz on 15/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class CheckoutProcessTableViewController: UITableViewController {
    
    let addressIdentifier = "ShippingAddressCellIdentifier"
    let paymentIdentifier = "PaymentCellIdentifier"
    let cartItemsIdentifier = "CartTableViewCellIdentifier"
    let nextIdentifier = "NextProcessCellIdentifier"
    let addAddressIdentifier = "AddAddressIdentifier"
    let shippingOptionsIdentifier = "ShippingOptionsIdentifier"

    let array_products = ["SUNSET LOVER PLAYSUIT IN NAVY PRINT", "THE COUNTESS DRESS IN MIDNIGHT"]
    let array_names = ["Jane Smith", "Jane Smith", "Jane Smith", "Jane Smith"]
    let array_street = ["8567 Golden Star Drive", "668 Newbridge Ave.", "8567 Golden Star Drive", "668 Newbridge Ave."]
    let array_city = ["Oceanside, NY 11572", "Winter Park, FL 32792", "Oceanside, NY 11572", "Winter Park, FL 32792"]
    let array_payment = ["Credit Card", "Paypal", "Afterpay"]
    let array_payImage = ["paymentopt-card", "paymentopt-paypal", "paymentopt-afterpay"]
    let array_shippingOptions = ["Express Shipping (Free)", "Leave Parcel Without Signature"]
    
    private var isShowPayment: Bool = false
    private var isShowConfirmation: Bool = false
    private var isShowShipping: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 50.0, right: 0.0)
        
        tableView.registerClass(CartTableViewCell.self, forCellReuseIdentifier: cartItemsIdentifier)
        tableView.registerClass(ShippingAddressCell.self, forCellReuseIdentifier: addressIdentifier)
        tableView.registerClass(PaymentCell.self, forCellReuseIdentifier: paymentIdentifier)
        tableView.registerClass(CheckOutProcessNextCell.self, forCellReuseIdentifier: nextIdentifier)
        tableView.registerClass(AddAddressCell.self, forCellReuseIdentifier: addAddressIdentifier)
        tableView.registerClass(ShippingOptionsCell.self, forCellReuseIdentifier: shippingOptionsIdentifier)
        
        tableView.separatorStyle = .None
        
        navigationController?.navigationBar.translucent = false
        navigationItem.titleView = UIImageView(image: UIImage(named: "showpo_logo-small"))
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        view.backgroundColor = UIColor.whiteColor()
    }
    
    func showPayment(){
        print("showPayment")
        isShowPayment = true
        isShowShipping = false
        tableView.reloadData()
    }
    
    func showConfirmation(){
        isShowShipping = true
        isShowPayment = false
        tableView.reloadData()
        print("showConfirmation")
    }
    
    func showNewAddress(){
        let newAddressNavigation = UINavigationController()
        let newAddressViewController = NewAddressTableViewController()
        
        newAddressNavigation.addChildViewController(newAddressViewController)
        navigationController?.pushViewController(newAddressViewController, animated: true)
    }
    
    //Table View Controller Delegate Methods
    
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        var headerHeight : CGFloat = 0.0
        
        if section == 0 && isShowShipping{
            headerHeight = 96.0
        }
        else if section == 4 && isShowPayment{
            headerHeight = 96.0
        }
        
        return headerHeight
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        
        let headerView = UIView()
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 96.0)
        headerView.backgroundColor = UIColor.whiteColor()
        
        if section == 0 && isShowShipping{
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
        }
        else if section == 4 && isShowPayment{
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
        }
        
        return headerView
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        print("section: ", indexPath.section)
        if indexPath.section == 0{
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
            
        else if indexPath.section == 2{
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
        else if indexPath.section == 4{
            let selectedCell = tableView.cellForRowAtIndexPath(indexPath) as! PaymentCell
            selectedCell.view_addressRadio.backgroundColor = UIColor.greenColor()
            let selectedIndex = indexPath.row
            
            var cellCounter: Int = 0
            for _ in array_names{
                let itemIndexPath = NSIndexPath(forItem: cellCounter, inSection: indexPath.section)
                
                
                if cellCounter != selectedIndex{
                    if let deselect = tableView.cellForRowAtIndexPath(itemIndexPath) as? PaymentCell{
                        deselect.view_addressRadio.backgroundColor = UIColor.clearColor()
                    }
                }
                
                cellCounter += 1
            }
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var rowHeight: CGFloat = 0.0
        let nextCell: CGFloat = 100.0
        
        switch (indexPath.section) {
        case 0:
            rowHeight = 107.0
            
            break
            
        case 1:
//            rowHeight = nextCell
            rowHeight = 130.0
//            rowHeight = 69.0
            break
            
        case 2:
            rowHeight = 69.0
            break
            
        case 3:
            rowHeight = nextCell
            break

        case 4:
            rowHeight = 69.0
            
            break
            
        case 5:
            rowHeight = nextCell
            
            break
            
        default:
            break
        }
        
        return rowHeight
    }
    
    //Table View Controller Data Source Methods
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //2 shipping, 2 payment, 4 confirmation
//        return 10
        return 6
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount: Int = 0
        
        switch (section){
            
            //shipping: address table
        case 0:
            
            if isShowShipping{
                rowCount = array_city.count
            }
            else{
                rowCount = 0
            }
            
            break
            
            //shipping: next button
        case 1:
            if isShowShipping{
                rowCount = 1
            }
            else{
                rowCount = 0
            }
            break
            
        case 2:
            if isShowShipping{
                rowCount = array_shippingOptions.count
            }
            else{
                rowCount = 0
            }
            break
            
        case 3:
            if isShowShipping {
                rowCount = 1
            }
            else{
                rowCount = 0
            }
            
            //payment: payment modes
        case 4:
            if isShowPayment{
                rowCount = array_payment.count
            }
            else{
                rowCount = 0
            }
            
            break
            
            //payment: next button
        case 5:
            if isShowPayment{
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
        
        switch (indexPath.section) {
        case 0:
            let addressCell = prepareAddressCell(indexPath)
            cell = addressCell
            break
            
        case 1:
            let addAddressCell = prepareAddAddressCell(indexPath)
            cell = addAddressCell
            break
            
        case 2:
            let shippingOptionsCell = prepareShippingOptionsCell(indexPath)
            cell = shippingOptionsCell
            break
            
        case 3:
            let addressNextCell = prepareNextProcessCell(indexPath)
            addressNextCell.button_next.addTarget(self, action: #selector(showPayment), forControlEvents: .TouchUpInside)
            cell = addressNextCell
            break
            
        case 4:
            let paymentCell = preparePaymentCell(indexPath)
            cell = paymentCell
            break
            
        case 5:
            let paymentNextCell = prepareNextProcessCell(indexPath)
            paymentNextCell.button_next.addTarget(self, action: #selector(showConfirmation), forControlEvents: .TouchUpInside)
            cell = paymentNextCell
            break
            
        default:
            break
        }
        
        return cell
    }
    
    //Prepare Cells
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
        let paymentCell = PaymentCell(style: .Default, reuseIdentifier: "PaymentCellIdentifier")
        
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
        
        return nextProcessCell
    }
    
    
    
}
