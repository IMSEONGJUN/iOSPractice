//
//  PinterestLayout.swift
//  PinterestLayout
//
//  Created by SEONGJUN on 2020/02/01.
//  Copyright © 2020 Seongjun Im. All rights reserved.
//

import UIKit

protocol PinterestLayoutDelegate: class {
    func collectionView(_ collectionView: UICollectionView, numberOfColumn: Int, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat
}

class PinterestLayout: UICollectionViewFlowLayout {
    
    weak var delegate: PinterestLayoutDelegate!
    
    var cache = [UICollectionViewLayoutAttributes]()
    
    fileprivate var numberOfColumns = 0
    
    override init() {
        super.init()
    }
    
    convenience init(numberOfColumns: Int = 2) {
        self.init()
        self.numberOfColumns = numberOfColumns
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate var contentHeight: CGFloat = 0
    fileprivate var contentWidth: CGFloat {
        guard let collectionView = collectionView else {return 0.0}
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func prepare() {
        guard let collection = collectionView else {return}
        
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        
        var xOffset = [CGFloat]()
        var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
        
        for column in 0 ..< numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        
        
        var columnToPlacePhoto = 0
        var photoHeight:CGFloat = 0
        var updatedContentHeight:CGFloat = 0
        
        for item in 0 ..< collection.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            photoHeight = delegate.collectionView(collection, numberOfColumn: numberOfColumns, heightForPhotoAtIndexPath: indexPath)
            
            let frame = CGRect(x: xOffset[columnToPlacePhoto], y: yOffset[columnToPlacePhoto], width: columnWidth, height: photoHeight)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame
            self.cache.append(attributes)
            
        
            yOffset[columnToPlacePhoto] = yOffset[columnToPlacePhoto] + photoHeight
            
            columnToPlacePhoto = columnToPlacePhoto < (numberOfColumns - 1) ? (columnToPlacePhoto + 1) : 0
            
            updatedContentHeight = yOffset.max() ?? yOffset[columnToPlacePhoto]
            
            contentHeight = updatedContentHeight
        }

    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return cache
    }
}


