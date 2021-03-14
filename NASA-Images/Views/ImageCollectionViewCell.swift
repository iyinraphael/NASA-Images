//
//  ImageCollectionViewCell.swift
//  NASA-Images
//
//  Created by Iyin Raphael on 3/13/21.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properites
    var assetImageView: UIImageView!
    
    var itemAsset: ItemAsset?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let radius: CGFloat = 5
        
        assetImageView = UIImageView()
        assetImageView.translatesAutoresizingMaskIntoConstraints = false
        assetImageView.contentMode = .scaleAspectFill
        assetImageView.layer.masksToBounds = true
        assetImageView.layer.cornerRadius = radius
        addSubview(assetImageView)
        
        NSLayoutConstraint.activate([
            assetImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            assetImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            assetImageView.widthAnchor.constraint(equalTo: widthAnchor),
            assetImageView.heightAnchor.constraint(equalTo: widthAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
