//
//  FavoritesViewController.swift
//  Showpo
//
//  Created by Thadz on 25/10/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class FavoritesViewController: UITableViewController {
    
    private let favoritesCellIdentifier = "FavoritesCellIdentifier"
    
    let array_products = ["SUNSET LOVER PLAYSUIT IN NAVY PRINT", "THE COUNTESS DRESS IN MIDNIGHT"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Favorites"
        
//        setupViews()
        
        navigationController?.navigationBar.translucent = false
        navigationItem.titleView = UIImageView(image: UIImage(named: "showpo_logo-small"))
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        tableView.registerClass(FavoritesCell.self, forCellReuseIdentifier: favoritesCellIdentifier)
        tableView.separatorStyle = .None
        
        view.backgroundColor = UIColor.whiteColor()
        
    }
    
    //Table View Delegate Methods
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35.0
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view_favorites = UIView(frame: CGRectZero)
        view_favorites.backgroundColor = UIColor.blackColor()
        view.addSubview(view_favorites)
        
        view_favorites.anchorAndFillEdge(.Top, xPad: 0.0, yPad: 0.0, otherSize: 36.0)
        
        let label_favorites = UILabel(frame: CGRectZero)
        label_favorites.text = "FAVORITES"
        label_favorites.textAlignment = .Center
        label_favorites.font = UIFont(name: "OpenSans", size: 14.0)
        label_favorites.textColor = UIColor.whiteColor()
        label_favorites.sizeToFit()
        view_favorites.addSubview(label_favorites)
        
        label_favorites.anchorInCenter(width: label_favorites.frame.size.width, height: label_favorites.frame.size.height)
        
        return view_favorites
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 95.0
    }
    
    //Table View Data Source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array_products.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        let favoritesCell = prepareFavoritesCell(indexPath)
        favoritesCell.label_productName.text = array_products[indexPath.row]
        favoritesCell.label_productName.sizeToFit()
        
        favoritesCell.label_productPrice.text = "US$59.95"
        favoritesCell.label_productPrice.sizeToFit()
        cell = favoritesCell
        
        return cell
    }
    
    func prepareFavoritesCell(indexPath: NSIndexPath) -> FavoritesCell{
        let cell = FavoritesCell(style: .Default, reuseIdentifier: favoritesCellIdentifier)
        
        return cell
    }
    
}
