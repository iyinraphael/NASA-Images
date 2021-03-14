//
//  DetailViewController.swift
//  NASA-Images
//
//  Created by Iyin Raphael on 3/13/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Property
    let viewModel = DetailViewModel()
    var item: ItemAsset?
    var descriptionLabel: UILabel!
    var photographerLabel: UILabel!
    var locationLabel: UILabel!
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "\(item?.data[0].title ?? "")"
        
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
        
        photographerLabel = UILabel()
        photographerLabel.translatesAutoresizingMaskIntoConstraints = false
        photographerLabel.numberOfLines = 0
        view.addSubview(photographerLabel)
        
        locationLabel = UILabel()
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.numberOfLines = 0
        view.addSubview(locationLabel)
        
        descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        view.addSubview(descriptionLabel)
        
        let space: CGFloat = 20
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: space),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            photographerLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: space),
            photographerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: space),
            
            locationLabel.topAnchor.constraint(equalTo: photographerLabel.bottomAnchor, constant: space),
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: space),
            
            descriptionLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: space),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: space),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -space)

        ])
        updateView()
    }
    
    private func updateView() {
        if !isViewLoaded { return }
        
        let itemData = item?.data[0]
        
        imageView.image = viewModel.getImage(from: item?.links[0].href)
        photographerLabel.text = itemData?.photographer
        locationLabel.text = itemData?.location
        descriptionLabel.text = itemData?.description
    }
}
