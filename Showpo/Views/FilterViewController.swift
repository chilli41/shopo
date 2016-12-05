//
//  FilterViewController.swift
//  Showpo
//
//  Created by Thadz on 21/11/2016.
//  Copyright © 2016 Thousandminds. All rights reserved.
//

import UIKit
import Neon
import HexColor

class FilterViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let array_color = [UIColor.blueColor(), UIColor.purpleColor(), UIColor.greenColor(), UIColor.redColor(), UIColor.lightGrayColor()]
    let array_size = ["2", "4", "6", "8", "10"]
    
    let rangeSlider = RangeSlider(frame: CGRectZero)
    
    private let sizesCollectionCellIdentifier = "SizesCollectionCellIdentifier"
    private let colorsCollectionCellIdentifier = "ColorsCollectionCellIdentifier"
    
    let sizesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.clearColor()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    let colorsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .Horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.backgroundColor = UIColor.clearColor()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.translucent = false
        navigationItem.titleView = UIImageView(image: UIImage(named: "showpo_logo-small"))
        view.backgroundColor = UIColor.whiteColor()
        setupViews()
    }
    
    func setupViews(){
        let view_filterLabelContainer = UIView(frame: CGRectZero)
        view_filterLabelContainer.backgroundColor = UIColor.blackColor()
        view.addSubview(view_filterLabelContainer)
        view_filterLabelContainer.anchorAndFillEdge(.Top, xPad: 0.0, yPad: 0.0, otherSize: 35.0)
        
        let label_filterLabel = UILabel(frame: CGRectZero)
        label_filterLabel.text = "FILTER"
        label_filterLabel.font = UIFont(name: "OpenSans", size: 14.0)
        label_filterLabel.textColor = UIColor.whiteColor()
        label_filterLabel.sizeToFit()
        view_filterLabelContainer.addSubview(label_filterLabel)
        label_filterLabel.anchorInCenter(width: label_filterLabel.frame.size.width, height: AutoHeight)
        
        let label_sortBy = setupLabel("Sort by", font: UIFont(name: "OpenSans-Semibold", size: 16.0)!, color: UIColor(0x282929))
        label_sortBy.sizeToFit()
        
        let view_newestContainer = setupContainer()
        view.addSubview(view_newestContainer)
        view_newestContainer.anchorInCorner(.TopRight, xPad: 5.0, yPad: view_filterLabelContainer.frame.size.height + 18.0, width: view.frame.size.width - label_sortBy.frame.size.width - 21.0, height: 35.0)
        
        let label_Newest = setupLabel("Newest", font: UIFont(name: "OpenSans", size: 16.0)!, color: UIColor(0x979797))
        view_newestContainer.addSubview(label_Newest)
        label_Newest.anchorInCenter(width: view_newestContainer.frame.size.width - 26.0, height: AutoHeight)
        
        view.addSubview(label_sortBy)
        label_sortBy.align(.ToTheLeftCentered, relativeTo: view_newestContainer, padding: 9.0, width: label_sortBy.frame.size.width, height: AutoHeight)
        
        let label_sizes = setupLabel("Sizes", font: UIFont(name: "OpenSans-Semibold", size: 16.0)!, color: UIColor(0x282929))
        label_sizes.sizeToFit()
        view.addSubview(label_sizes)
        label_sizes.align(.UnderMatchingLeft, relativeTo: label_sortBy, padding: 22.0, width: label_sizes.frame.size.width, height: AutoHeight)
        
        let view_sizesUnderline = UIView(frame: CGRectZero)
        view_sizesUnderline.backgroundColor = UIColor(0xBDBDBD)
        view.addSubview(view_sizesUnderline)
        view_sizesUnderline.align(.UnderMatchingLeft, relativeTo: label_sizes, padding: 5.0, width: view.frame.size.width - 12.0, height: 1.0)
        
        sizesCollectionView.dataSource = self
        sizesCollectionView.delegate = self
        sizesCollectionView.registerClass(SizesCollectionCell.self, forCellWithReuseIdentifier: sizesCollectionCellIdentifier)
        
        view.addSubview(sizesCollectionView)
        sizesCollectionView.align(.UnderMatchingLeft, relativeTo: view_sizesUnderline, padding: 12.0, width: view_sizesUnderline.frame.size.width, height: 50.0)
        
        let label_colors = setupLabel("Colors", font: UIFont(name: "OpenSans-Semibold", size: 16.0)!, color: UIColor(0x282929))
        label_colors.sizeToFit()
        view.addSubview(label_colors)
        label_colors.align(.UnderMatchingLeft, relativeTo: sizesCollectionView, padding: 22.0, width: label_colors.frame.size.width, height: AutoHeight)
        
        let view_colorsUnderline = UIView(frame: CGRectZero)
        view_colorsUnderline.backgroundColor = UIColor(0xBDBDBD)
        view.addSubview(view_colorsUnderline)
        view_colorsUnderline.align(.UnderMatchingLeft, relativeTo: label_colors, padding: 5.0, width: view.frame.size.width - 12.0, height: 1.0)
        
        colorsCollectionView.dataSource = self
        colorsCollectionView.delegate = self
        colorsCollectionView.registerClass(ColorsCollectionCell.self, forCellWithReuseIdentifier: colorsCollectionCellIdentifier)
        
        view.addSubview(colorsCollectionView)
        colorsCollectionView.align(.UnderMatchingLeft, relativeTo: view_colorsUnderline, padding: 12.0, width: view_colorsUnderline.frame.size.width, height: 20.0)
        
        let label_priceRange = setupLabel("Price Range", font: UIFont(name: "OpenSans-Semibold", size: 16.0)!, color: UIColor(0x282929))
        label_priceRange.sizeToFit()
        view.addSubview(label_priceRange)
        label_priceRange.align(.UnderMatchingLeft, relativeTo: colorsCollectionView, padding: 22.0, width: view.frame.size.width - 12.0, height: AutoHeight)
        
        let view_priceRangeUnderline = UIView(frame: CGRectZero)
        view_priceRangeUnderline.backgroundColor = UIColor(0xBDBDBD)
        view.addSubview(view_priceRangeUnderline)
        view_priceRangeUnderline.align(.UnderMatchingLeft, relativeTo: label_priceRange, padding: 5.0, width: view.frame.size.width - 12.0, height: 1.0)
        
        view.addSubview(rangeSlider)
        rangeSlider.align(.UnderMatchingLeft, relativeTo: view_priceRangeUnderline, padding: 20.0, width: view_priceRangeUnderline.frame.size.width, height: 31.0)
    }
    
    func setupContainer() -> UIView{
        let view_container = UIView(frame: CGRectZero)
        view_container.backgroundColor = UIColor(0xF8F8F8)
        view_container.layer.borderColor = UIColor(0xBDBDBD).CGColor
        view_container.layer.borderWidth = 1.0
        
        return view_container
    }
    
    func setupLabel(text: String, font: UIFont, color: UIColor) -> UILabel{
        let label = UILabel(frame: CGRectZero)
        label.font = font
        label.textColor = color
        label.text = text
        label.sizeToFit()
        
        return label
    }
    
    //Collection View Delegate and Data Source Methods
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var itemCount: Int = 0
        
        if collectionView == sizesCollectionView{
            itemCount = array_size.count
        }
        else if collectionView == colorsCollectionView{
            itemCount = array_color.count
        }
        
        return itemCount
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        
        if collectionView == sizesCollectionView{
            cell = prepareSizesCell(indexPath)
        }
        else if collectionView == colorsCollectionView{
            cell = prepareColorsCell(indexPath)
        }
        
        return cell
    }
    
    func prepareColorsCell(indexPath: NSIndexPath) -> ColorsCollectionCell{
        let cell = colorsCollectionView.dequeueReusableCellWithReuseIdentifier(colorsCollectionCellIdentifier, forIndexPath: indexPath) as! ColorsCollectionCell
        
        cell.view_colorVariation.backgroundColor = array_color[indexPath.row]
        
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
        else if collectionView == colorsCollectionView{
            cellSize = CGSize(width: 45.0, height: 25.0)
        }
        
        return cellSize
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        var interItemSpacing: CGFloat = 0.0
        
        if collectionView == sizesCollectionView{
            interItemSpacing = 25.0
            print("interItemSpacing = 25.0")
        }
        else if collectionView == colorsCollectionView{
            interItemSpacing = 5.0
        }
        
        return interItemSpacing
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        var minimumLineSpacing: CGFloat = 0.0
        
        if collectionView == sizesCollectionView{
            minimumLineSpacing = 20.0
            print("interItemSpacing = 25.0")
        }
        else if collectionView == colorsCollectionView{
            minimumLineSpacing = 8.0
        }
        
        return minimumLineSpacing
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
}
