//
//  DetailViewController.swift
//  PinterestLayout
//
//  Created by SEONGJUN on 2020/02/01.
//  Copyright © 2020 Seongjun Im. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let imageView = UIImageView()
    
    var imageViewHeightConst:NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureImageView()
        configureConstraints()
    }
    
    private func configureImageView() {
        
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 300),
        ])
        
        imageViewHeightConst = imageView.heightAnchor.constraint(equalToConstant: 0)
        imageViewHeightConst.isActive = true
    }
    
    func set(image: UIImage) {
        let imageHeight = image.size.height
        let imageWidth = image.size.width
        let imageSizeRatio = (view.frame.width * 0.7) / imageWidth
        let constant = CGFloat(imageHeight * imageSizeRatio)
        imageViewHeightConst.constant = constant
        self.view.layoutIfNeeded()
        imageView.image = image
    }
    

   
}
