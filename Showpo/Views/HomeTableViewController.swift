//
//  HomeTableViewController.swift
//  Showpo
//
//  Created by Thadz on 26/10/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class HomeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var timer: NSTimer!
    let productArray = [0,1,2,3]
    let array_size = ["2", "4", "6", "8", "10", "12"]
    let tableView = UITableView()
    
    let menuButton = UIButton()
    
    private let overlay = UIView(frame: CGRectZero)
    private let view_sizes = UIView(frame: CGRectZero)
    private let view_sizesContainer = UIView(frame: CGRectZero)
    
    private let sizesCollectionCellIdentifier = "SizesCollectionCellIdentifier"
    
    private let sizesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.clearColor()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    func revealMenu(){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        
        navigationController?.navigationBar.translucent = false
        _ = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(showTitle), userInfo: nil, repeats: false)
        
        navigationItem.titleView = UIView(frame: CGRectZero)
        
        setUpViewHeader()
        setupTableView()
        
        menuButton.setTitle("Menu", forState: .Normal)
        menuButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        menuButton.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), forControlEvents: .TouchUpInside)
        let leftBarButton = UIBarButtonItem(customView: menuButton)
//        view.addSubview(menuButton)
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .Plain, target: self, action: #selector(revealViewController().revealToggle(_:)))
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
//        navigationController?.navigationItem.leftBarButtonItem = leftBarButton
        view.backgroundColor = UIColor.whiteColor()
    }
    
    func showTitle(){
        navigationItem.titleView = UIImageView(image: UIImage(named: "showpo_logo-small"))

    }
    
    func setupSizes(){
        sizesCollectionView.dataSource = self
        sizesCollectionView.delegate = self
        sizesCollectionView.showsHorizontalScrollIndicator = false
        sizesCollectionView.registerClass(SizesCollectionCell.self, forCellWithReuseIdentifier: sizesCollectionCellIdentifier)
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.window!.addSubview(view_sizesContainer)
        
        view_sizesContainer.anchorAndFillEdge(.Bottom, xPad: 0.0, yPad: -150.0, otherSize: 150.0)
        view_sizesContainer.backgroundColor = UIColor.whiteColor()
        
        let label_sizes = UILabel(frame: CGRectZero)
        label_sizes.text = "SIZES"
        label_sizes.font = UIFont(name: "OpenSans-Semibold", size: 16.0)
        label_sizes.textAlignment = .Center
        label_sizes.sizeToFit()
        view_sizesContainer.addSubview(label_sizes)
        
        label_sizes.anchorAndFillEdge(.Top, xPad: 0.0, yPad: 20.0, otherSize: AutoHeight)
        
        view_sizesContainer.addSubview(view_sizes)
        view_sizes.anchorAndFillEdge(.Bottom, xPad: 0.0, yPad: 0.0, otherSize: 100.0)
        view_sizes.backgroundColor = UIColor.whiteColor()
        view_sizes.addSubview(sizesCollectionView)
        sizesCollectionView.anchorInCenter(width: view_sizes.frame.size.width - 24.0, height: 50.0)
    }
    
    func setupTableView(){
        tableView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 250.0, right: 0.0)
        view.addSubview(tableView)
        tableView.registerClass(HomeTableViewCell.self, forCellReuseIdentifier: "HomeTableViewCellIdentifier")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.anchorAndFillEdge(.Top, xPad: 0.0, yPad: 100.0, otherSize: view.frame.size.height)
        tableView.separatorStyle = .None
    }
    
    func setUpViewHeader(){
        let view_arrivalBanner = UIView(frame: CGRectZero)
        view_arrivalBanner.backgroundColor = UIColor(0xAED9FB)
        view.addSubview(view_arrivalBanner)
        
        view_arrivalBanner.anchorToEdge(.Top, padding: 0.0, width: view.frame.size.width, height: 35.0)
        
        let view_shippingNotice = UIView(frame: CGRectZero)
        view_shippingNotice.backgroundColor = UIColor(0xF6C2B4)
        view.addSubview(view_shippingNotice)
        
        view_shippingNotice.anchorToEdge(.Top, padding: 36.0, width: view.frame.size.width, height: 25.0)
        
        let label_newArrivals = UILabel(frame: CGRectZero)
        label_newArrivals.font = UIFont(name: "OpenSans", size: 14.0)
        label_newArrivals.textColor = UIColor(0x292828)
        label_newArrivals.text = "New Arrivals"
        label_newArrivals.textAlignment = .Center
        label_newArrivals.sizeToFit()
        view_arrivalBanner.addSubview(label_newArrivals)
        
        let xPad_newArrivals = view_arrivalBanner.center.x - label_newArrivals.frame.size.width - 13.0
        let yPad_newArrivals = view_arrivalBanner.center.y - label_newArrivals.frame.size.height/2.0
//        label_newArrivals.anchorInCorner(.TopLeft, xPad: xPad_newArrivals, yPad: yPad_newArrivals, width: label_newArrivals.frame.size.width, height: AutoHeight)
        
        let label_shopDresses = UILabel(frame: CGRectZero)
        label_shopDresses.font = UIFont(name: "OpenSans", size: 14.0)
        label_shopDresses.textColor = UIColor(0x292828)
        label_shopDresses.text = "Shop For Dresses"
        label_shopDresses.textAlignment = .Center
        label_shopDresses.sizeToFit()
        view_arrivalBanner.addSubview(label_shopDresses)
        
        let xPad_shopDresses = view_arrivalBanner.center.x - label_shopDresses.frame.size.width - 13.0
        let yPad_shopDresses = view_arrivalBanner.center.y - label_shopDresses.frame.size.height/2.0
//        label_shopDresses.anchorInCorner(.TopRight, xPad: xPad_shopDresses, yPad: yPad_shopDresses, width: label_shopDresses.frame.size.width, height: AutoHeight)
        
        let circleView = UIView(frame: CGRect(x: 0, y: 0, width: 4.0, height: 4.0))
        circleView.backgroundColor = UIColor(0x8DBDE3)
        circleView.layer.cornerRadius = 2.0
        view_arrivalBanner.addSubview(circleView)
        
        let groupWidth = label_newArrivals.frame.size.width + label_shopDresses.frame.size.width + 28.0
        let groupOrigin = view_arrivalBanner.center.x - groupWidth/2.0
        
        label_newArrivals.frame = CGRect(x: groupOrigin, y: yPad_newArrivals, width: label_newArrivals.frame.size.width, height: label_newArrivals.frame.size.height)
        circleView.frame = CGRect(x: label_newArrivals.frame.size.width + label_newArrivals.frame.origin.x + 13.0, y: view_arrivalBanner.frame.size.height/2.0 - 2.0, width: 4.0, height: 4.0)
        label_shopDresses.frame = CGRect(x: circleView.frame.origin.x + 15.0, y: yPad_shopDresses, width: label_shopDresses.frame.size.width, height: label_shopDresses.frame.size.height)
        
        let label_shippingNotice = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label_shippingNotice.text = "FREE SHIPPING THIS MONTH"
        label_shippingNotice.font = UIFont(name: "OpenSans", size: 14.0)
        label_shippingNotice.sizeToFit()
        view_shippingNotice.addSubview(label_shippingNotice)
        label_shippingNotice.center = CGPoint(x: view.center.x, y: view_shippingNotice.frame.size.height/2.0)
        
        let label_newArrivalNotice = UILabel(frame: CGRectZero)
        label_newArrivalNotice.text = "New Arrivals"
        label_newArrivalNotice.font = UIFont(name: "OpenSans-Semibold", size: 18.0)
        label_newArrivalNotice.sizeToFit()
        label_newArrivalNotice.center = CGPoint(x: view.center.x, y: 80.0)
        view.addSubview(label_newArrivalNotice)
        
        let view_filter = UIView(frame: CGRectZero)
        view_filter.layer.borderWidth = 1.0
        view_filter.layer.borderColor = UIColor.lightGrayColor().CGColor
        view.addSubview(view_filter)
        
        view_filter.anchorInCorner(.TopRight, xPad: 7.0, yPad: 67.0, width: 91.0, height: 24.0)
        
        let button_filter = UIButton(frame: CGRectZero)
        button_filter.addTarget(self, action: #selector(pushFilter), forControlEvents: .TouchUpInside)
        view.addSubview(button_filter)
        
        button_filter.anchorInCorner(.TopRight, xPad: 7.0, yPad: 67.0, width: 91.0, height: 24.0)
        
        let label_filter = UILabel(frame: CGRectZero)
        label_filter.text = "Filter"
        label_filter.font = UIFont(name: "OpenSans-Semibold", size: 12.0)
        
        let image_filter = UIImage(named: "filter")
        let filterGroupWidth = label_filter.frame.size.width + (image_filter?.size.width)! + 3.0
        let filterGroupOrigin = filterGroupWidth + 4.0
        
        let imageView_filter = UIImageView(image: image_filter)
        
        view_filter.addSubview(imageView_filter)
        view_filter.addSubview(label_filter)
        
        imageView_filter.frame = CGRect(x: filterGroupOrigin, y: 6.0, width: (image_filter?.size.width)!, height: (image_filter?.size.height)!)
        
        label_filter.frame = CGRect(x: imageView_filter.frame.origin.x + (image_filter?.size.width)! + 6.0, y: 12.0 - (image_filter?.size.height)!, width: (image_filter?.size.width)!, height: (image_filter?.size.height)!)
        label_filter.sizeToFit()

    }
    
    func pushFilter(){
        let filterViewController = FilterViewController()
        navigationController?.pushViewController(filterViewController, animated: true)
    }
    
    func prepareHeaderPageControl() -> UIView{
        let headerView = UIView()
        
        let pageControl = UIPageControl(frame: CGRect(x: 0, y: 10.0, width: 320.0, height: 36.0))
        pageControl.tag = 12
        pageControl.numberOfPages = 10
        pageControl.autoresizingMask = .None
        
        let imageScroll = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100.0))
        imageScroll.tag = 1
        imageScroll.autoresizingMask = .None
        
        setupScrollView(imageScroll)
        
        headerView.addSubview(imageScroll)
        headerView.addSubview(pageControl)
        
        return headerView
    }
    
    func setupScrollView(scrollView: UIScrollView){
        
        let array = [0,1,2,3,4,5,6,7,8,9]
        
        
        for itgr in array{
            let view = UIView(frame: CGRect(x: CGFloat(itgr)*scrollView.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            view.contentMode = .ScaleToFill
            view.tag = itgr + 1
            
            if itgr%2 == 0{
                view.backgroundColor = UIColor.blackColor()
            }
            else{
                view.backgroundColor = UIColor.whiteColor()
            }
            
            scrollView.addSubview(view)
        }
        
        scrollView.contentSize = CGSize(width: CGFloat(array.count)*scrollView.frame.size.width, height: scrollView.frame.size.height)
        
//        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: #selector(scrollingTimer), userInfo: nil, repeats: true)
    }
    
    func scrollingTimer(){
        let scrMain = view.viewWithTag(1) as! UIScrollView
        let pageCtr = view.viewWithTag(12) as! UIPageControl
        
        let contentOffset = scrMain.contentOffset.x
        let nextPage :CGFloat = contentOffset/scrMain.frame.size.width + 1
        
        if nextPage != 10{
            scrMain.scrollRectToVisible(CGRectMake(nextPage*scrMain.frame.size.width, 0, scrMain.frame.size.width, scrMain.frame.size.height), animated: true)
            pageCtr.currentPage = Int(nextPage)
        }
        else{
            scrMain.scrollRectToVisible(CGRectMake(0.0, 0.0, scrMain.frame.size.width, scrMain.frame.size.height), animated: true)
            pageCtr.currentPage = 0
        }
     }
    
    func pushProductDetail(sender: UIButton!){
        print("pushProductDetail")
        let product = ProductDetailsTableViewController()
        self.navigationController?.pushViewController(product, animated: true)
    }
    
    func showSizes(sender: UIButton!){
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appDelegate.window!.addSubview(overlay)
        overlay.fillSuperview()
        overlay.backgroundColor = UIColor.blackColor().alpha(0.5)
        setupSizes()
        
        UIView.animateWithDuration(0.2, animations: {
            self.view_sizesContainer.anchorAndFillEdge(.Bottom, xPad: 0.0, yPad: 0.0, otherSize: 150.0)
        })
    }
    
    func favoriteItem(sender: UIButton!){
        sender.userInteractionEnabled = false
        print("sender ",sender.tag)
        print("origin: ", sender.frame.origin)
        
        let point = sender.convertPoint(sender.center, toView: view)
        print("point in view: ", point)
        
        let label = UILabel(frame: CGRect(origin: CGPoint(x: point.x/2.0, y: point.y), size: CGSizeZero))
        label.text = "point!"
        label.center = CGPoint(x: point.x/2.0, y: point.y)
        label.sizeToFit()
        
        let heartView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40.0, height: 40.0))
        heartView.center = CGPoint(x: point.x/2.0, y: point.y)
        heartView.backgroundColor = UIColor.blackColor()
        heartView.image = UIImage(named: "fave-color")
        heartView.contentMode = .Center
        
        
        view.addSubview(heartView)
        
        heartView.animationCompletion = {
            heartView.removeFromSuperview()
            sender.userInteractionEnabled = true
        }
        
        
//
//        label.animationCompletion = {
//            label.removeFromSuperview()
//            sender.userInteractionEnabled = true
//        };
//
        
        if sender.tag % 2 == 0{
            let purple : UIColor = UIColor.clearColor();
            heartView.moveX()(150.0).bounce().makeBackground()(purple).easeIn().anchorTopLeft()
                .thenAfter()(0.2).rotate()(95).easeBack().wait()(0.2)
                .thenAfter()(0.5).moveY()(300).easeIn().makeOpacity()(0.0).animate()(0.4);
        }
        else {
            let purple : UIColor = UIColor.clearColor();
            heartView.moveX()(-50.0).bounce().makeBackground()(purple).easeIn().anchorTopLeft()
                .thenAfter()(0.2).rotate()(95).easeBack().wait()(0.2)
                .thenAfter()(0.5).moveY()(300).easeIn().makeOpacity()(0.0).animate()(0.4);
        }
        
        
        
        if sender.selected{
            sender.selected = false
        }
        else{
            sender.selected = true
        }
    }
    
    //UITableViewController Delegate Methods
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var rowHeight: CGFloat!
        
        if indexPath.section == 0{
            rowHeight = 208.0
        }
        else{
            rowHeight = 370.0
        }
        
        return rowHeight
    }
    
    //UITableViewController DataSource Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowCount: Int!
        
        if section == 0{
            rowCount = 1
        }
        else{
            if productArray.count%2 == 0{
                rowCount = productArray.count/2
            }
            else{
                rowCount = productArray.count/2 + 1
            }
        }
        
        return rowCount
    }
    
    //add cell params in args
    func setUpHomeTableViewCell(cellIndex: Int) -> HomeTableViewCell{
        let cell = HomeTableViewCell(style: .Default, reuseIdentifier: "HomeTableViewCellIdentifier")
        
        cell.label_leftDescription.text = "SUNSET LOVER PLAYSUIT IN NAVY PRINT"
        cell.label_leftDescription.numberOfLines = 0
//        cell.label_leftDescription.font = UIFont.systemFontOfSize(10.0)
        cell.label_leftDescription.sizeToFit()
        
        cell.button_leftFavorite.addTarget(self, action: #selector(favoriteItem), forControlEvents: .TouchUpInside)
        cell.button_leftFavorite.tag = cellIndex * 2
        
        cell.button_leftItem.addTarget(self, action: #selector(pushProductDetail), forControlEvents: .TouchUpInside)
        cell.button_leftItem.tag = cellIndex * 2
        
        cell.button_leftCart.addTarget(self, action: #selector(showSizes), forControlEvents: .TouchUpInside)
        cell.button_leftCart.tag = cellIndex * 2
        
        cell.label_rightDescription.text = "SUNSET LOVER PLAYSUIT IN NAVY PRINT"
        cell.label_rightDescription.numberOfLines = 0
//        cell.label_rightDescription.font = UIFont.systemFontOfSize(10.0)
        cell.label_rightDescription.sizeToFit()
        
        cell.button_rightFavorite.addTarget(self, action: #selector(favoriteItem), forControlEvents: .TouchUpInside)
        cell.button_rightFavorite.tag = (cellIndex * 2) + 1
        
        cell.button_rightItem.addTarget(self, action: #selector(pushProductDetail), forControlEvents: .TouchUpInside)
        cell.button_rightItem.tag = (cellIndex * 2) + 1
        
        cell.button_rightCart.addTarget(self, action: #selector(showSizes), forControlEvents: .TouchUpInside)
        cell.button_rightCart.tag = (cellIndex * 2) + 1
        
        cell.label_leftPrice.text = "$95.00"
//        cell.label_leftPrice.font = UIFont.systemFontOfSize(10.0)
        
        cell.label_rightPrice.text = "$89.00"
//        cell.label_rightPrice.font = UIFont.systemFontOfSize(10.0)
        
        cell.image_leftItem.image = UIImage(named: "item_1_image.jpg")
        cell.image_rightItem.image = UIImage(named: "item_2_image.jpg")
        
        return cell
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if indexPath.section == 0{
            let cell_sectionO = UITableViewCell(style: .Default, reuseIdentifier: "Section0")
            
            let subView = UIScrollView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 208.0))
            subView.backgroundColor = UIColor.whiteColor()
            
            
            cell_sectionO.addSubview(subView)
            
            
            //        let scrollView = UIScrollView()
            //        scrollView.backgroundColor = UIColor.blueColor()
            //
            let array = [0,1,2,3,4,5,6,7,8,9]
            
            subView.contentSize = CGSize(width: subView.frame.size.width * CGFloat(array.count), height: subView.frame.size.height)
            for itgr in array{
                let view = UIImageView(frame: CGRect(x: CGFloat(itgr)*subView.frame.size.width, y: 0, width: subView.frame.size.width, height: subView.frame.size.height))
                view.contentMode = .ScaleToFill
                view.tag = itgr + 1
                
                if itgr%2 == 0{
//                    view.backgroundColor = UIColor.blackColor()
                    view.image = UIImage(named: "item_2_image.jpg")
                    view.contentMode = .Top
                }
                else if itgr%3 == 0{
                    view.backgroundColor = UIColor.whiteColor()
                    view.image = UIImage(named: "item_3_image.jpg")
                    view.contentMode = .Top
                }
                else{
//                    view.backgroundColor = UIColor.blackColor()
                    view.image = UIImage(named: "item_4_image.jpg")
                    view.contentMode = .Top
                }
                
                subView.addSubview(view)
            }
            
            cell = cell_sectionO
        }
        else{
            let homeCell = setUpHomeTableViewCell(indexPath.row)
            
            
            
            cell = homeCell
        }
        
//        let cell = HomeTableViewCell(style: .Default, reuseIdentifier: "HomeTableViewCellIdentifier")
//        
//        cell.label_leftDescription.text = "SUNSET LOVER PLAYSUIT IN NAVY PRINT"
//        cell.label_leftDescription.numberOfLines = 0
//        cell.label_leftDescription.font = UIFont.systemFontOfSize(10.0)
//        cell.label_leftDescription.sizeToFit()
//        
//        cell.label_rightDescription.text = "SUNSET LOVER PLAYSUIT IN NAVY PRINT"
//        cell.label_rightDescription.numberOfLines = 0
//        cell.label_rightDescription.font = UIFont.systemFontOfSize(10.0)
//        cell.label_rightDescription.sizeToFit()
//        
//        cell.label_leftPrice.text = "$95.00"
//        cell.label_leftPrice.font = UIFont.systemFontOfSize(10.0)
//        
//        cell.label_rightPrice.text = "$89.00"
//        cell.label_rightPrice.font = UIFont.systemFontOfSize(10.0)
        
        return cell
    }
    
    //Collection View Delegate and Data Source Methods
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var itemCount: Int = 0
        
        if collectionView == sizesCollectionView{
            itemCount = array_size.count
        }
        
        return itemCount
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        if collectionView == sizesCollectionView{
            cell = prepareSizesCell(indexPath)
        }
        
        return cell
    }
    
    
    
    func prepareSizesCell(indexPath: NSIndexPath) -> SizesCollectionCell{
        let cell = sizesCollectionView.dequeueReusableCellWithReuseIdentifier(sizesCollectionCellIdentifier, forIndexPath: indexPath) as! SizesCollectionCell
        
        cell.label_size.text = array_size[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var cellSize: CGSize!
        
        if collectionView == sizesCollectionView{
            print("cellSize = CGSize(width: 50.0, height: 50.0)")
            cellSize = CGSize(width: 50.0, height: 50.0)
        }
        
        return cellSize
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        UIView.animateWithDuration(0.3, animations: {
                self.view_sizesContainer.anchorAndFillEdge(.Bottom, xPad: 0.0, yPad: -150.0, otherSize: 150.0)
            }, completion: {
                (value: Bool) in
                self.view_sizesContainer.removeFromSuperview()
                self.overlay.removeFromSuperview()
        })
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        var interItemSpacing: CGFloat = 0.0
        
        if collectionView == sizesCollectionView{
            interItemSpacing = 25.0
            print("interItemSpacing = 25.0")
        }
        
        return interItemSpacing
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        var minimumLineSpacing: CGFloat = 0.0
        
        if collectionView == sizesCollectionView{
            minimumLineSpacing = 20.0
            print("interItemSpacing = 25.0")
        }
        
        return minimumLineSpacing
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
}
