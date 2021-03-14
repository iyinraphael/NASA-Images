//
//  DetailViewController.swift
//  NASA-Images
//
//  Created by Iyin Raphael on 3/13/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Property
    private let space: CGFloat = 20
    let viewModel = DetailViewModel()
    
    private var descriptionLabel: UILabel!
    private var photographerLabel: UILabel!
    private var locationLabel: UILabel!
    private var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        photographerLabel = UILabel()
        photographerLabel.translatesAutoresizingMaskIntoConstraints = false
        photographerLabel.numberOfLines = 0
        photographerLabel.textColor = Appearance.fontColor
        photographerLabel.font = Appearance.labelFont
        view.addSubview(photographerLabel)
        
        locationLabel = UILabel()
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.numberOfLines = 0
        locationLabel.textColor = Appearance.fontColor
        locationLabel.font = Appearance.labelFont
        view.addSubview(locationLabel)
        
        descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = Appearance.labelFont
        descriptionLabel.textColor = Appearance.fontColor
        view.addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: space / 2),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: space),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -space),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            
            photographerLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: space / 2),
            photographerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: space),
            
            locationLabel.topAnchor.constraint(equalTo: photographerLabel.bottomAnchor, constant: space / 2),
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: space),
            
            descriptionLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: space / 2),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: space),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -space)

        ])
        
        viewModel.title.bind { [weak self] title in
            self?.title = title
        }
        
        viewModel.image.bind { [weak self] image in
            self?.imageView.image = image
            self?.imageView.contentMode = .scaleAspectFit
        }
        
        viewModel.photographer.bind { [weak self] photographer in
            self?.photographerLabel.text = photographer
        }
        
        viewModel.location.bind { [weak self] location in
            self?.locationLabel.text = location
        }
        
        viewModel.description.bind { [weak self] description in
            self?.descriptionLabel.text = description
            self?.descriptionLabel.adjustsFontSizeToFitWidth = true
        }
    }
}
