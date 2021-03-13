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
    var titleLabel: UILabel!
    
    var itemAsset: ItemAsset? {
        didSet {
            updateView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let radius: CGFloat = 5
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.layer.masksToBounds = true
        view.layer.cornerRadius = radius
        addSubview(view)
        
        assetImageView = UIImageView()
        assetImageView.translatesAutoresizingMaskIntoConstraints = false
        assetImageView.backgroundColor = .gray
        assetImageView.contentMode = .scaleAspectFit
        assetImageView.layer.masksToBounds = true
        assetImageView.layer.cornerRadius = radius
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.textColor = .black
        
        view.addSubview(assetImageView)
        view.addSubview(titleLabel)
        
        let spacing: CGFloat = 6
        
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.widthAnchor.constraint(equalTo: widthAnchor),
            view.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7),
            
            assetImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: spacing),
            assetImageView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -spacing + (-spacing)),
            assetImageView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -spacing),
            
            titleLabel.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    private func updateView() {
        titleLabel.text = itemAsset?.data[0].title
    }
}
