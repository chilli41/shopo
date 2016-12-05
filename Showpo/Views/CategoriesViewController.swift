//
//  CategoriesViewController.swift
//  Showpo
//
//  Created by Thadz on 25/10/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class CategoriesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    private let array_categories = ["DRESSES", "OUTERWEAR", "TOPS", "BOTTOMS", "SLEEP & LOUNGE", "SWIM", "INTIMATES", "ACCESSORIES"]
    private let array_images = ["dress", "outwear", "top", "jeans", "pajamas", "swimsuit", "intimates", "accessories"]
    
    private let categoryCellID = "categoryCellIdentifier"
    
    private var categoryCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Categories"
        view.backgroundColor = UIColor.whiteColor()
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.itemSize = CGSizeMake(view.frame.size.width/2 - 1, 103.0)
        flowlayout.sectionInset = UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 0)
        flowlayout.minimumInteritemSpacing = 1.0
        flowlayout.minimumLineSpacing = 1.0
        
        categoryCollection = UICollectionView(frame: CGRectZero, collectionViewLayout: flowlayout)
        
//        collectionView?.registerClass(CategoryCell.self, forCellWithReuseIdentifier: categoryCellID)
        categoryCollection.registerClass(CategoryCell.self, forCellWithReuseIdentifier: categoryCellID)
        categoryCollection.dataSource = self
        categoryCollection.delegate = self
        
        
        navigationController?.navigationBar.translucent = false
        navigationItem.titleView = UIImageView(image: UIImage(named: "showpo_logo-small"))
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        view.backgroundColor = UIColor.whiteColor()
        
        setupViews()
    }
    
    func setupViews(){
        let view_categories = UIView(frame: CGRectZero)
        view_categories.backgroundColor = UIColor.blackColor()
        view.addSubview(view_categories)
        
        view_categories.anchorAndFillEdge(.Top, xPad: 0.0, yPad: 0.0, otherSize: 35.0)
        
        let label_categories = UILabel(frame: CGRectZero)
        label_categories.text = "CATEGORIES"
        label_categories.textAlignment = .Center
        label_categories.font = UIFont(name: "OpenSans", size: 14.0)
        label_categories.textColor = UIColor.whiteColor()
        label_categories.sizeToFit()
        view_categories.addSubview(label_categories)
        
        label_categories.anchorInCenter(width: label_categories.frame.size.width, height: label_categories.frame.size.height)
        
        view.addSubview(categoryCollection)
        categoryCollection.backgroundColor = UIColor.lightGrayColor()
        categoryCollection.align(.UnderCentered, relativeTo: view_categories, padding: 0.0, width: view.frame.size.width, height: 103.0 * 4)
        
        let button_sale = UIButton(frame: CGRectZero)
        button_sale.setTitle("SALE", forState: .Normal)
        button_sale.titleLabel?.font = UIFont(name: "OpenSans-Semibold", size: 24.0)
        button_sale.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button_sale.backgroundColor = UIColor(0xBD3D3D)
        view.addSubview(button_sale)
        
        button_sale.align(.UnderCentered, relativeTo: categoryCollection, padding: 0.0, width: view.frame.size.width, height: 100.0)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(categoryCellID, forIndexPath: indexPath) as! CategoryCell
        cell.image_category.image = UIImage(named: array_images[indexPath.row])
        cell.image_category.contentMode = .Center
        
        let attributedString_category = NSMutableAttributedString(string: array_categories[indexPath.row])
        attributedString_category.addAttribute(NSKernAttributeName, value: 1.0, range: NSMakeRange(0, attributedString_category.length))
        
        cell.label_category.attributedText = attributedString_category
        cell.label_category.sizeToFit()
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array_categories.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        print("sizeforitematindexpath")
        
        return CGSizeMake(collectionView.frame.size.width/2 - 1, 103.0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 1.0
    }
    
    
    
    
    
}
