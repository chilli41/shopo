//
//  ShowpoTabBarController.swift
//  Showpo
//
//  Created by Thadz on 25/10/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import HexColor

class ShowpoTabBarController: UITabBarController {
    var controllerArray = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create view controller instances and set titles
        let accountNavigation = UINavigationController()
        accountNavigation.title = "Account"
        accountNavigation.tabBarItem.image = UIImage(named: "account")
        
        let account = AccountViewController()
        account.title = "Account"
        account.tabBarItem.image = UIImage(named: "account")
        
        accountNavigation.addChildViewController(account)
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.itemSize = CGSizeMake(40.0, 103)
        flowlayout.sectionInset = UIEdgeInsets(top: 20, left: 1, bottom: 10, right: 0)
        
        let categories = CategoriesViewController()
        categories.title = "Categories"
        categories.tabBarItem.image = UIImage(named: "categories")
        
        let catNavigation = UINavigationController()
        catNavigation.title = "Categories"
        catNavigation.addChildViewController(categories)
        
        let homeNavigation = UINavigationController()
        homeNavigation.title = "Home"
        homeNavigation.tabBarItem.image = UIImage(named: "home")
        
        let home = HomeTableViewController()
        home.title = "Home"
        home.tabBarItem.image = UIImage(named: "home")
        
        homeNavigation.addChildViewController(home)
        
        let favorites = FavoritesViewController()
        favorites.title = "Favorites"
        favorites.tabBarItem.image = UIImage(named: "fave")
        
        let favoritesNavigation = UINavigationController()
        favoritesNavigation.title = "Favorites"
        favoritesNavigation.tabBarItem.image = UIImage(named: "fave")
        favoritesNavigation.addChildViewController(favorites)
        
        let checkOutNavigation = UINavigationController()
        checkOutNavigation.title = "Checkout"
        checkOutNavigation.tabBarItem.image = UIImage(named: "cart")
        
        let checkOut = CheckoutProcessTableViewController()
        checkOut.title = "Checkout"
        checkOut.tabBarItem.image = UIImage(named: "cart")
        
        checkOutNavigation.addChildViewController(checkOut)
        
        let cartNavigation = UINavigationController()
        cartNavigation.title = "Cart"
        cartNavigation.tabBarItem.image = UIImage(named: "cart")
        
        let cart = CartTableViewController()
        cart.title = "Cart"
        cart.tabBarItem.image = UIImage(named: "cart")
        
        cartNavigation.addChildViewController(cart)
        
        let login = LoginViewController()
        login.title = "Account"
        login.tabBarItem.image = UIImage(named: "account")
        
        let registration = RegistrationViewController()
        registration.title = "Account"
        registration.tabBarItem.image = UIImage(named: "account")
        
        //add view controllers to tab bar controller view controller array
        controllerArray.append(accountNavigation)
        controllerArray.append(catNavigation)
        controllerArray.append(homeNavigation)
        controllerArray.append(favoritesNavigation)
        controllerArray.append(cartNavigation)
        
        self.setViewControllers(controllerArray, animated: false)
        tabBar.tintColor = UIColor(0x428AC3)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
}
