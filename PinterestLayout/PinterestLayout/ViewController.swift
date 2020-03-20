//
//  ViewController.swift
//  PinterestLayout
//
//  Created by SEONGJUN on 2020/02/01.
//  Copyright © 2020 Seongjun Im. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var collection: UICollectionView!
    
    fileprivate var data = ["16","25","11","12","13","14","15","17","18","19","01","02","03","04","05","06","07","08","09","10"
    ,"20","21","22","23","24"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pinterest"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let layout = PinterestLayout(numberOfColumns: 2)
        layout.delegate = self
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        collection = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        collection.register(PinterestCell.self, forCellWithReuseIdentifier: "CellID")
        collection.backgroundColor = .white
        collection.dataSource = self
        collection.delegate = self
        collection.isScrollEnabled = true
        
        view.addSubview(collection)
    }


}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath) as! PinterestCell
        let image = UIImage(named: self.data[indexPath.item])
        cell.image = image
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dv = DetailViewController()
        dv.set(image: UIImage(named: self.data[indexPath.item])!)
        navigationController?.pushViewController(dv, animated: true)
    }
}

extension ViewController: PinterestLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfColumn: Int, heightForPhotoAtIndexPath indexPath: IndexPath) -> CGFloat {
        let image = UIImage(named: self.data[indexPath.item])!
        let imageHeight = image.size.height
        let imageWidth = image.size.width
        let columnRatio: CGFloat = 1/CGFloat(numberOfColumn)
        let imageSizeRatio = (collectionView.frame.width * columnRatio) / imageWidth
        return imageHeight * imageSizeRatio
    }
    
    
    
}
