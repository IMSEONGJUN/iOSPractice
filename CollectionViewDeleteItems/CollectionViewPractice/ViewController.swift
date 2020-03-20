//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by SEONGJUN on 2020/01/28.
//  Copyright © 2020 Seongjun Im. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var data = ["cat0","cat1","cat2","cat3","cat4","cat5","cat6","cat7","cat8","cat9","bird","cat","dog","01",
    "02","03","04","05","005","006","007","008","009","010"]
    var backupData = ["cat0","cat1","cat2","cat3","cat4","cat5","cat6","cat7","cat8","cat9","bird","cat","dog","01",
    "02","03","04","05","005","006","007","008","009","010"]
    
    let layout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
    
    // MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        setupNavigationItem()
        
    }
    private func configureCollectionView() {
        configureFlowLayout()
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.allowsMultipleSelection = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "CellID")
        view.addSubview(collectionView)
    }
    
    private func configureFlowLayout() {
        let padding:CGFloat = 15
        let howManyCells = 2
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = padding
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        let availableWidth = collectionView.bounds.width - (padding * 2) - (padding * CGFloat(howManyCells - 1))
        let itemWidth = availableWidth / CGFloat(howManyCells)
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
    }
    
    private func setupNavigationItem() {
        let deleteButton = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(didTapDeleteButton))
        navigationItem.rightBarButtonItem = deleteButton
    }
    // MARK: Action
    
    @objc func didTapDeleteButton() {
        guard !collectionView.indexPathsForSelectedItems!.isEmpty else { return }
        
        collectionView.performBatchUpdates({
            print(collectionView.indexPathsForSelectedItems!)
            let nameToRemove = collectionView.indexPathsForSelectedItems?
                .map{ self.data[$0.item] }
            
            nameToRemove?.forEach{
                if let index = self.data.firstIndex(of: $0) {
                    self.data.remove(at: index)
                }
            }
            print(self.data)
            collectionView.deleteItems(at: collectionView.indexPathsForSelectedItems!)
        }, completion: nil)
        print(collectionView.indexPathsForSelectedItems!)
        if self.data.isEmpty {
            self.data = self.backupData
            collectionView.reloadData()
        }
    }
}


// MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellID", for: indexPath) as! CustomCell
        cell.isSelected = false
        cell.imageView.subviews.first?.removeFromSuperview()
        cell.set(image: UIImage(named: data[indexPath.item]))
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if cell.isSelected == true {
            markSelectedCheck(cell: cell)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CustomCell
        DispatchQueue.main.async {
            cell.imageView.subviews.first?.removeFromSuperview()
//            cell.contentView.subviews.first?.subviews.first?.removeFromSuperview()
        }
        cell.isSelected = false
        print(collectionView.indexPathsForSelectedItems!)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)!
        cell.isSelected = true
        markSelectedCheck(cell: cell)
        print(collectionView.indexPathsForSelectedItems!)

    }
    
    
}

