//
//  ViewController.swift
//  CollectionViewDragDrop
//
//  Created by SEONGJUN on 2020/01/22.
//  Copyright © 2020 Seongjun Im. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    enum Section {
        case main
    }
    
    fileprivate var items: [String] = [
        "1","2","3","4","5","6","7","8","9"
    ]
    
    fileprivate var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureCollectionView()
        
    }
    
    func configureCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        let padding:CGFloat = 4
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = padding
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        let availableWidth = view.frame.width - (padding*4)
        let itemWidth = availableWidth / 3
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.dataSource = self
        collection.delegate = self
        collection.dragDelegate = self
        collection.dragInteractionEnabled = true
        collection.dropDelegate = self
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
//        collection.contentInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        view.addSubview(collection)
    }

    func configureDataSource() {
        
    }
    
    fileprivate func reOrderItems(coordinator: UICollectionViewDropCoordinator, destinationIndexPath: IndexPath, collectionView: UICollectionView) {
        if let item = coordinator.items.first, let sourceIndexPath = item.sourceIndexPath {
            
            collectionView.performBatchUpdates({
                //remove the item
                self.items.remove(at: sourceIndexPath.item)
                
                //insert the item
                self.items.insert(item.dragItem.localObject as! String, at: destinationIndexPath.item)
                
                collectionView.deleteItems(at: [sourceIndexPath])
                collectionView.insertItems(at: [destinationIndexPath])
            }, completion: nil)
            coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
        }
        
        
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .cyan
//        cell.layer.cornerRadius = 15
//        cell.clipsToBounds = true
        let imageView = UIImageView(image: UIImage(named: self.items[indexPath.item]))
        imageView.contentMode = .scaleToFill
        cell.contentView.addSubview(imageView)
        imageView.frame = cell.contentView.frame
        cell.contentView.layer.cornerRadius = 15
        cell.contentView.clipsToBounds = true
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let square = (collectionView.frame.width - 16) / 3
//        return CGSize(width: square, height: square)
//    }
}

extension ViewController: UICollectionViewDragDelegate {
    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        print("start dragging")
        let item = self.items[indexPath.item]
        let itemProvider = NSItemProvider(object: item as NSString)
        let dragItem = UIDragItem(itemProvider: itemProvider)
        dragItem.localObject = item
        return [dragItem]
    }
    
}

extension ViewController: UICollectionViewDropDelegate {
    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {
        if collectionView.hasActiveDrag {
            print("dragging")
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        } else {
            print("stop Dragging")
            return UICollectionViewDropProposal(operation: .forbidden)
        }
    }
    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {
        let destinationIndexPath = coordinator.destinationIndexPath
        print("ready to drop")
        guard let indexPath = destinationIndexPath else {return}
        
        if coordinator.proposal.operation == .move {
            self.reOrderItems(coordinator: coordinator, destinationIndexPath: indexPath, collectionView: collectionView)
        }
    }
    
    
}

