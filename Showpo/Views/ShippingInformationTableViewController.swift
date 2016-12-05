//
//  ShippingInformationTableViewController.swift
//  Showpo
//
//  Created by Thadz on 11/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit

class ShippingInformationTableViewController: UITableViewController {
    
    let addressCellIdentifier = "AddressTableViewCellIdentifier"
    let shippingAddressCellIdentifier = "ShippingAddressCellIdentifier"
    let deliveryOptionsCellIdentifier = "DeliveryOptionsCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerClass(AddressTableViewCell.self, forCellReuseIdentifier: addressCellIdentifier)
        view.backgroundColor = UIColor.whiteColor()
    }
    
    //Table View Controller Delegate Methods
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        
    }
    
    //Table View Controller Data Source Methods
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let addressCell = AddressTableViewCell(style: .Default, reuseIdentifier: addressCellIdentifier)
        
        return addressCell
    }

}
