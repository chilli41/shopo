//
//  ProductImageCell.swift
//  Showpo
//
//  Created by Thadz on 07/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon

class ProductImageCell: UITableViewCell {
    
    var image_productImage: UIImageView!
    var label_productName: UILabel!
    var label_productPrice: UILabel!
    var label_downpaymentNotice: UILabel!
    let subView = UIScrollView(frame: CGRectZero)
    
    private let bannerCollectionCellIdentifier = "BannerCollectionCellIdentifier"
    
    let bannerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.clearColor()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    func setupScroll(){
        
        subView.backgroundColor = UIColor.whiteColor()
        
        
        contentView.addSubview(subView)
        
        
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
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.clearColor()
        selectionStyle = .None
        
        image_productImage = UIImageView(frame: CGRectZero)
        contentView.addSubview(image_productImage)
        
        label_productName = UILabel(frame: CGRectZero)
        label_productName.numberOfLines = 2
        contentView.addSubview(label_productName)
        
        label_productPrice = UILabel(frame: CGRectZero)
        contentView.addSubview(label_productPrice)
        
        label_downpaymentNotice = UILabel(frame: CGRectZero)
        contentView.addSubview(label_downpaymentNotice)
        
        
        contentView.addSubview(subView)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        image_productImage.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: contentView.frame.size.width, height: 300.0)
        image_productImage.contentMode = .ScaleAspectFill
        image_productImage.clipsToBounds = true
        
        subView.anchorInCorner(.TopLeft, xPad: 0, yPad: 0, width: contentView.frame.size.width, height: 300.0)
        setupScroll()
        
//        label_productName.align(.UnderMatchingLeft, relativeTo: image_productImage, padding: 5.0, width: contentView.frame.size.width - contentView.frame.size.width * 1/3, height: AutoHeight)
        
        label_productName.anchorInCorner(.TopLeft, xPad: 5.0, yPad: image_productImage.frame.size.height + 5.0, width: contentView.frame.size.width - contentView.frame.size.width * 1/3, height: AutoHeight)
        
        label_productPrice.align(.UnderMatchingLeft, relativeTo: label_productName, padding: 5.0, width: contentView.frame.size.width, height: 20.0)
        
        label_downpaymentNotice.align(.UnderMatchingLeft, relativeTo: label_productPrice, padding: 5.0, width: contentView.frame.size.width, height: 10.0)
    }
    
    //Collection View Data Source, Delegate, and Flowlayout Delegate
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var cellSize: CGSize!
        
        if collectionView == bannerCollectionView{
            print("cellSize = CGSize(width: 50.0, height: 50.0)")
            cellSize = CGSize(width: 50.0, height: 50.0)
        }
        
        
        return cellSize
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        var interItemSpacing: CGFloat = 0.0
        
        if collectionView == bannerCollectionView{
            interItemSpacing = 25.0
            print("interItemSpacing = 25.0")
        }
        
        
        return interItemSpacing
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        var minimumLineSpacing: CGFloat = 0.0
        
        if collectionView == bannerCollectionView{
            minimumLineSpacing = 20.0
            print("interItemSpacing = 25.0")
        }
        
        
        return minimumLineSpacing
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
}
